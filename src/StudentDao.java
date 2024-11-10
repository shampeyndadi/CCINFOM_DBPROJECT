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

    public static void main(String[] args){
        Student s1 = new Student(12307211, "Jedidiah", "Julian", "charlesxxavier30@gmail.com", 'M', "October 1, 2004", "Cubao QC", "CCS-ST", "jedidiah1001");

        StudentDao testStudent = new StudentDao();

        testStudent.addStudent(s1);
    }
}