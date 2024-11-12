import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;

import javax.swing.table.DefaultTableModel;


public class StudentView extends JFrame {

    private JPanel mainPanel;
    private Student student;

    private JButton viewSchedButton;
    private JButton viewCoursesButton;
    private JButton dropCourseButton;
    private JButton enrollCourse;
    private JButton enrollButton;
    private JButton searchButton;
    private JButton logoutButton;
    private JButton dropButton;
    private JButton updatePersonalInformation;
    private JButton saveChangesButton;
    private JButton cancelButton;

    private JTextField courseField;
    private JTextField classField;

    private JTextField updateFirstName;
    private JTextField updateLastName;
    private JTextField updateEmail;
    private JTextField updatePhoneNumber;
    private JTextField updateHomeAddress;

    private JScrollPane courseScrollPane;
    private JPanel courseListPanel;

    private JTable classTable;
    private DefaultTableModel tableModel;

    private JTable enrolledTable;
    private DefaultTableModel tableModel1;

    private JLabel messageLabel;
    private JLabel studentNumber;
    private JLabel program_id;
    private JLabel studentgenderLabel;
    private JLabel birthday;

    private StudentDao s1;
    private int idNumber;

    public StudentView(StudentDao s1, int idNumber) {
        super("Student View");
        setLayout(new BorderLayout());
        setSize(1100, 720);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        this.s1 = s1;
        this.idNumber = idNumber;

        init();

        setVisible(true);
        setResizable(false);
    }

    private void init() {
        mainPanel = new JPanel();
        mainPanel.setLayout(new BorderLayout());

        JPanel topPanel = new JPanel(new FlowLayout());
        JLabel topLabel = new JLabel("EnrollmentHub");
        topLabel.setFont(new Font("Arial", Font.BOLD, 54));
        topPanel.add(topLabel);

        JPanel sidePanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbcSide = new GridBagConstraints();

        enrollCourse = new JButton("Enroll Course");
        dropCourseButton = new JButton("Drop Course");
        viewSchedButton = new JButton("View Schedule");
        viewCoursesButton = new JButton("View Courses");
        logoutButton = new JButton("Logout");
        updatePersonalInformation = new JButton("Update personal information");

        gbcSide.insets = new Insets(10, 10, 10, 10);
        gbcSide.gridx = 0;
        gbcSide.gridy = 0;
        gbcSide.fill = GridBagConstraints.HORIZONTAL;
        gbcSide.weightx = 1.0;
        sidePanel.add(enrollCourse, gbcSide);

        gbcSide.gridx = 0;
        gbcSide.gridy = 1;
        sidePanel.add(dropCourseButton, gbcSide);

        gbcSide.gridx = 0;
        gbcSide.gridy = 2;
        sidePanel.add(viewSchedButton, gbcSide);

        gbcSide.gridx = 0;
        gbcSide.gridy = 3;
        sidePanel.add(updatePersonalInformation, gbcSide);

        gbcSide.gridx = 0;
        gbcSide.gridy = 4;
        sidePanel.add(viewCoursesButton, gbcSide);

        gbcSide.gridx = 0;
        gbcSide.gridy = 5;
        sidePanel.add(logoutButton, gbcSide);

        JPanel bottomPanel1 = new JPanel();
        JPanel sidePanel2 = new JPanel();

        this.add(topPanel, BorderLayout.NORTH);
        this.add(sidePanel, BorderLayout.WEST);
        this.add(sidePanel2, BorderLayout.EAST);
        this.add(bottomPanel1, BorderLayout.SOUTH);

        this.add(mainPanel, BorderLayout.CENTER);

        validate();
        repaint();
    }

