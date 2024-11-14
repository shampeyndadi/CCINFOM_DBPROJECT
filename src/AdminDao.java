import javax.swing.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class AdminDao {

    public ArrayList<String> getColleges(){
        ArrayList<String> colleges = new ArrayList<>();
        String sql = "SELECT college_name FROM Colleges";

        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                colleges.add(rs.getString("college_name"));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching colleges: " + e.getMessage());
        }

        return colleges;
    }

    public ArrayList<String> getCourses(){
        ArrayList<String> courses = new ArrayList<>();
        String sql = "SELECT course_name FROM Courses";

        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                courses.add(rs.getString("course_name"));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching courses: " + e.getMessage());
        }

        return courses;
    }

    public ArrayList<String> getTimes() {
        ArrayList<String> times = new ArrayList<>();

        times.add("08:00 - 9:00 AM");
        times.add("09:00 - 10:00 AM");
        times.add("10:00 - 11:00 AM");
        times.add("11:00 AM - 12:00 AM");
        times.add("12:00 AM - 01:00 PM");
        times.add("01:00 PM - 02:00 PM");
        times.add("02:00 PM - 03:00 PM");
        times.add("03:00 PM - 04:00 PM");
        times.add("04:00 PM - 05:00 PM");
        times.add("05:00 PM - 06:00 PM");

        return times;
    }

    public ArrayList<String> getScheduledDays() {
        ArrayList<String> days = new ArrayList<>();
        days.add("Monday - Thursday");
        days.add("Tuesday - Friday");
        days.add("Wednesday - Saturday");
        days.add("Monday");
        days.add("Tuesday");
        days.add("Wednesday");
        days.add("Thursday");
        days.add("Saturday");

        return days;
    }
}
