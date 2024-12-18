import javax.swing.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class StudentDao{


    public boolean addStudent(Student student){String sqlStatement = "INSERT INTO Students (student_id, first_name, last_name, birth_date, gender, address, email, program_id, phone_number, account_password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
            stmt.setString(9, student.getPhoneNumber());
            stmt.setString(10, student.getPassword());

            stmt.execute();
            System.out.println(student.getStudentId() + " successfully added");
            return true;

        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Error adding Student: " + e.getMessage(), "Student Registration Error", JOptionPane.ERROR_MESSAGE);
            return false;
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
        String currentTermQuery = "SELECT setting_value FROM SystemSettings WHERE setting_name = 'current_term'";
        String currentTerm = "First Term"; // Default value

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement termStmt = connection.prepareStatement(currentTermQuery);
             ResultSet termRs = termStmt.executeQuery()) {
            if (termRs.next()) {
                currentTerm = termRs.getString("setting_value");
            }
        } catch (SQLException e) {
            System.err.println("Error fetching current term: " + e.getMessage());
        }

        String sqlStatement = """
        SELECT c.class_id, co.course_name, CONCAT(i.inst_first_name, ' ', i.inst_last_name) AS instructor,
               CONCAT(s.scheduled_days, ' ', s.class_hours) AS schedule,
               (SELECT COUNT(*) FROM Enrollments e WHERE e.class_id = c.class_id) AS enrolled,
               c.max_capacity
        FROM Classes c
        JOIN Courses co ON c.course_id = co.course_id
        JOIN Instructor i ON c.instructor_id = i.inst_id
        JOIN Schedules s ON c.class_id = s.class_id
        WHERE co.course_id = ? AND c.term = ?
        GROUP BY c.class_id, co.course_name, i.inst_first_name, i.inst_last_name, s.scheduled_days, s.class_hours, c.max_capacity
        ORDER BY c.class_id;
    """;

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sqlStatement)) {

            stmt.setString(1, courseId);
            stmt.setString(2, currentTerm); // Add the current term as a filter

            ResultSet rs = stmt.executeQuery();

            java.util.List<Object[]> classList = new java.util.ArrayList<>();

            while (rs.next()) {
                Object[] row = new Object[6];
                row[0] = rs.getInt("class_id");
                row[1] = rs.getString("course_name");
                row[2] = rs.getString("instructor");
                row[3] = rs.getString("schedule");
                row[4] = rs.getInt("enrolled");
                row[5] = rs.getInt("max_capacity");
                classList.add(row);
            }

            Object[][] classes = new Object[classList.size()][6];
            for (int i = 0; i < classList.size(); i++) {
                classes[i] = classList.get(i);
            }

            return classes;

        } catch (SQLException e) {
            System.out.println("Error searching for classes: " + e.getMessage());
            return new Object[0][0];
        }
    }

    public Map<String, ArrayList<Object[]>> getGradesBySchoolYearAndTerm(int studentId, String schoolYear) {
        String sql = """
        SELECT c.course_name, g.grade, c.units, ah.term
        FROM AcademicHistory ah
        JOIN Courses c ON ah.course_id = c.course_id
        LEFT JOIN Grades g ON ah.academic_history_id = g.academic_history_id
        WHERE ah.student_id = ? AND ah.school_year = ?
        ORDER BY ah.term, c.course_name;
    """;

        Map<String, ArrayList<Object[]>> gradesByTerm = new HashMap<>();
        gradesByTerm.put("First Term", new ArrayList<>());
        gradesByTerm.put("Second Term", new ArrayList<>());
        gradesByTerm.put("Third Term", new ArrayList<>());

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, studentId);
            stmt.setString(2, schoolYear);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String courseName = rs.getString("course_name");
                Object grade = rs.getObject("grade");
                int units = rs.getInt("units");
                String term = rs.getString("term");

                Object[] row = new Object[]{courseName, grade, units};

                gradesByTerm.getOrDefault(term, new ArrayList<>()).add(row);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error fetching grades: " + e.getMessage(), "Database Error", JOptionPane.ERROR_MESSAGE);
        }

        return gradesByTerm;
    }


    public boolean checkPrerequisites(int studentId, int classId){
        String checkSQL = """
        SELECT COUNT(*) AS unmet_prerequisites
        FROM Prerequisites p
        LEFT JOIN AcademicHistory cc ON p.prerequisite_id = cc.course_id AND cc.student_id = ?
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
        String checkSQL = "SELECT status FROM AcademicHistory WHERE student_id = ? AND course_id = ?";

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

    public boolean checkCourseCurriculum(String studentProgramId, String courseId) {
        String sql = """
        SELECT program_id
        FROM Courses
        WHERE course_id = ?
    """;

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, courseId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String courseProgramId = rs.getString("program_id");

                return courseProgramId == null || courseProgramId.equalsIgnoreCase(studentProgramId);
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error checking program compatibility: " + e.getMessage(), "Database Error", JOptionPane.ERROR_MESSAGE);
        }

        return false;
    }


    public void enrollStudent(int studentId, int classId, String courseId) {
        AdminDao adminDao = new AdminDao();
        Student student = getStudentInfo(studentId);

        if (student == null) {
            JOptionPane.showMessageDialog(null, "Cannot enroll: Student information not found.", "Enrollment Error", JOptionPane.WARNING_MESSAGE);
            return;
        }

        String studentProgramId = student.getProgramId();
        String currentTerm = adminDao.getCurrentTerm();
        String currentSchoolYear = adminDao.getCurrentSchoolYear();
        String academicHistoryId = generateAcademicHistoryId(studentId, courseId, currentTerm, currentSchoolYear);

        String courseCollegeIdSQL = "SELECT college_id FROM Courses WHERE course_id = ?";
        int courseCollegeId = -1;

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(courseCollegeIdSQL)) {

            stmt.setString(1, courseId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                courseCollegeId = rs.getInt("college_id");
            } else {
                JOptionPane.showMessageDialog(null, "Cannot enroll: Course not found.", "Enrollment Error", JOptionPane.WARNING_MESSAGE);
                return;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Database error while fetching course college: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            return;
        }

        String programCollegeIdSQL = "SELECT college_id FROM Programs WHERE program_id = ?";
        int studentCollegeId = -1;

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(programCollegeIdSQL)) {

            stmt.setString(1, studentProgramId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                studentCollegeId = rs.getInt("college_id");
            } else {
                JOptionPane.showMessageDialog(null, "Cannot enroll: Student program not found.", "Enrollment Error", JOptionPane.WARNING_MESSAGE);
                return;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Database error while fetching student college: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            return;
        }

        // Check if the student's college matches the course's college
        if (studentCollegeId != courseCollegeId) {
            JOptionPane.showMessageDialog(null, "Cannot enroll: This course does not belong to your college.", "Enrollment Error", JOptionPane.WARNING_MESSAGE);
            return;
        }

        // Check if the student is already taking or has completed this course
        if (checkCourseStatus(studentId, courseId)) {
            JOptionPane.showMessageDialog(null, "Cannot enroll: Student has already taken or is currently enrolled in this course.", "Enrollment Error", JOptionPane.WARNING_MESSAGE);
            return;
        }

        // Check prerequisites
        if (!checkPrerequisites(studentId, classId)) {
            JOptionPane.showMessageDialog(null, "Cannot enroll: Student has not completed all prerequisites.", "Prerequisite Error", JOptionPane.WARNING_MESSAGE);
            return;
        }

        // Check class capacity
        if (!checkClassCapacity(classId)) {
            JOptionPane.showMessageDialog(null, "Cannot enroll: Class is already full.", "Capacity Error", JOptionPane.WARNING_MESSAGE);
            return;
        }

        String enrollSQL = "INSERT INTO Enrollments (student_id, class_id) VALUES (?, ?)";
        String completedCoursesSQL = """
        INSERT INTO AcademicHistory (academic_history_id, student_id, course_id, status, term, school_year)
        VALUES (?, ?, ?, 'In Progress', ?, ?)
    """;

        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement enrollStmt = conn.prepareStatement(enrollSQL);
             PreparedStatement completedCoursesStmt = conn.prepareStatement(completedCoursesSQL)) {

            enrollStmt.setInt(1, studentId);
            enrollStmt.setInt(2, classId);
            enrollStmt.executeUpdate();

            completedCoursesStmt.setString(1, academicHistoryId);
            completedCoursesStmt.setInt(2, studentId);
            completedCoursesStmt.setString(3, courseId);
            completedCoursesStmt.setString(4, currentTerm);
            completedCoursesStmt.setString(5, currentSchoolYear);
            completedCoursesStmt.executeUpdate();

            JOptionPane.showMessageDialog(null, "Student successfully enrolled.", "Enrollment Successful", JOptionPane.INFORMATION_MESSAGE);
            System.out.println("Student " + studentId + " enrolled successfully with Academic History ID: " + academicHistoryId);

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error during enrollment: " + e.getMessage(), "Database Error", JOptionPane.ERROR_MESSAGE);
        }
    }


    public Object[][] getEnrolledCourses(int studentId) {
        String sqlStatement = """
        SELECT e.class_id, co.course_name, CONCAT(i.inst_first_name, ' ', i.inst_last_name) AS instructor,
               GROUP_CONCAT(DISTINCT s.scheduled_days SEPARATOR '/') AS days,
               s.class_hours AS time,
               co.units
        FROM Enrollments e
        JOIN Classes c ON e.class_id = c.class_id
        JOIN Courses co ON c.course_id = co.course_id
        JOIN Instructor i ON c.instructor_id = i.inst_id
        JOIN Schedules s ON c.class_id = s.class_id
        WHERE e.student_id = ?
        AND c.term = (SELECT setting_value FROM SystemSettings WHERE setting_name = 'current_term')
        AND c.school_year = (SELECT setting_value FROM SystemSettings WHERE setting_name = 'current_school_year')
        GROUP BY e.class_id, co.course_name, i.inst_first_name, i.inst_last_name, s.class_hours, co.units
        ORDER BY e.class_id;
    """;


        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sqlStatement)) {

            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();

            ArrayList<Object[]> enrolledCoursesList = new ArrayList<>();

            while (rs.next()) {
                Object[] row = new Object[6];
                row[0] = rs.getInt("class_id");
                row[1] = rs.getString("course_name");
                row[2] = rs.getString("instructor");

                String days = rs.getString("days");
                String time = rs.getString("time");
                String formattedSchedule = String.format("<html><div style='text-align:center;'>%s<br>%s</div></html>", days, time);

                row[3] = formattedSchedule;
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
        String updateAcademicHistorySQL = "UPDATE AcademicHistory SET status = 'Dropped' WHERE student_id = ? AND course_id = ?";
        String deleteEnrollmentSQL = "DELETE FROM Enrollments WHERE student_id = ? AND class_id = ?";

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement getCourseIdStmt = connection.prepareStatement(getCourseIdSQL);
             PreparedStatement checkStmt = connection.prepareStatement(checkEnrollmentSQL);
             PreparedStatement deleteCompletedStmt = connection.prepareStatement(updateAcademicHistorySQL);
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

    public void updateStudentInfo(int studentId, String firstName, String lastName, String email, String phoneNumber, String homeAddress) {
        String sql = """
        UPDATE Students
        SET first_name = ?, last_name = ?, email = ?, phone_number = ?, address = ?
        WHERE student_id = ?
    """;

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, phoneNumber);
            stmt.setString(5, homeAddress);
            stmt.setInt(6, studentId);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                JOptionPane.showMessageDialog(null, "Information updated successfully.", "Update Successful", JOptionPane.INFORMATION_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(null, "No changes were made. Please try again.", "Update Failed", JOptionPane.WARNING_MESSAGE);
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error updating student info: " + e.getMessage(), "Database Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public Student getStudentInfo(int studentId) {
        String sql = """
        SELECT student_id, first_name, last_name, birth_date, gender, address, email, program_id, phone_number, account_password
        FROM Students
        WHERE student_id = ?
    """;

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("student_id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String birthDate = rs.getString("birth_date");
                char gender = rs.getString("gender").charAt(0);
                String address = rs.getString("address");
                String email = rs.getString("email");
                String programId = rs.getString("program_id");
                String phoneNumber = rs.getString("phone_number");
                String accountPassword = rs.getString("account_password");

                return new Student(id, firstName, lastName, email, gender, birthDate, address, programId,  accountPassword, phoneNumber);

            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error retrieving student info: " + e.getMessage(), "Database Error", JOptionPane.ERROR_MESSAGE);
        }

        return null;
    }

    public Object[][] getStudentSchedule(int studentId) {
        String sql = """
        SELECT co.course_name, s.scheduled_days, s.class_hours, c.room_number
        FROM Enrollments e
        JOIN Classes c ON e.class_id = c.class_id
        JOIN Courses co ON c.course_id = co.course_id
        JOIN Schedules s ON c.class_id = s.class_id
        WHERE e.student_id = ?
        AND c.term = (SELECT setting_value FROM SystemSettings WHERE setting_name = 'current_term')
        AND c.school_year = (SELECT setting_value FROM SystemSettings WHERE setting_name = 'current_school_year')
        ORDER BY FIELD(s.scheduled_days, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
    """;

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();

            ArrayList<Object[]> scheduleList = new ArrayList<>();

            while (rs.next()) {
                Object[] row = new Object[4];
                row[0] = rs.getString("course_name");
                row[1] = rs.getString("scheduled_days");
                row[2] = rs.getString("class_hours");
                row[3] = rs.getString("room_number");
                scheduleList.add(row);
            }

            Object[][] scheduleData = new Object[scheduleList.size()][4];

            for (int i = 0; i < scheduleList.size(); i++) {
                scheduleData[i] = scheduleList.get(i);
            }

            return scheduleData;

        } catch (SQLException e) {
            System.err.println("Error fetching student schedule: " + e.getMessage());
            return new Object[0][0];
        }
    }

    public boolean isDuplicateStudent(String firstName, String lastName, String email, String birthday) {
        String sql = """
        SELECT COUNT(*)
        FROM Students
        WHERE first_name = ? AND last_name = ? AND email = ? AND birth_date = ?
    """;

        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, birthday);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // Return true if a duplicate record exists
                }
            }
        } catch (SQLException e) {
            System.err.println("Error checking for duplicate student record: " + e.getMessage());
        }

        return false; // No duplicate found
    }

    private String generateAcademicHistoryId(int studentId, String courseId, String term, String schoolYear) {
        String termCode;
        switch (term) {
            case "First Term":
                termCode = "1T";
                break;
            case "Second Term":
                termCode = "2T";
                break;
            case "Third Term":
                termCode = "3T";
                break;
            default:
                termCode = "XX"; // Fallback for invalid terms
                break;
        }
        return studentId + "|" + courseId + "|" + termCode + "|" + schoolYear;
    }


}