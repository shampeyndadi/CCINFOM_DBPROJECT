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
        String sqlQuery = "SELECT class_id FROM Classes WHERE instructor_id = ?";
        ArrayList<Integer> classIds = new ArrayList<>();

        try (Connection connection = DatabaseConnect.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sqlQuery)) {

            stmt.setInt(1, instructorId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    classIds.add(rs.getInt("class_id"));
                }
            }
        } catch (Exception e) {
            System.err.println("Error fetching class IDs: " + e.getMessage());
        }

        return classIds;
    }
}