    public void enrollCourseView(){
        mainPanel.removeAll();

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();

        JLabel courseLabel = new JLabel("Enter Course Name:");
        courseField = new JTextField(20);

        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.insets = new Insets(10, 10, 10, 10);
        gbc.anchor = GridBagConstraints.WEST;
        centerPanel.add(courseLabel, gbc);

        searchButton = new JButton("Search");

        JPanel courseInputPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        courseField = new JTextField(15);
        courseField.setPreferredSize(new Dimension(250, 30));
        courseInputPanel.add(courseField);
        courseInputPanel.add(searchButton);

        gbc.gridx = 1;
        gbc.gridy = 0;
        gbc.weightx = 1.0;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        centerPanel.add(courseInputPanel, gbc);

        String[] columnNames = {"Class ID", "Course Name", "Instructor", "Schedule","Enrolled", "Max Cap"};
        tableModel = new DefaultTableModel(columnNames, 0);
        classTable = new JTable(tableModel);

        courseScrollPane = new JScrollPane(classTable);
        courseScrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
        courseScrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        courseScrollPane.setPreferredSize(new Dimension(400, 200));

        gbc.gridx = 0;
        gbc.gridy = 3;
        gbc.gridwidth = 2;
        gbc.fill = GridBagConstraints.BOTH;
        gbc.weighty = 1.0;
        centerPanel.add(courseScrollPane, gbc);

        JPanel bottomPanel = new JPanel(new GridBagLayout());
        GridBagConstraints bottomGbc = new GridBagConstraints();

        JLabel classLabel = new JLabel("Enter Class:");
        classField = new JTextField(20);
        enrollButton = new JButton("Enroll");

        bottomGbc.gridx = 0;
        bottomGbc.gridy = 0;
        bottomGbc.insets = new Insets(10, 10, 10, 10);
        bottomGbc.anchor = GridBagConstraints.WEST;
        bottomPanel.add(classLabel, bottomGbc);

        JPanel classInputPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        classField = new JTextField(15);
        classField.setPreferredSize(new Dimension(250, 30));
        classInputPanel.add(classField);
        classInputPanel.add(enrollButton);

        bottomGbc.gridx = 1;
        bottomGbc.gridy = 0;
        bottomGbc.weightx = 1.0;
        bottomGbc.fill = GridBagConstraints.HORIZONTAL;
        bottomPanel.add(classInputPanel, bottomGbc);

        mainPanel.add(centerPanel, BorderLayout.CENTER);
        mainPanel.add(bottomPanel, BorderLayout.SOUTH);

        mainPanel.repaint();
        mainPanel.revalidate();
    }

    public void dropCourseView() {
        mainPanel.removeAll();

        Object[][] enrolledData = s1.getEnrolledCourses(idNumber);
        System.out.println("Enrolled courses fetched: " + enrolledData.length + " records.");

        String[] columnNames = {"Class ID", "Course Name", "Instructor", "Schedule", "Units"};
        tableModel1 = new DefaultTableModel(columnNames, 0);
        enrolledTable = new JTable(tableModel1);

        populateEnrolledTable(enrolledData);

        JScrollPane scrollPane = new JScrollPane(enrolledTable);
        scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
        scrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        scrollPane.setPreferredSize(new Dimension(600, 300));

        JPanel centerPanel = new JPanel(new BorderLayout());
        centerPanel.add(scrollPane, BorderLayout.CENTER);

        JPanel inputPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);

        JPanel panel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel classLabel = new JLabel("Enter Class ID:");
        classField = new JTextField(15);
        dropButton = new JButton("Drop");
        panel.add(classLabel);

        panel.add(classField);
        panel.add(dropButton);
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.anchor = GridBagConstraints.WEST;
        inputPanel.add(panel, gbc);

        JLabel messageLabel = new JLabel(" ");
        messageLabel.setForeground(Color.RED); // Set text color for visibility
        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.gridwidth = 3;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        inputPanel.add(messageLabel, gbc);

        mainPanel.add(centerPanel, BorderLayout.CENTER);
        mainPanel.add(inputPanel, BorderLayout.SOUTH);

