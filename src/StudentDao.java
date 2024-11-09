import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentDao{
    public void addStudent(Student student){String sqlStatement = "INSERT INTO Students (student_id, first_name, last_name, birth_date, gender, address, email, program_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

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

            stmt.execute();
            System.out.println(student.getStudentId() + " successfully added");

        }catch(SQLException e){
            System.out.println("Error adding student " + e.getMessage());
        }
    }

}