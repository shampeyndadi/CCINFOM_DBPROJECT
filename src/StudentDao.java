import javax.swing.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDao{

    public void addStudent(Student student){String sqlStatement = "INSERT INTO Students (student_id, first_name, last_name, birth_date, gender, address, email, program_id, account_password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try{
            Connection connection = DatabaseConnect.getConnection();

            PreparedStatement stmt = connection.prepareStatement(sqlStatement);

            stmt.setInt(1, student.getStudentId());
            stmt.setString(2, student.getFirstName());
            stmt.setString(3, student.getLastName());
            stmt.setString(4, student.getBirthday());
            stmt.setString(5, Character.toString(student.getGender()));
            stmt.setString(6, student.getAddress());
            stmt.setString(7, student.getEmail());
            stmt.setString(8, student.getProgramId());
            stmt.setString(9, student.getPassword());

            stmt.execute();
            System.out.println(student.getStudentId() + " successfully added");

        }catch(SQLException e){
            System.out.println("Error adding student " + e.getMessage());
        }
    }

    public boolean authenticateUser(int idNumber, String password){
        String sqlStatement = "SELECT * FROM Students WHERE student_id = ? AND account_password = ?";

        try{
            Connection connection = DatabaseConnect.getConnection();

            PreparedStatement stmt = connection.prepareStatement(sqlStatement);

            stmt.setInt(1, idNumber);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }catch (SQLException e){
            JOptionPane.showMessageDialog(null, "Database error: " + e.getMessage(), "Database Error", JOptionPane.ERROR_MESSAGE);
        }

        return false;
    }

    public Object[][] searchClasses(String courseId) {
        String sqlStatement = """
        SELECT c.class_id, co.course_name, CONCAT(i.inst_first_name, ' ', i.inst_last_name) AS instructor,
               GROUP_CONCAT(DISTINCT DATE_FORMAT(c.schedule, '%a') SEPARATOR '/') AS days,
               CONCAT(DATE_FORMAT(c.schedule, '%h:%i %p'), ' - ', DATE_FORMAT(DATE_ADD(c.schedule, INTERVAL 1 HOUR), '%h:%i %p')) AS time,
               (SELECT COUNT(*) FROM Enrollments e WHERE e.class_id = c.class_id) AS enrolled,
               c.max_capacity
        FROM Classes c
        JOIN Courses co ON c.course_id = co.course_id
        JOIN Instructor i ON c.instructor_id = i.inst_id
        WHERE co.course_id = ?
        GROUP BY c.class_id
        ORDER BY c.class_id;
    """;

        try {
            Connection connection = DatabaseConnect.getConnection();
            PreparedStatement stmt = connection.prepareStatement(sqlStatement);
            stmt.setString(1, courseId);

            ResultSet rs = stmt.executeQuery();

            int rowCount = 0;
            while (rs.next()) {
                rowCount++;
            }

            rs = stmt.executeQuery();

            Object[][] classes = new Object[rowCount][6];
            int index = 0;

            while (rs.next()) {
                classes[index][0] = rs.getInt("class_id");
                classes[index][1] = rs.getString("course_name");
                classes[index][2] = rs.getString("instructor");
                classes[index][3] = rs.getString("days") + " " + rs.getString("time");
                classes[index][4] = rs.getInt("enrolled");
                classes[index][5] = rs.getInt("max_capacity");
                index++;
            }

            return classes;

        } catch (SQLException e) {
            System.err.println("Error searching for classes: " + e.getMessage());
            return new Object[0][0];
        }
    }

    public boolean checkPrerequisites(int studentId, int classId){
        String checkSQL = """
        SELECT COUNT(*) AS unmet_prerequisites
        FROM Prerequisites p
        LEFT JOIN CompletedCourses cc ON p.prerequisite_id = cc.course_id AND cc.student_id = ?
        WHERE p.course_id = (SELECT course_id FROM Classes WHERE class_id = ?)
          AND (cc.course_id IS NULL OR cc.status != 'Completed');
    """;

        try {
            Connection connection = DatabaseConnect.getConnection();
            PreparedStatement stmt = connection.prepareStatement(checkSQL);

            stmt.setInt(1, studentId);
            stmt.setInt(2, classId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                boolean prerequisitesMet = rs.getInt("unmet_prerequisites") == 0;
                if (!prerequisitesMet) {
                    JOptionPane.showMessageDialog(null, "Cannot enroll: Student has not completed all prerequisites.", "Prerequisite Check Failed", JOptionPane.WARNING_MESSAGE);
                }
                return prerequisitesMet;
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Database error while checking prerequisites: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }

        return false;
    }


    public boolean checkClassCapacity(int classId) {
        String capacitySQL = """
        SELECT max_capacity - (SELECT COUNT(*) FROM Enrollments WHERE class_id = ?) AS available_slots
        FROM Classes
        WHERE class_id = ?;
    """;

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(capacitySQL)) {

            stmt.setInt(1, classId);
            stmt.setInt(2, classId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int availableSlots = rs.getInt("available_slots");
                if (availableSlots <= 0) {
                    JOptionPane.showMessageDialog(null, "Cannot enroll: Class is already full.", "Capacity Check Failed", JOptionPane.WARNING_MESSAGE);
                    return false;
                }
                return true;
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Database error while checking class capacity: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }

        return false;
    }

    public boolean checkCourseStatus(int studentId, String courseId) {
        String checkSQL = "SELECT status FROM CompletedCourses WHERE student_id = ? AND course_id = ?";

        try {
            Connection connection = DatabaseConnect.getConnection();
            PreparedStatement stmt = connection.prepareStatement(checkSQL);

            stmt.setInt(1, studentId);
            stmt.setString(2, courseId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String status = rs.getString("status");
                if ("In Progress".equalsIgnoreCase(status) || "Completed".equalsIgnoreCase(status)) {
                    JOptionPane.showMessageDialog(null, "Cannot enroll: Student has already taken or is currently enrolled in this course.", "Enrollment Error", JOptionPane.WARNING_MESSAGE);
                    return true;
                }
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Database error while checking course status: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }

        return false;
    }

    public void enrollStudent(int studentId, int classId, String courseId) {
        if (checkCourseStatus(studentId, courseId)) {
            System.out.println("Cannot enroll: Student has already taken or is currently enrolled in this course.");
            return;
        }

        if (!checkPrerequisites(studentId, classId)) {
            System.out.println("Cannot enroll: Student has not completed all prerequisites.");
            return;
        }

        if (!checkClassCapacity(classId)) {
            System.out.println("Cannot enroll: Class is already full.");
            return;
        }

        String enrollSQL = "INSERT INTO Enrollments (student_id, class_id) VALUES (?, ?)";
        String completedCoursesSQL = "INSERT INTO CompletedCourses (student_id, course_id, status) VALUES (?, ?, 'In Progress')";

        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement enrollStmt = conn.prepareStatement(enrollSQL);
             PreparedStatement completedCoursesStmt = conn.prepareStatement(completedCoursesSQL)) {

            enrollStmt.setInt(1, studentId);
            enrollStmt.setInt(2, classId);
            enrollStmt.executeUpdate();

            completedCoursesStmt.setInt(1, studentId);
            completedCoursesStmt.setString(2, courseId);
            completedCoursesStmt.executeUpdate();

            System.out.println(studentId + " enrolled successfully!");

        } catch (SQLException e) {
            System.err.println("Error during enrollment: " + e.getMessage());
        }
    }

    public Object[][] getEnrolledCourses(int studentId) {
        String sqlStatement = """
        SELECT e.class_id, co.course_name, CONCAT(i.inst_first_name, ' ', i.inst_last_name) AS instructor,
               GROUP_CONCAT(DISTINCT DATE_FORMAT(c.schedule, '%a') SEPARATOR '/') AS days,
               CONCAT(DATE_FORMAT(c.schedule, '%h:%i %p'), ' - ', DATE_FORMAT(DATE_ADD(c.schedule, INTERVAL 1 HOUR), '%h:%i %p')) AS time,
               co.units
        FROM Enrollments e
        JOIN Classes c ON e.class_id = c.class_id
        JOIN Courses co ON c.course_id = co.course_id
        JOIN Instructor i ON c.instructor_id = i.inst_id
        WHERE e.student_id = ?
        GROUP BY e.class_id
        ORDER BY e.class_id;
    """;

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sqlStatement)) {

            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();

            java.util.List<Object[]> enrolledCoursesList = new java.util.ArrayList<>();

            while (rs.next()) {
                Object[] row = new Object[6];
                row[0] = rs.getInt("class_id");
                row[1] = rs.getString("course_name");
                row[2] = rs.getString("instructor");
                row[3] = rs.getString("days") + " " + rs.getString("time");
                row[4] = rs.getInt("units");

                enrolledCoursesList.add(row);
            }

            Object[][] enrolledCourses = new Object[enrolledCoursesList.size()][6];
            for (int i = 0; i < enrolledCoursesList.size(); i++) {
                enrolledCourses[i] = enrolledCoursesList.get(i);
            }

            return enrolledCourses;

        } catch (SQLException e) {
            System.err.println("Error fetching enrolled courses: " + e.getMessage());
            return new Object[0][0];
        }
    }

    public void dropStudentFromClass(int studentId, int classId) {
        String getCourseIdSQL = "SELECT course_id FROM Classes WHERE class_id = ?";
        String checkEnrollmentSQL = "SELECT * FROM Enrollments WHERE student_id = ? AND class_id = ?";
        String deleteCompletedCoursesSQL = "DELETE FROM CompletedCourses WHERE student_id = ? AND course_id = ?";
        String deleteEnrollmentSQL = "DELETE FROM Enrollments WHERE student_id = ? AND class_id = ?";

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement getCourseIdStmt = connection.prepareStatement(getCourseIdSQL);
             PreparedStatement checkStmt = connection.prepareStatement(checkEnrollmentSQL);
             PreparedStatement deleteCompletedStmt = connection.prepareStatement(deleteCompletedCoursesSQL);
             PreparedStatement deleteEnrollmentStmt = connection.prepareStatement(deleteEnrollmentSQL)) {

            getCourseIdStmt.setInt(1, classId);
            ResultSet courseIdRs = getCourseIdStmt.executeQuery();

            if (!courseIdRs.next()) {
                JOptionPane.showMessageDialog(null, "Invalid class ID. Class not found.", "Drop Error", JOptionPane.WARNING_MESSAGE);
                return;
            }

            String courseId = courseIdRs.getString("course_id");

            checkStmt.setInt(1, studentId);
            checkStmt.setInt(2, classId);
            ResultSet rs = checkStmt.executeQuery();

            if (!rs.next()) {
                JOptionPane.showMessageDialog(null, "Student is not enrolled in this class.", "Drop Error", JOptionPane.WARNING_MESSAGE);
                return;
            }

            deleteCompletedStmt.setInt(1, studentId);
            deleteCompletedStmt.setString(2, courseId);
            deleteCompletedStmt.executeUpdate();

            deleteEnrollmentStmt.setInt(1, studentId);
            deleteEnrollmentStmt.setInt(2, classId);
            deleteEnrollmentStmt.executeUpdate();

            JOptionPane.showMessageDialog(null, "Class " + classId + " dropped successfully.", "Drop Successful", JOptionPane.INFORMATION_MESSAGE);

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Database error while dropping class: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void main(String[] args){
        Student s1 = new Student(12307211, "Jedidiah", "Julian", "charlesxxavier30@gmail.com", 'M', "October 1, 2004", "Cubao QC", "CCS-ST", "jedidiah1001");

        StudentDao testStudent = new StudentDao();

        testStudent.addStudent(s1);
    }
}