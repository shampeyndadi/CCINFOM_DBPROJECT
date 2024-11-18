import java.security.SecureRandom;
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

    public ArrayList<String> getProgramsByCollegeId(int collegeId) {
        ArrayList<String> programIds = new ArrayList<>();
        String sql = "SELECT program_id FROM Programs WHERE college_id = ?";

        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, collegeId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    programIds.add(rs.getString("program_id"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching program IDs by college ID: " + e.getMessage());
        }

        return programIds;
    }

    public int getCollegeIdByName(String collegeName) {
        String sql = "SELECT college_id FROM Colleges WHERE college_name = ?";
        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, collegeName);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("college_id");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching college ID: " + e.getMessage());
        }
        return -1;
    }

    public ArrayList<String> getCourses(int collegeId, String programId) {
        ArrayList<String> courses = new ArrayList<>();
        String sql = """
        SELECT course_id 
        FROM Courses 
        WHERE college_id = ? AND (program_id = ? OR program_id IS NULL)
    """;

        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, collegeId);
            stmt.setString(2, programId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    courses.add(rs.getString("course_id"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching courses by program: " + e.getMessage());
        }

        return courses;
    }


    public boolean doesInstructorExist(int instructorID) {
        String query = "SELECT COUNT(*) FROM instructor WHERE inst_id = ?";
        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
             stmt.setInt(1, instructorID);
             ResultSet rs = stmt.executeQuery();
             if (rs.next() && rs.getInt(1) > 0) {
                 return true;
             }
        } catch (SQLException ex) {
            System.err.println("Error checking instructor existence: " + ex.getMessage());
        }

        return false;
    }


    public ArrayList<String[]> getInstructorSchedules(int instructorId) {
        ArrayList<String[]> schedules = new ArrayList<>();
        String sql = """
        SELECT scheduled_days, class_hours
        FROM Schedules
        WHERE instructor_id = ?;
    """;

        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, instructorId);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String scheduledDays = rs.getString("scheduled_days");
                    String classHours = rs.getString("class_hours");

                    schedules.add(new String[]{scheduledDays, classHours});
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching instructor schedules: " + e.getMessage());
        }

        return schedules;
    }

    public ArrayList<String[]> getAvailableInstructors(int collegeId, String courseID, String classHours, String scheduledDays) {
        ArrayList<String[]> instructors = new ArrayList<>();
        String sql = """
        SELECT inst_id, CONCAT(inst_first_name, ' ', inst_last_name) AS instructor_name
        FROM Instructor
        WHERE college_id = ? AND inst_id IN (
            SELECT inst_id
            FROM Courses
            WHERE course_id = ?
        );
    """;

        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, collegeId);
            stmt.setString(2, courseID);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    String instructorId = rs.getString("inst_id");
                    String instructorName = rs.getString("instructor_name");

                    ArrayList<String[]> existingSchedules = getInstructorSchedules(Integer.parseInt(instructorId));

                    boolean hasConflict = false;
                    for (String[] schedule : existingSchedules) {
                        String existingDays = schedule[0];
                        String existingTimes = schedule[1];

                        if (isScheduleConflict(scheduledDays, classHours, existingDays, existingTimes)) {
                            hasConflict = true;
                            break;
                        }
                    }

                    if (!hasConflict) {
                        instructors.add(new String[]{instructorId, instructorName});
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching available instructors: " + e.getMessage());
        }

        return instructors;
    }


    public int generateNewClassId() {
        String sql = "SELECT MAX(class_id) FROM Classes";

        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
        } catch (SQLException e) {
            System.err.println("Error generating new class ID: " + e.getMessage());
        }
        return 1;
    }

    public boolean addClass(String courseId, String programId, int instructorId, int collegeId, int maxCapacity, String scheduledDays, String classHours) {
        int newClassId = generateNewClassId();
        String roomNumber = getAvailableRoom(scheduledDays, classHours);

        if (roomNumber == null) {
            System.err.println("No available rooms for the specified schedule.");
            return false;
        }

        String sqlInsertClass = """
        INSERT INTO Classes (class_id, course_id, program_id, instructor_id, college_id, room_number, max_capacity)
        VALUES (?, ?, ?, ?, ?, ?, ?);
    """;

        String sqlInsertSchedule = """
        INSERT INTO Schedules (class_id, scheduled_days, class_hours, instructor_id)
        VALUES (?, ?, ?, ?);
    """;

        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement stmtClass = conn.prepareStatement(sqlInsertClass);
             PreparedStatement stmtSchedule = conn.prepareStatement(sqlInsertSchedule)) {

            stmtClass.setInt(1, newClassId);
            stmtClass.setString(2, courseId);
            stmtClass.setString(3, programId);
            stmtClass.setInt(4, instructorId);
            stmtClass.setInt(5, collegeId);
            stmtClass.setString(6, roomNumber);
            stmtClass.setInt(7, maxCapacity);

            int rowsAffectedClass = stmtClass.executeUpdate();

            stmtSchedule.setInt(1, newClassId);
            stmtSchedule.setString(2, scheduledDays);
            stmtSchedule.setString(3, classHours);
            stmtSchedule.setInt(4, instructorId);

            int rowsAffectedSchedule = stmtSchedule.executeUpdate();

            if (rowsAffectedClass > 0 && rowsAffectedSchedule > 0) {
                System.out.println("Class and Schedule added successfully with Class ID: " + newClassId + " and Room: " + roomNumber);
                return true;
            }

        } catch (SQLException e) {
            System.err.println("Error adding class and schedule: " + e.getMessage());
        }
        return false;
    }

    public boolean isRoomAvailable(String roomNumber, String scheduledDays, String classHours) {
        String sql = """
        SELECT COUNT(*) AS count
        FROM Schedules s
        JOIN Classes c ON s.class_id = c.class_id
        WHERE c.room_number = ? AND s.scheduled_days = ? AND s.class_hours = ?;
    """;

        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, roomNumber);
            stmt.setString(2, scheduledDays);
            stmt.setString(3, classHours);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("count") == 0; // Return true if no conflicts
                }
            }
        } catch (SQLException e) {
            System.err.println("Error checking room availability: " + e.getMessage());
        }
        return false;
    }

    public String getAvailableRoom(String scheduledDays, String classHours) {
        String[] prefixes = {"A", "LS", "V", "G", "M", "SJ"};
        ArrayList<String> availableRooms = new ArrayList<>();
        Random random = new Random();

        for (int i = 101; i <= 499; i++) {
            String prefix = prefixes[random.nextInt(prefixes.length)];
            String roomNumber = prefix + i;

            if (isRoomAvailable(roomNumber, scheduledDays, classHours)) {
                availableRooms.add(roomNumber);
            }
        }

        if (availableRooms.isEmpty()) {
            System.err.println("No available rooms for the specified schedule.");
            return null;
        }

        int randomIndex = random.nextInt(availableRooms.size());

        return availableRooms.get(randomIndex);
    }

    public boolean doesStudentIdExist(String studentId) {
        String sql = "SELECT COUNT(*) FROM Students WHERE student_id = ?";
        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, studentId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error checking student ID existence: " + e.getMessage());
        }
        return false;
    }

    public String generateUniqueStudentId() {
        int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
        String yearSuffix = String.valueOf(currentYear).substring(2);

        String studentId;
        boolean isUnique;

        do {
            int randomNumber = (int) (Math.random() * 100000);
            String randomPart = String.format("%05d", randomNumber);

            studentId = "1" + yearSuffix + randomPart;

            isUnique = !doesStudentIdExist(studentId);

        } while (!isUnique);

        return studentId;
    }

    public String generatePassword(){
        String Characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        int passLength = 6;
        SecureRandom random = new SecureRandom();

        StringBuilder password = new StringBuilder(passLength);

        for (int i = 0; i <= passLength; i++){
            password.append(Characters.charAt(random.nextInt(Characters.length())));
        }

        return password.toString();
    }

    public int generateNewInstructorId() {
        String sql = "SELECT MAX(inst_id) FROM Instructor";

        try (Connection conn = DatabaseConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
        } catch (SQLException e) {
            System.err.println("Error generating new instructor ID: " + e.getMessage());
        }

        return 1;
    }

    public ArrayList<String> getTimes() {
        ArrayList<String> times = new ArrayList<>();

        times.add("08:00 AM - 9:00 AM");
        times.add("09:00 AM - 10:00 AM");
        times.add("10:00 AM - 11:00 AM");
        times.add("11:00 AM - 12:00 PM");
        times.add("12:00 PM - 01:00 PM");
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

    private boolean isScheduleConflict(String newDays, String newTimes, String existingDays, String existingTimes) {
        String[] newDayArray = newDays.split(" - ");
        String[] existingDayArray = existingDays.split(" - ");

        String[] newTimeArray = newTimes.split(" - ");
        String[] existingTimeArray = existingTimes.split(" - ");

        int newStart = parseTime(newTimeArray[0]);
        int newEnd = parseTime(newTimeArray[1]);
        int existingStart = parseTime(existingTimeArray[0]);
        int existingEnd = parseTime(existingTimeArray[1]);

        for (String newDay : newDayArray) {
            for (String existingDay : existingDayArray) {
                if (newDay.equalsIgnoreCase(existingDay)) {
                    if (newStart < existingEnd && newEnd > existingStart) {
                        return true;
                    }
                }
            }
        }

        return false;
    }

    private int parseTime(String time) {
        String[] parts = time.split(" ");
        String[] hourMinute = parts[0].split(":");
        int hours = Integer.parseInt(hourMinute[0]);
        int minutes = Integer.parseInt(hourMinute[1]);
        boolean isPM = parts[1].equalsIgnoreCase("PM");

        if (isPM && hours != 12) {
            hours += 12;
        } else if (!isPM && hours == 12) {
            hours = 0;
        }

        return hours * 60 + minutes;
    }

    public ArrayList<String> getMonths() {
        String[] months = {
                "January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"
        };
        ArrayList<String> monthList = new ArrayList<>();

        for (String month : months) {
            monthList.add(month);
        }
        return monthList;
    }

    public ArrayList<String> getYears() {
        ArrayList<String> yearList = new ArrayList<>();
        int currentYear = Calendar.getInstance().get(Calendar.YEAR);

        for (int i = currentYear; i >= currentYear - 100; i--) {
            yearList.add(String.valueOf(i));
        }

        return yearList;
    }

    public ArrayList<String> getDays(String month) {
        int daysInMonth;

        if (month.equals("February")) {
            daysInMonth = 28;
        } else if (isThirtyOneDayMonth(month)) {
            daysInMonth = 31;
        } else {
            daysInMonth = 30;
        }

        ArrayList<String> dayList = new ArrayList<>();

        for (int i = 1; i <= daysInMonth; i++) {
            dayList.add(String.valueOf(i));
        }
        return dayList;
    }

    private boolean isThirtyOneDayMonth(String month) {
        String[] thirtyOneDayMonths = {"January", "March", "May", "July", "August", "October", "December"};
        for (String m : thirtyOneDayMonths) {
            if (m.equals(month)) {
                return true;
            }
        }
        return false;
    }

}