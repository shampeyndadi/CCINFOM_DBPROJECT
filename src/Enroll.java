import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Enroll {
    public boolean checkPrerequisites(int studentId, int classId){
        String checkSQL = """
            SELECT COUNT(*) AS unmet_prerequisites
            FROM Prerequisites p
            LEFT JOIN CompletedCourses cc ON p.prerequisite_id = cc.course_id AND cc.student_id = ?
            WHERE p.course_id = (SELECT course_id FROM Classes WHERE class_id = ?)
              AND cc.course_id IS NULL;
        """;

        try{
            Connection connection = DatabaseConnect.getConnection();
            PreparedStatement stmt = connection.prepareStatement(checkSQL);

            stmt.setInt(1, studentId);
            stmt.setInt(2, classId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()){
                return rs.getInt("unmet_prerequisites") == 0;
            }

        }catch(SQLException e){
            System.out.println("Error enrolling student " + e.getMessage());
        }

        return false;
    }

    public void enrollStudent(int studentId, int classId){
        if (!checkPrerequisites(studentId, classId)){
            System.out.println("Cannot enroll: Student has not completed all prerequisites.");
            return;
        }

        String enrollSQL = "INSERT INTO Enrollments (student_id, class_id) VALUES (?, ?)";

        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(enrollSQL)) {

            stmt.setInt(1, studentId);
            stmt.setInt(2, classId);
            stmt.executeUpdate();

            System.out.println(studentId + " enrolled successfully!");

        } catch (SQLException e) {
            System.err.println("Error during enrollment: " + e.getMessage());
        }
    }



}
