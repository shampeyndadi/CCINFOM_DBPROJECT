import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class InstructorView extends JFrame {

    private int instructorID;

    private JPanel mainPanel;

    private JLabel type;
    private JLabel Email;
    private JLabel FirstName;
    private JLabel LastName;
    private JLabel phoneNumber;
    private JLabel College;
    private JLabel IDNumber;


    private JButton gradeStudents;
    private JButton viewSchedule;
    private JButton updatePersonalInformation;
    private JButton viewClasses;
    private JButton signOut;
    private JButton submit;

    private JComboBox assignedClasses;
    private JComboBox assignedClasses1;
    private JComboBox gradeList;

    private JTable classListTable;
    private JTable scheduleTable;
    private JTable rosterTable;

    private DefaultTableModel tableModel3;
    private DefaultTableModel tableModel2;
    private DefaultTableModel tableModel;

    private boolean gradesSubmitted = false;

    private JScrollPane classScrollPane;

    public InstructorView(int instructorID) {
        super("Instructor View");
        setLayout(new BorderLayout());
        setSize(1100, 720);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        this.instructorID = instructorID;

        init();

        setVisible(true);
        setResizable(false);
    }

    private void init() {
        mainPanel = new JPanel();
        mainPanel.setLayout(new BorderLayout());

        JPanel topPanel = new JPanel(new FlowLayout());
        JLabel topLabel = new JLabel("CloudScholars");
        topLabel.setFont(new Font("Arial", Font.BOLD, 54));
        topPanel.add(topLabel);

        JPanel sidePanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbcSide = new GridBagConstraints();

        gradeStudents = new JButton("Submit Final Grades");
        viewSchedule = new JButton("View Schedule");
        updatePersonalInformation = new JButton("View Personal Information");
        viewClasses = new JButton("View Classes");
        signOut = new JButton("Logout");

        gbcSide.insets = new Insets(10, 10, 10, 10);
        gbcSide.gridx = 0;
        gbcSide.gridy = 0;
        gbcSide.fill = GridBagConstraints.HORIZONTAL;
        gbcSide.weightx = 1.0;

        sidePanel.add(gradeStudents, gbcSide);

        gbcSide.gridy = 1;
        sidePanel.add(viewSchedule, gbcSide);

        gbcSide.gridy = 2;
        sidePanel.add(updatePersonalInformation, gbcSide);

        gbcSide.gridy = 3;
        sidePanel.add(viewClasses, gbcSide);

        gbcSide.gridy = 4;
        sidePanel.add(signOut, gbcSide);

        JPanel bottomPanel = new JPanel();
        JPanel rightPanel = new JPanel();

        this.add(topPanel, BorderLayout.NORTH);
        this.add(sidePanel, BorderLayout.WEST);
        this.add(rightPanel, BorderLayout.EAST);
        this.add(bottomPanel, BorderLayout.SOUTH);

        this.add(mainPanel, BorderLayout.CENTER);

        validate();
        repaint();
    }

    public void submitFinalGradesView() {
        mainPanel.removeAll();

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();

        String[] columnNames = {"Student ID", "First Name", "Last Name", "Grade"};
        tableModel = new DefaultTableModel(columnNames, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                if (column == 3) {
                    return !gradesSubmitted;
                }
                return false;
            }
        };

        classListTable = new JTable(tableModel);
        classListTable.setRowHeight(30);

        String[] grades = {"0.0", "1.0", "1.5", "2.0", "2.5", "3.0", "3.5", "4.0"};
        JComboBox<String> gradeList = new JComboBox<>(grades);
        classListTable.getColumnModel().getColumn(3).setCellEditor(new DefaultCellEditor(gradeList));

        JPanel assignedClassPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel assignedClassLabel = new JLabel("Assigned Classes: ");
        assignedClasses = new JComboBox<>();
        assignedClasses.setPreferredSize(new Dimension(245, 30));
        assignedClassPanel.add(assignedClassLabel);
        assignedClassPanel.add(assignedClasses);

        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.gridwidth = 2;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.weightx = 1.0;
        gbc.insets = new Insets(10, 10, 10, 10);
        centerPanel.add(assignedClassPanel, gbc);

        classScrollPane = new JScrollPane(classListTable);
        classScrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
        classScrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        classScrollPane.setPreferredSize(new Dimension(800, 300)); // Adjusted height

        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.gridwidth = 2;
        gbc.fill = GridBagConstraints.BOTH;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        centerPanel.add(classScrollPane, gbc);

        JPanel bottomPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
        submit = new JButton("Submit");
        bottomPanel.add(submit);

        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.gridwidth = 2;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.weighty = 0;
        gbc.insets = new Insets(10, 10, 10, 10);
        centerPanel.add(bottomPanel, gbc);

        mainPanel.setLayout(new BorderLayout());
        mainPanel.add(centerPanel, BorderLayout.CENTER);

        mainPanel.repaint();
        mainPanel.revalidate();
    }

    public void viewScheduleView() {
        mainPanel.removeAll();

        JPanel schedulePanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);
        gbc.anchor = GridBagConstraints.NORTH;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.weightx = 1.0;

        Font labelFont = new Font("Arial", Font.BOLD, 20);
        JLabel calendarLabel = new JLabel("Your Weekly Schedule");
        calendarLabel.setFont(labelFont);
        JPanel calendarPanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
        calendarPanel.add(calendarLabel);

        gbc.gridx = 0;
        gbc.gridy = 0;
        schedulePanel.add(calendarPanel, gbc);

        String[] columnNames = {"Time", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
        String[] timeSlots = {
                "8:00 AM", "9:00 AM", "10:00 AM", "11:00 AM",
                "12:00 PM", "1:00 PM", "2:00 PM", "3:00 PM",
                "4:00 PM", "5:00 PM", "6:00 PM"
        };

        tableModel2 = new DefaultTableModel(columnNames, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };

        for (String timeSlot : timeSlots) {
            Object[] row = new Object[columnNames.length];
            row[0] = timeSlot;
            tableModel2.addRow(row);
        }

        scheduleTable = new JTable(tableModel2);
        scheduleTable.setRowHeight(60);
        scheduleTable.getColumnModel().getColumn(0).setPreferredWidth(120);

        for (int i = 1; i < columnNames.length; i++) {
            scheduleTable.getColumnModel().getColumn(i).setPreferredWidth(150);
        }

        InstructorDao instructorDao = new InstructorDao();
        ArrayList<Object[]> instructorClasses = instructorDao.getInstructorClasses(instructorID);

        for (Object[] data : instructorClasses) {
            String courseName = (String) data[0];
            String scheduledDays = (String) data[1];
            String classHours = (String) data[2];
            String roomNumber = (String) data[3];

            String[] days = scheduledDays.split(" - ");
            String[] times = classHours.split(" - ");
            String startTime = times[0];
            String endTime = times[1];

            startTime = startTime.replaceFirst("^0", "");
            endTime = endTime.replaceFirst("^0", "");

            int rowIndex = -1;
            for (int i = 0; i < timeSlots.length; i++) {
                if (timeSlots[i].equals(startTime)) {
                    rowIndex = i;
                    break;
                }
            }

            if (rowIndex == -1) {
                continue;
            }

            for (String day : days) {
                int columnIndex = -1;
                switch (day.trim().toLowerCase()) {
                    case "monday":
                        columnIndex = 1;
                        break;
                    case "tuesday":
                        columnIndex = 2;
                        break;
                    case "wednesday":
                        columnIndex = 3;
                        break;
                    case "thursday":
                        columnIndex = 4;
                        break;
                    case "friday":
                        columnIndex = 5;
                        break;
                    case "saturday":
                        columnIndex = 6;
                        break;
                    default:
                        continue;
                }

                if (columnIndex != -1) {
                    String cellText = "<html><div style='font-size:7px;'>" + courseName + "<br>Time: " + startTime + " - " + endTime + "<br>Room: " + roomNumber + "</div></html>";
                    tableModel2.setValueAt(cellText, rowIndex, columnIndex);
                }
            }
        }

        JScrollPane scrollPane = new JScrollPane(scheduleTable);
        scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
        scrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        scrollPane.setPreferredSize(new Dimension(1000, 600));

        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.gridwidth = 2;
        gbc.fill = GridBagConstraints.BOTH;
        gbc.weighty = 1.0;
        schedulePanel.add(scrollPane, gbc);

        mainPanel.add(schedulePanel);
        mainPanel.repaint();
        mainPanel.revalidate();
    }


    public void viewPersonalInformationView() {
        mainPanel.removeAll();

        Font labelFont = new Font("Arial", Font.BOLD, 18);
        Font textFieldFont = new Font("Arial", Font.PLAIN, 16);

        JPanel horizontalPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.CENTER;
        gbc.weightx = 1.0;

        JPanel typePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel typeLabel = new JLabel("Type:                            ");
        typeLabel.setFont(labelFont);
        type = new JLabel("");
        type.setFont(labelFont);
        typePanel.add(typeLabel);
        typePanel.add(type);

        gbc.gridx = 0;
        gbc.gridy = 0;
        centerPanel.add(typePanel, gbc);

        JLabel idNumberLabel = new JLabel("ID number:                  ");
        idNumberLabel.setFont(labelFont);
        IDNumber = new JLabel("");
        IDNumber.setFont(textFieldFont);
        JPanel idPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        idPanel.add(idNumberLabel);
        idPanel.add(IDNumber);

        gbc.gridx = 0;
        gbc.gridy = 1;
        centerPanel.add(idPanel, gbc);

        JLabel firstNameLabel = new JLabel("First Name:                 ");
        firstNameLabel.setFont(labelFont);
        FirstName = new JLabel("");
        FirstName.setFont(labelFont);
        JPanel firstNamePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        firstNamePanel.add(firstNameLabel);
        firstNamePanel.add(FirstName);

        gbc.gridx = 0;
        gbc.gridy = 2;
        centerPanel.add(firstNamePanel, gbc);

        JLabel lastNameLabel = new JLabel("Last Name:                 ");
        lastNameLabel.setFont(labelFont);
        LastName = new JLabel("");
        LastName.setFont(labelFont);
        JPanel lastNamePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        lastNamePanel.add(lastNameLabel);
        lastNamePanel.add(LastName);

        gbc.gridx = 0;
        gbc.gridy = 3;
        centerPanel.add(lastNamePanel, gbc);

        JLabel emailLabel = new JLabel("Email:                          ");
        emailLabel.setFont(labelFont);
        Email = new JLabel("");
        Email.setFont(labelFont);
        JPanel emailPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        emailPanel.add(emailLabel);
        emailPanel.add(Email);

        gbc.gridx = 0;
        gbc.gridy = 4 ;
        centerPanel.add(emailPanel, gbc);

        JLabel phoneNumberLabel = new JLabel("Phone number:          ");
        phoneNumberLabel.setFont(labelFont);
        phoneNumber = new JLabel("");
        phoneNumber.setFont(labelFont);
        JPanel phoneNumberPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        phoneNumberPanel.add(phoneNumberLabel);
        phoneNumberPanel.add(phoneNumber);

        gbc.gridx = 0;
        gbc.gridy = 5;
        centerPanel.add(phoneNumberPanel, gbc);

        JLabel collegeLabel = new JLabel("College:                      ");
        collegeLabel.setFont(labelFont);
        College = new JLabel("");
        College.setFont(labelFont);
        JPanel CollegePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        CollegePanel.add(collegeLabel);
        CollegePanel.add(College);

        gbc.gridx = 0;
        gbc.gridy = 6;
        centerPanel.add(CollegePanel, gbc);

        horizontalPanel.add(centerPanel);

        mainPanel.add(horizontalPanel, BorderLayout.CENTER);

        mainPanel.repaint();
        mainPanel.revalidate();
    }

    public void viewClass() {
        mainPanel.removeAll();

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();

        JPanel assignedClassPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel assignedClassLabel = new JLabel("Assigned Classes: ");
        assignedClasses1 = new JComboBox<>();
        assignedClasses1.setPreferredSize(new Dimension(245, 30));
        assignedClassPanel.add(assignedClassLabel);
        assignedClassPanel.add(assignedClasses1);


        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.gridwidth = 2;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.weightx = 1.0;
        gbc.insets = new Insets(10, 10, 10, 10);
        centerPanel.add(assignedClassPanel, gbc);

        String[] columnNames = {"Student ID", "First Name", "Last Name", "Email", "Program"};
        tableModel3 = new DefaultTableModel(columnNames, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };


        rosterTable = new JTable(tableModel3);
        rosterTable.setRowHeight(30);

        classScrollPane = new JScrollPane(rosterTable);
        classScrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
        classScrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        classScrollPane.setPreferredSize(new Dimension(800, 300)); // Adjusted table size

        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.gridwidth = 2;
        gbc.fill = GridBagConstraints.BOTH;
        gbc.weightx = 1.0;
        gbc.weighty = 1.0;
        centerPanel.add(classScrollPane, gbc);

        mainPanel.setLayout(new BorderLayout());
        mainPanel.add(centerPanel, BorderLayout.CENTER);

        mainPanel.repaint();
        mainPanel.revalidate();
    }



    public void populateClassIdComboBox(InstructorDao instructorDao, int instructorID){
        assignedClasses.removeAllItems();

        for (int classID : instructorDao.getClassIdsForInstructor(instructorID)){
            assignedClasses.addItem(classID);
        }

    }

    public void populateClassIdComboBox1(InstructorDao instructorDao, int instructorID){
        assignedClasses1.removeAllItems();

        for (int classID : instructorDao.getClassIdsForInstructor(instructorID)){
            assignedClasses1.addItem(classID);
        }

    }

    public int getClassId(){
        if (assignedClasses.getSelectedItem() != null) {
            return (int) assignedClasses.getSelectedItem();
        }else{
            return -1;
        }
    }

    public int getClassId1(){
        if (assignedClasses1.getSelectedItem() != null) {
            return (int) assignedClasses1.getSelectedItem();
        }else{
            return -1;
        }
    }

    public void populateStudentTable(InstructorDao instructorDao, int classId) {
        tableModel.setRowCount(0); // Clear the table before populating it

        ArrayList<Student> students = instructorDao.getStudentsForClass(classId); // Get all students for the given class

        for (Student student : students) {
            Object grade = instructorDao.getSavedGrade(student.getStudentId(), classId); // Fetch the saved grade if it exists
            if (grade == null) {
                grade = "0.0"; // Default grade if no saved grade is found
            }

            tableModel.addRow(new Object[]{
                    student.getStudentId(),
                    student.getFirstName(),
                    student.getLastName(),
                    grade
            });
        }

        refreshTableModel(); // Refresh the table to reflect changes
    }

    public void populateStudentTable1(InstructorDao instructorDao, int classId) {
        tableModel3.setRowCount(0);

        ArrayList<Student> students = instructorDao.getStudentsForClass(classId);
        for (Student student : students) {
            tableModel3.addRow(new Object[]{
                    student.getStudentId(),
                    student.getFirstName(),
                    student.getLastName(),
                    student.getEmail(),
                    student.getProgramId()
            });
        }
    }

    public double getGradeInput(int rowIndex) {
        if (gradesSubmitted) {
            System.err.println("Grades have already been submitted. Cannot modify.");
            return -1.0;
        }

        Object value = tableModel.getValueAt(rowIndex, 3);
        if (value != null && !value.toString().isEmpty()) {
            try {
                return Double.parseDouble(value.toString());
            } catch (NumberFormatException e) {
                System.err.println("Invalid grade input at row " + rowIndex + ": " + value);
            }
        }

        return -1.0;
    }

    public void setType(String type){
        this.type.setText(type);
    }

    public void setIDNumber(String idNumber){
        this.IDNumber.setText(idNumber);
    }

    public void setFirstName(String firstName){
        this.FirstName.setText(firstName);
    }

    public void setLastName(String lastName){
        this.LastName.setText(lastName);
    }

    public void setEmail (String email){
        this.Email.setText(email);
    }

    public void setPhoneNumber(String phoneNumber){
        this.phoneNumber.setText(phoneNumber);
    }

    public void setCollege(String college){
        this.College.setText(college);
    }

    public void setViewClasses(ActionListener listener){
        this.viewClasses.addActionListener(listener);
    }


    public void setSubmitButton (ActionListener listener){
        submit.addActionListener(listener);
    }

    public void setAssignedClass (ActionListener listener){
        assignedClasses.addActionListener(listener);
    }

    public void setAssignedClasses1(ActionListener listener){
        assignedClasses1.addActionListener(listener);
    }

    public void setGradeStudents(ActionListener listener){
        this.gradeStudents.addActionListener(listener);
    }

    public void setSignOut(ActionListener listener){
        this.signOut.addActionListener(listener);
    }

    public void setViewSchedule(ActionListener listener){
        this.viewSchedule.addActionListener(listener);
    }

    public void setViewPersonalInformation(ActionListener listener){
        this.updatePersonalInformation.addActionListener(listener);
    }

    public void setGradesSubmitted(boolean submitted) {
        this.gradesSubmitted = submitted;
    }


    public void refreshTableModel() {
        tableModel.fireTableDataChanged();
        classListTable.repaint();
    }

}