        mainPanel.repaint();
        mainPanel.revalidate();
    }

    public void updatePersonalInformationView() {
        mainPanel.removeAll();

        Font labelFont = new Font("Arial", Font.BOLD, 18);
        Font textFieldFont = new Font("Arial", Font.PLAIN, 16);

        JPanel horizontalPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.weightx = 1.0;

        JLabel idNumberLabel = new JLabel("ID number:                  ");
        idNumberLabel.setFont(labelFont);
        studentNumber = new JLabel("12307211");
        studentNumber.setFont(textFieldFont);
        JPanel idPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        idPanel.add(idNumberLabel);
        idPanel.add(studentNumber);

        gbc.gridx = 0;
        gbc.gridy = 0;
        centerPanel.add(idPanel, gbc);

        JLabel firstNameLabel = new JLabel("First Name:                 ");
        firstNameLabel.setFont(labelFont);
        updateFirstName = new JTextField(15);
        updateFirstName.setFont(textFieldFont);
        JPanel firstNamePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        firstNamePanel.add(firstNameLabel);
        firstNamePanel.add(updateFirstName);

        gbc.gridx = 0;
        gbc.gridy = 1;
        centerPanel.add(firstNamePanel, gbc);

        JLabel lastNameLabel = new JLabel("Last Name:                 ");
        lastNameLabel.setFont(labelFont);
        updateLastName = new JTextField(15);
        updateLastName.setFont(textFieldFont);
        JPanel lastNamePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        lastNamePanel.add(lastNameLabel);
        lastNamePanel.add(updateLastName);

        gbc.gridx = 0;
        gbc.gridy = 2;
        centerPanel.add(lastNamePanel, gbc);

        JLabel emailLabel = new JLabel("Email:                          ");
        emailLabel.setFont(labelFont);
        updateEmail = new JTextField(15);
        updateEmail.setFont(textFieldFont);
        JPanel emailPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        emailPanel.add(emailLabel);
        emailPanel.add(updateEmail);

        gbc.gridx = 0;
        gbc.gridy = 3;
        centerPanel.add(emailPanel, gbc);

        JLabel phoneNumberLabel = new JLabel("Phone number:          ");
        phoneNumberLabel.setFont(labelFont);
        updatePhoneNumber = new JTextField(15);
        updatePhoneNumber.setFont(textFieldFont);
        JPanel phoneNumberPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        phoneNumberPanel.add(phoneNumberLabel);
        phoneNumberPanel.add(updatePhoneNumber);

        gbc.gridx = 0;
        gbc.gridy = 4;
        centerPanel.add(phoneNumberPanel, gbc);

        JLabel homeAddressLabel = new JLabel("Home address:          ");
        homeAddressLabel.setFont(labelFont);
        updateHomeAddress = new JTextField(15);
        updateHomeAddress.setFont(textFieldFont);
        JPanel homeAddressPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        homeAddressPanel.add(homeAddressLabel);
        homeAddressPanel.add(updateHomeAddress);

        gbc.gridx = 0;
        gbc.gridy = 5;
        centerPanel.add(homeAddressPanel, gbc);

        JLabel programLabel = new JLabel("Program:                    ");
        programLabel.setFont(labelFont);
        program_id = new JLabel("");
        program_id.setFont(textFieldFont);
        JPanel programPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        programPanel.add(programLabel);
        programPanel.add(program_id);

        gbc.gridx = 0;
        gbc.gridy = 6;
        centerPanel.add(programPanel, gbc);

        JLabel genderLabel = new JLabel("Gender:                      ");
        genderLabel.setFont(labelFont);
        studentgenderLabel = new JLabel("");
        studentgenderLabel.setFont(textFieldFont);
        JPanel genderPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        genderPanel.add(genderLabel);
        genderPanel.add(studentgenderLabel);

        gbc.gridx = 0;
        gbc.gridy = 7;
        centerPanel.add(genderPanel, gbc);

        JLabel birthdayLabel = new JLabel("Birthday:                    ");
        birthdayLabel.setFont(labelFont);
        birthday = new JLabel("");
        birthday.setFont(textFieldFont);
        JPanel birthdayPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        birthdayPanel.add(birthdayLabel);
        birthdayPanel.add(birthday);

        gbc.gridx = 0;
        gbc.gridy = 8;
        centerPanel.add(birthdayPanel, gbc);

        saveChangesButton = new JButton("Save changes");
        cancelButton = new JButton("Cancel");
        saveChangesButton.setFont(labelFont);
        cancelButton.setFont(labelFont);

        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        buttonPanel.add(saveChangesButton);
        buttonPanel.add(cancelButton);

        gbc.gridx = 0;
        gbc.gridy = 9;
        centerPanel.add(buttonPanel, gbc);

        JLabel profilePictureLabel = new JLabel();
        try {
            ImageIcon profileIcon = new ImageIcon("userProfile.jpg");
            Image scaledImage = profileIcon.getImage().getScaledInstance(350, 350, Image.SCALE_SMOOTH);
            profileIcon = new ImageIcon(scaledImage);
            profilePictureLabel.setIcon(profileIcon);
        } catch (Exception e) {
            System.err.println("Error loading profile image: " + e.getMessage());
        }

        JPanel profilePanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
        profilePanel.add(profilePictureLabel);

        horizontalPanel.add(centerPanel);
        horizontalPanel.add(profilePanel);

        mainPanel.add(horizontalPanel, BorderLayout.CENTER);

        mainPanel.repaint();
        mainPanel.revalidate();
    }

    public void populateClassTable(Object[][] data) {
        tableModel.setRowCount(0);
        for (Object[] row : data) {
            tableModel.addRow(row);
        }
    }

    public void populateEnrolledTable(Object[][] data){
        tableModel1.setRowCount(0);

        for (Object[] row: data){
            tableModel1.addRow(row);
        }
    }

    public void setProgramId(String course){
        this.program_id.setText(course);
    }

    public String getNewFirstName(){
        return this.updateFirstName.getText();
    }

    public String getNewLastName(){
        return this.updateLastName.getText();
    }

    public String getNewEmail(){
        return this.updateEmail.getText();
    }

    public String getNewPhoneNumber(){
        return this.updatePhoneNumber.getText();
    }

    public String getNewHomeAddress(){
        return this.updateHomeAddress.getText();
    }

    public void setGender(String gender){
        this.studentgenderLabel.setText(gender);
    }

    public void setBirthday(String birthday){
        this.birthday.setText(birthday);
    }

    public void clearTextFields(){
        this.updateFirstName.setText("");
        this.updateLastName.setText("");
        this.updateEmail.setText("");
        this.updatePhoneNumber.setText("");
        this.updateHomeAddress.setText("");
    }

    public String getCourseName(){
        return courseField.getText();
    }

    public int getClassNumber(){
        String classIdText = classField.getText().trim();

        if (classIdText.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Class ID cannot be empty. Please enter a valid Class ID.", "Input Error", JOptionPane.WARNING_MESSAGE);
            throw new NumberFormatException("Class ID input is empty.");
        }

        try {
            return Integer.parseInt(classIdText);
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(this, "Invalid Class ID format. Please enter a numeric value.", "Input Error", JOptionPane.WARNING_MESSAGE);
            throw e;
        }
    }

    public void setCancelButton(ActionListener listener){
        this.cancelButton.addActionListener(listener);
    }

    public void setSaveChangesButton(ActionListener listener){
        this.saveChangesButton.addActionListener(listener);
    }

    public void setViewSchedButton(ActionListener listener){
        this.viewSchedButton.addActionListener(listener);
    }

    public void setDropCourseButton(ActionListener listener){
        this.dropCourseButton.addActionListener(listener);
    }

    public void setIdNumberText(int idNumber){
        this.studentNumber.setText(Integer.toString(idNumber));
    }

    public void setViewCoursesButton(ActionListener listener){
        this.viewCoursesButton.addActionListener(listener);
    }


    public void setUpdatePersonalInformation(ActionListener listener){
        this.updatePersonalInformation.addActionListener(listener);
    }

    public void setLogoutButton(ActionListener listener){
        this.logoutButton.addActionListener(listener);
    }

    public void setEnrollCourse(ActionListener listener){
        this.enrollCourse.addActionListener(listener);
    }

    public void setEnrollButton(ActionListener listener){
        this.enrollButton.addActionListener(listener);
    }

    public void setDropButton(ActionListener listener){
        this.dropButton.addActionListener(listener);
    }

    public void setSearchButton(ActionListener listener){
        this.searchButton.addActionListener(listener);
    }

    public void revalidatePanel(){
        mainPanel.repaint();
        mainPanel.revalidate();
    }

}
