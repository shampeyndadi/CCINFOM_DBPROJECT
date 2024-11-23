import javax.swing.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class InstructorDao {
    public boolean addInstructor(Instructor instructor){
        String sqlStatement = "INSERT INTO Instructor (inst_id, inst_first_name, inst_last_name, college_id, contact_no, inst_email, inst_password) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try{
            Connection connection = DatabaseConnect.getConnection();

            PreparedStatement stmt = connection.prepareStatement(sqlStatement);

            stmt.setInt(1, instructor.getInstructorId());
            stmt.setString(2, instructor.getFirstName());
            stmt.setString(3, instructor.getLastName());
            stmt.setInt(4, instructor.getCollegeId());
            stmt.setString(5, instructor.getContactNo());
            stmt.setString(6, instructor.getEmail());
            stmt.setString(7, instructor.getInstructorPassword());

            stmt.execute();
            System.out.println(instructor.getInstructorId() + " successfully added");
            return true;
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Error adding Instructor: " + e.getMessage(), "Instructor Registration Error", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }

    public ArrayList<Student> getStudentsForClass(int classId) {
        String sql = "SELECT s.student_id, s.first_name, s.last_name, s.email, s.gender, s.birth_date, s.address, " +
                "s.program_id, s.account_password, s.phone_number " +
                "FROM Students s " +
                "JOIN Enrollments e ON s.student_id = e.student_id " +
                "WHERE e.class_id = ?";
        ArrayList<Student> students = new ArrayList<>();

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, classId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Student student = new Student(
                            rs.getInt("student_id"),
                            rs.getString("first_name"),
                            rs.getString("last_name"),
                            rs.getString("email"),
                            rs.getString("gender").charAt(0),
                            rs.getString("birth_date"),
                            rs.getString("address"),
                            rs.getString("program_id"),
                            rs.getString("account_password"),
                            rs.getString("phone_number")
                    );
                    students.add(student);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching students for class ID " + classId + ": " + e.getMessage());
        }

        return students;
    }

    public boolean saveGrade(int studentId, String courseId, String term, String schoolYear, double grade) {
        String fetchAcademicHistoryQuery = """
        SELECT academic_history_id, status 
        FROM AcademicHistory 
        WHERE student_id = ? AND course_id = ? AND term = ? AND school_year = ?
    """;
        String insertGradeQuery = "INSERT INTO Grades (academic_history_id, grade) VALUES (?, ?)";
        String updateGradeQuery = "UPDATE Grades SET grade = ? WHERE academic_history_id = ?";
        String updateAcademicHistoryQuery = "UPDATE AcademicHistory SET status = ? WHERE academic_history_id = ?";

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement fetchStmt = connection.prepareStatement(fetchAcademicHistoryQuery)) {

            fetchStmt.setInt(1, studentId);
            fetchStmt.setString(2, courseId);
            fetchStmt.setString(3, term);
            fetchStmt.setString(4, schoolYear);

            ResultSet rs = fetchStmt.executeQuery();

            if (rs.next()) {
                String academicHistoryId = rs.getString("academic_history_id");
                String currentStatus = rs.getString("status");

                try (PreparedStatement updateGradeStmt = connection.prepareStatement(updateGradeQuery)) {
                    updateGradeStmt.setDouble(1, grade);
                    updateGradeStmt.setString(2, academicHistoryId);
                    int rowsAffected = updateGradeStmt.executeUpdate();

                    if (rowsAffected == 0) {
                        try (PreparedStatement insertStmt = connection.prepareStatement(insertGradeQuery)) {
                            insertStmt.setString(1, academicHistoryId);
                            insertStmt.setDouble(2, grade);
                            insertStmt.executeUpdate();
                        }
                    }
                }

                String newStatus;
                if (grade >= 1.0) {
                    newStatus = "Completed";
                } else {
                    newStatus = "Failed";
                }

                if (!currentStatus.equalsIgnoreCase(newStatus)) {
                    try (PreparedStatement updateStmt = connection.prepareStatement(updateAcademicHistoryQuery)) {
                        updateStmt.setString(1, newStatus);
                        updateStmt.setString(2, academicHistoryId);
                        updateStmt.executeUpdate();
                    }
                }

                return true;

            } else {
                JOptionPane.showMessageDialog(null,
                        "No academic history found for Student ID: " + studentId + ", Course ID: " + courseId,
                        "Error",
                        JOptionPane.ERROR_MESSAGE);
            }

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null,
                    "Error saving grade: " + e.getMessage(),
                    "Database Error",
                    JOptionPane.ERROR_MESSAGE);
        }

        return false;
    }

    public Double getSavedGrade(int studentId, int classId) {
        Double grade = null;

        try (Connection connection = DatabaseConnect.getConnection()) {
            String query = """
            SELECT g.grade FROM Grades g
            JOIN AcademicHistory ah ON g.academic_history_id = ah.academic_history_id
            JOIN Enrollments e ON ah.student_id = e.student_id
            WHERE e.student_id = ? AND e.class_id = ?
        """;
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, studentId);
            preparedStatement.setInt(2, classId);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                grade = resultSet.getObject("grade", Double.class); // Retrieves `null` if no grade is present
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return grade;
    }


    public ArrayList<Object[]> getInstructorClasses(int instructorId) {
        String currentTerm = getCurrentTerm();
        String currentSchoolYear = getCurrentSchoolYear();
        String sql = """
            SELECT co.course_name, s.scheduled_days, s.class_hours, c.room_number
            FROM Classes c
            JOIN Courses co ON c.course_id = co.course_id
            JOIN Schedules s ON c.class_id = s.class_id
            WHERE c.instructor_id = ? AND c.term = ? AND c.school_year = ?
            ORDER BY FIELD(s.scheduled_days, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
        """;

        ArrayList<Object[]> classesList = new ArrayList<>();

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, instructorId);
            stmt.setString(2, currentTerm);
            stmt.setString(3, currentSchoolYear);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Object[] row = new Object[4];
                row[0] = rs.getString("course_name");
                row[1] = rs.getString("scheduled_days");
                row[2] = rs.getString("class_hours");
                row[3] = rs.getString("room_number");
                classesList.add(row);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching instructor's classes: " + e.getMessage());
        }

        return classesList;
    }

    public Instructor getInstructorDetails(int instructorID) {
        String sql = """
        SELECT inst_id, inst_first_name, inst_last_name, inst_email, contact_no, c.college_name
        FROM Instructor i
        JOIN Colleges c ON i.college_id = c.college_id
        WHERE inst_id = ?
    """;

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, instructorID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Instructor(
                        rs.getInt("inst_id"),
                        rs.getString("inst_first_name"),
                        rs.getString("inst_last_name"),
                        rs.getString("inst_email"),
                        rs.getString("contact_no"),
                        rs.getString("college_name")
                );
            }
        } catch (SQLException e) {
            System.err.println("Error fetching instructor details: " + e.getMessage());
        }

        return null;
    }


    private String getCurrentTerm() {
        String sql = "SELECT setting_value FROM SystemSettings WHERE setting_name = 'current_term'";
        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getString("setting_value");
            }
        } catch (SQLException e) {
            System.err.println("Error fetching current term: " + e.getMessage());
        }
        return "First Term";
    }


    private String getCurrentSchoolYear() {
        String sql = "SELECT setting_value FROM SystemSettings WHERE setting_name = 'current_school_year'";
        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getString("setting_value");
            }
        } catch (SQLException e) {
            System.err.println("Error fetching current school year: " + e.getMessage());
        }
        return "2024-2025";
    }


    public boolean authenticateUser(int idNumber, String password){
        String sqlStatement = "SELECT * FROM Instructor WHERE inst_id = ? AND inst_password = ?";

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

    public ArrayList<Integer> getClassIdsForInstructor(int instructorId) {
        ArrayList<Integer> classIds = new ArrayList<>();
        String sqlQuery = """
        SELECT class_id 
        FROM Classes 
        WHERE instructor_id = ? 
          AND term = (SELECT setting_value FROM SystemSettings WHERE setting_name = 'current_term') 
          AND school_year = (SELECT setting_value FROM SystemSettings WHERE setting_name = 'current_school_year')
    """;

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sqlQuery)) {

            stmt.setInt(1, instructorId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    classIds.add(rs.getInt("class_id"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching current term class IDs for instructor: " + e.getMessage());
        }

        return classIds;
    }

    public String getCourseIdForClass(int classId) {
        String courseId = null;
        String sql = "SELECT course_id FROM Classes WHERE class_id = ?";

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, classId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    courseId = rs.getString("course_id");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching course ID for class ID " + classId + ": " + e.getMessage());
        }

        return courseId;
    }




}
