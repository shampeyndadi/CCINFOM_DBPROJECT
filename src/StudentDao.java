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

    public static void main(String[] args){
        Student s1 = new Student(12307211, "Jedidiah", "Julian", "charlesxxavier30@gmail.com", 'M', "October 1, 2004", "Cubao QC", "CCS-ST", "jedidiah1001");

        StudentDao testStudent = new StudentDao();

        testStudent.addStudent(s1);
    }
}