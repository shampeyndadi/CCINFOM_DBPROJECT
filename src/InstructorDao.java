import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InstructorDao {
    public void addInstructor(Instructor instructor){
        String sqlStatement = "INSERT INTO Instructor (inst_id, inst_first_name, inst_last_name, college_id, contact_no, inst_email) VALUES (?, ?, ?, ?, ?, ?)";

        try{
            Connection connection = DatabaseConnect.getConnection();

            PreparedStatement stmt = connection.prepareStatement(sqlStatement);

            stmt.setInt(1, instructor.getInstructorId());
            stmt.setString(2, instructor.getFirstName());
            stmt.setString(3, instructor.getLastName());
            stmt.setInt(4, instructor.getCollegeId());
            stmt.setString(5, instructor.getContactNo());
            stmt.setString(6, instructor.getEmail());

            stmt.execute();
            System.out.println(instructor.getInstructorId() + " successfully added");

        }catch(SQLException e){
            System.out.println("Error adding instructor " + e.getMessage());
        }
    }
}
