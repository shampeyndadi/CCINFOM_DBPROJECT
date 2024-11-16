import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class AdminView extends JFrame {

    private JPanel mainPanel;
    private JPanel instructorPanel;

    private JButton openClass;
    private JButton addStudent;
    private JButton addInstructor;
    private JButton searchProfile;
    private JButton signOut;
    private JButton searchProfs;
    private JButton clearFields;
    private JButton signIn;
    private JButton addClass;
    private JButton registerStudent;
    private JButton ClearFields;
    private JButton cancelButton;

    private JRadioButton male;
    private JRadioButton female;

    private ButtonGroup genderGroup;

    private JTextField SearchClassField;
    private JTextField instructorID;
    private JTextField Capacity;
    private JTextField firstName;
    private JTextField lastName;
    private JTextField contactNumber;
    private JTextField email;
    private JTextField homeAddress;

    private JComboBox listOfCourses;
    private JComboBox startTimes;
    private JComboBox scheduledDays;
    private JComboBox listOfColleges;
    private JComboBox program_ids;
    private JComboBox Month;
    private JComboBox Day;
    private JComboBox Year;
    private JComboBox studentProgram;
    private JComboBox studentCollege;

    private DefaultListModel instructorModel;
    private JList instructorList;

    public AdminView() {
        super("AdminView");
        setLayout(new BorderLayout());
        setSize(1100, 720);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

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

        openClass = new JButton("Open Class");
        addStudent = new JButton("Register Student");
        addInstructor = new JButton("Register Instructor");
        searchProfile = new JButton("Search Profile");
        signOut = new JButton("Logout");

        gbcSide.insets = new Insets(10, 10, 10, 10);
        gbcSide.gridx = 0;
        gbcSide.gridy = 0;
        gbcSide.fill = GridBagConstraints.HORIZONTAL;
        gbcSide.weightx = 1.0;
        sidePanel.add(openClass, gbcSide);

        gbcSide.gridx = 0;
        gbcSide.gridy = 1;
        sidePanel.add(addStudent, gbcSide);

        gbcSide.gridx = 0;
        gbcSide.gridy = 2;
        sidePanel.add(addInstructor, gbcSide);

        gbcSide.gridx = 0;
        gbcSide.gridy = 3;
        sidePanel.add(searchProfile, gbcSide);

        gbcSide.gridx = 0;
        gbcSide.gridy = 4;
        sidePanel.add(signOut, gbcSide);

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

    public void openClassView() {
        mainPanel.removeAll();

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.weightx = 1.0;

        JPanel header = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel headerTitle = new JLabel("Open Class");
        headerTitle.setFont(new Font("Arial", Font.BOLD, 20));
        header.add(headerTitle);

        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.gridwidth = 2;
        centerPanel.add(header, gbc);

        JPanel searchProgramPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel searchClassLabel = new JLabel("Select College:   ");
        listOfColleges = new JComboBox<>();
        listOfColleges.setPreferredSize(new Dimension(245, 30));
        searchProgramPanel.add(searchClassLabel);
        searchProgramPanel.add(listOfColleges);

        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.gridwidth = 1;
        centerPanel.add(searchProgramPanel, gbc);

        JPanel listCourses = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel listOfCourse = new JLabel("Courses:              ");
        listOfCourses = new JComboBox<>();
        listOfCourses.setPreferredSize(new Dimension(245, 30));
        listCourses.add(listOfCourse);
        listCourses.add(listOfCourses);

        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.gridwidth = 1;
        centerPanel.add(listCourses, gbc);

        JPanel startTimePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel startTimeLabel = new JLabel("Class Hours:        ");
        startTimes = new JComboBox<>();
        startTimes.setPreferredSize(new Dimension(245, 30));
        startTimePanel.add(startTimeLabel);
        startTimePanel.add(startTimes);

        gbc.gridx = 0;
        gbc.gridy = 3;
        gbc.gridwidth = 1;
        centerPanel.add(startTimePanel, gbc);

        JPanel scheduledDaysPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel scheduledLabel = new JLabel("Scheduled Days: ");
        scheduledDays = new JComboBox<>();
        scheduledDays.setPreferredSize(new Dimension(245, 30));
        scheduledDaysPanel.add(scheduledLabel);
        scheduledDaysPanel.add(scheduledDays);

        gbc.gridx = 0;
        gbc.gridy = 4;
        gbc.gridwidth = 1;
        centerPanel.add(scheduledDaysPanel, gbc);

        JPanel programsPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel programLabel = new JLabel("Programs:            ");
        program_ids = new JComboBox<>();
        program_ids.setPreferredSize(new Dimension(245, 30));
        programsPanel.add(programLabel);
        programsPanel.add(program_ids);

        gbc.gridx = 0;
        gbc.gridy = 5;
        gbc.gridwidth = 1;
        centerPanel.add(programsPanel, gbc);

        JPanel capacityPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel enterCapacity = new JLabel("Enter capacity: ");
        Capacity = new JTextField(5);
        capacityPanel.add(enterCapacity);
        capacityPanel.add(Capacity);

        gbc.gridx = 0;
        gbc.gridy = 6;
        gbc.gridwidth = 1;
        centerPanel.add(capacityPanel, gbc);

        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        searchProfs = new JButton("Look for available instructors");
        clearFields = new JButton("Clear fields");
        buttonPanel.add(searchProfs);
        buttonPanel.add(clearFields);

        gbc.gridx = 0;
        gbc.gridy = 7;
        gbc.gridwidth = 1;
        centerPanel.add(buttonPanel, gbc);

        instructorModel = new DefaultListModel<>();
        instructorList = new JList(instructorModel);
        JScrollPane infoScrollPane = new JScrollPane(instructorList);
        infoScrollPane.setPreferredSize(new Dimension(300, 300));

        gbc.gridx = 1;
        gbc.gridy = 0;
        gbc.gridheight = 7;
        gbc.anchor = GridBagConstraints.EAST;
        centerPanel.add(infoScrollPane, gbc);


        instructorPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel instructorLabel = new JLabel("Enter instructor ID: ");
        instructorID = new JTextField(15);
        addClass = new JButton("Add Class");
        instructorPanel.add(instructorLabel);
        instructorPanel.add(instructorID);
        instructorPanel.add(addClass);

        instructorPanel.setVisible(false);

        gbc.gridx = 1;
        gbc.gridy = 7;
        gbc.gridheight = 1;
        gbc.anchor = GridBagConstraints.EAST;
        centerPanel.add(instructorPanel, gbc);

        mainPanel.add(centerPanel, BorderLayout.NORTH);

        mainPanel.revalidate();
        mainPanel.repaint();
    }

    public void registerStudentView() {
        mainPanel.removeAll();

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.weightx = 1.0;

        JPanel firstNamePanel = new JPanel(new GridLayout(2, 1, 5, 5));
        JLabel firstNameLabel = new JLabel("First Name:");
        firstName = new JTextField(15);
        firstNamePanel.add(firstNameLabel);
        firstNamePanel.add(firstName);

        JPanel lastNamePanel = new JPanel(new GridLayout(2, 1, 5, 5));
        JLabel lastNameLabel = new JLabel("Last Name:");
        lastName = new JTextField(15);
        lastNamePanel.add(lastNameLabel);
        lastNamePanel.add(lastName);

        JPanel fullNamePanel = new JPanel(new FlowLayout(FlowLayout.LEFT, 10, 0));
        fullNamePanel.add(firstNamePanel);
        fullNamePanel.add(lastNamePanel);

        gbc.gridx = 0;
        gbc.gridy = 0;
        centerPanel.add(fullNamePanel, gbc);

        JPanel monthPanel = new JPanel(new GridLayout(2, 3, 5, 5));
        JLabel monthLabel = new JLabel("Month:");
        Month = new JComboBox<>();
        Month.setPreferredSize(new Dimension(150, 20));
        monthPanel.add(monthLabel);
        monthPanel.add(Month);

        JPanel dayPanel = new JPanel(new GridLayout(2, 3, 5, 5));
        JLabel dayLabel = new JLabel("Day:");
        Day = new JComboBox<>();
        Day.setPreferredSize(new Dimension(60, 20));
        dayPanel.add(dayLabel);
        dayPanel.add(Day);

        JPanel yearPanel = new JPanel(new GridLayout(2, 3, 5, 5));
        JLabel yearLabel = new JLabel("Year:");
        Year = new JComboBox<>();
        Year.setPreferredSize(new Dimension(119, 20));
        yearPanel.add(yearLabel);
        yearPanel.add(Year);

        JPanel birthdayPanel = new JPanel(new FlowLayout(FlowLayout.LEFT, 10, 0));
        birthdayPanel.add(monthPanel);
        birthdayPanel.add(dayPanel);
        birthdayPanel.add(yearPanel);

        gbc.gridx = 0;
        gbc.gridy = 1;
        centerPanel.add(birthdayPanel, gbc);

        JPanel genderPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel genderLabel = new JLabel("Gender: ");
        male = new JRadioButton("M");
        female = new JRadioButton("F");

        ButtonGroup genderGroup = new ButtonGroup();
        genderGroup.add(male);
        genderGroup.add(female);

        genderPanel.add(genderLabel);
        genderPanel.add(male);
        genderPanel.add(female);

        gbc.gridx = 0;
        gbc.gridy = 2;
        centerPanel.add(genderPanel, gbc);

        JPanel contactPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel contactLabel = new JLabel("Contact number: ");
        contactNumber = new JTextField(15);
        contactPanel.add(contactLabel);
        contactPanel.add(contactNumber);

        gbc.gridx = 0;
        gbc.gridy = 3;
        centerPanel.add(contactPanel, gbc);

        JPanel emailPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel emailLabel = new JLabel("Email:                     ");
        email = new JTextField(15);
        emailPanel.add(emailLabel);
        emailPanel.add(email);

        gbc.gridx = 0;
        gbc.gridy = 4;
        centerPanel.add(emailPanel, gbc);

        JPanel addressPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel addressLabel = new JLabel("Home Address:    ");
        homeAddress = new JTextField(15);
        addressPanel.add(addressLabel);
        addressPanel.add(homeAddress);

        gbc.gridx = 0;
        gbc.gridy = 5;
        centerPanel.add(addressPanel, gbc);

        JPanel collegePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel collegeLabel = new JLabel("College:                  ");
        studentCollege = new JComboBox<>();
        studentCollege.setPreferredSize(new Dimension(110, 20));
        collegePanel.add(collegeLabel);
        collegePanel.add(studentCollege);

        gbc.gridx = 0;
        gbc.gridy = 6;
        centerPanel.add(collegePanel, gbc);

        JPanel programPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel programLabel = new JLabel("Programs:             ");
        studentProgram = new JComboBox<>();
        studentProgram.setPreferredSize(new Dimension(110, 20));
        programPanel.add(programLabel);
        programPanel.add(studentProgram);

        gbc.gridx = 0;
        gbc.gridy = 7;
        centerPanel.add(programPanel, gbc);

        JPanel buttonPanels = new JPanel(new FlowLayout(FlowLayout.LEFT));
        registerStudent = new JButton("Register Student");
        clearFields = new JButton("Clear Fields");
        cancelButton = new JButton("Cancel");

        buttonPanels.add(registerStudent);
        buttonPanels.add(clearFields);
        buttonPanels.add(cancelButton);

        gbc.gridx = 0;
        gbc.gridy = 8;
        centerPanel.add(buttonPanels, gbc);

        mainPanel.add(centerPanel, BorderLayout.NORTH);

        mainPanel.revalidate();
        mainPanel.repaint();
    }


    public void setOpenClass(ActionListener listener){ this.openClass.addActionListener(listener);}

    public void setRegisterStudent(ActionListener listener){
        this.addStudent.addActionListener(listener);
    }

    public void setListOfColleges(ActionListener listener){
        listOfColleges.addActionListener(listener);
    }

    public String getSelectedCollege(){
        return (String) listOfColleges.getSelectedItem();
    }

    public String getSelectedCourse(){
        return (String) listOfCourses.getSelectedItem();
    }

    public String getSelectedClassHours(){
        return (String) startTimes.getSelectedItem();
    }

    public String getSelectedDays(){
        return (String) scheduledDays.getSelectedItem();
    }

    public String getSelectedProgram(){
        return (String) program_ids.getSelectedItem();
    }

    public String getMaxCapacity(){
        return Capacity.getText();
    }

    public String getInstructorID(){
        return instructorID.getText();
    }

    public void setAddClass(ActionListener listener){
        this.addClass.addActionListener(listener);
    }

    public void clearInstructorList() {
        instructorModel.clear();
    }

    public void addInstructorToList(String instructor) {
        instructorModel.addElement(instructor);
    }


    public void populateComboBoxes(AdminDao adminDao){
        listOfColleges.removeAllItems();
        for (String college : adminDao.getColleges()) {
            listOfColleges.addItem(college);
        }

        startTimes.removeAllItems();
        for (String time : adminDao.getTimes()) {
            startTimes.addItem(time);
        }

        scheduledDays.removeAllItems();
        for (String day : adminDao.getScheduledDays()) {
            scheduledDays.addItem(day);
        }

    }

    public void setClearFields(ActionListener listener){
        this.clearFields.addActionListener(listener);
    }

    public void resetView(AdminDao adminDao) {

        populateComboBoxes(adminDao);
        disableCombox();

        instructorID.setText("");
        Capacity.setText("");

        clearInstructorList();

        instructorPanel.setVisible(false);

        resetFields();

        mainPanel.revalidate();
        mainPanel.repaint();
    }

    public void enableComboBox() {
        program_ids.setEnabled(true);
        listOfCourses.setEnabled(true);
    }

    public void disableCombox() {
        program_ids.removeAllItems();
        program_ids.setEnabled(false);
        listOfCourses.removeAllItems();
        listOfCourses.setEnabled(false);
    }


    public void populateProgram(int collegeId, AdminDao adminDao){
        program_ids.removeAllItems();
        for (String programs : adminDao.getProgramsByCollegeId(collegeId)){
            program_ids.addItem(programs);
        }
    }


    public void addInstructorPanel(){
        instructorPanel.setVisible(true);

        mainPanel.revalidate();
        mainPanel.repaint();
    }

    public void setCourses(ArrayList<String> courses){
        listOfCourses.removeAllItems();
        for (String course : courses) {
            listOfCourses.addItem(course);
        }
    }

    public void setSearchInstructors(ActionListener listener){
        this.searchProfs.addActionListener(listener);
    }

    public void setSignOut(ActionListener listener){
        this.signOut.addActionListener(listener);
    }

    public void resetFields() {
        for (ActionListener listener : addClass.getActionListeners()) {
            addClass.removeActionListener(listener);
        }
    }

    public void resetSearchInstructor(){
        for (ActionListener listener : searchProfs.getActionListeners()) {
            searchProfs.removeActionListener(listener);
        }
    }

    public static void main(String[] args){
        AdminView a1 = new AdminView();

        a1.registerStudentView();
    }

}