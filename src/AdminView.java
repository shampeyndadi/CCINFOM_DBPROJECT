import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class AdminView extends JFrame {

    private JLabel type;
    private JLabel FirstName;
    private JLabel LastName;
    private JLabel Email;
    private JLabel IDNumber;
    private JLabel phoneNumber;
    private JLabel College;

    private JPanel mainPanel;
    private JPanel instructorPanel;

    private JButton openClass;
    private JButton addStudent;
    private JButton addInstructor;
    private JButton searchProfile;
    private JButton signOut;
    private JButton searchProfs;
    private JButton clearFields;
    private JButton addClass;
    private JButton registerStudent;
    private JButton registerInstructor;
    private JButton clearRegisterFieldsInstructor;
    private JButton search;
    private JButton updateTerm;

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
    private JTextField instructor_firstName;
    private JTextField instructor_lastName;
    private JTextField instructor_contactNo;
    private JTextField instructor_email;
    private JTextField idNumber;

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
    private JComboBox instructorCollege;

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
        JLabel topLabel = new JLabel("CloudScholars");
        topLabel.setFont(new Font("Arial", Font.BOLD, 54));
        topPanel.add(topLabel);

        JPanel sidePanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbcSide = new GridBagConstraints();

        openClass = new JButton("Open Class");
        addStudent = new JButton("Register Student");
        addInstructor = new JButton("Register Instructor");
        searchProfile = new JButton("Search Profile");
        updateTerm = new JButton("Update Term");
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
        sidePanel.add(updateTerm, gbcSide);

        gbcSide.gridx = 0;
        gbcSide.gridy = 5;
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
        listOfColleges.setPreferredSize(new Dimension(270, 30));
        searchProgramPanel.add(searchClassLabel);
        searchProgramPanel.add(listOfColleges);

        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.gridwidth = 1;
        centerPanel.add(searchProgramPanel, gbc);

        JPanel programsPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel programLabel = new JLabel("Programs:            ");
        program_ids = new JComboBox<>();
        program_ids.setPreferredSize(new Dimension(245, 30));
        programsPanel.add(programLabel);
        programsPanel.add(program_ids);

        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.gridwidth = 1;
        centerPanel.add(programsPanel, gbc);

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

        JPanel listCourses = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel listOfCourse = new JLabel("Courses:               ");
        listOfCourses = new JComboBox<>();
        listOfCourses.setPreferredSize(new Dimension(245, 30));
        listCourses.add(listOfCourse);
        listCourses.add(listOfCourses);

        gbc.gridx = 0;
        gbc.gridy = 5;
        gbc.gridwidth = 1;
        centerPanel.add(listCourses, gbc);

        JPanel capacityPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel enterCapacity = new JLabel("Enter capacity:   ");
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

        genderGroup = new ButtonGroup();
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
        studentCollege.setPreferredSize(new Dimension(275, 20));
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

        buttonPanels.add(registerStudent);
        buttonPanels.add(clearFields);

        gbc.gridx = 0;
        gbc.gridy = 8;
        centerPanel.add(buttonPanels, gbc);

        mainPanel.add(centerPanel, BorderLayout.NORTH);

        mainPanel.revalidate();
        mainPanel.repaint();
    }

    public void registerInstructorView(){
        mainPanel.removeAll();

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);
        gbc.anchor = GridBagConstraints.WEST;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.weightx = 1.0;

        JPanel firstNamePanel = new JPanel(new GridLayout(2, 1, 5, 5));
        JLabel firstNameLabel = new JLabel("First Name:");
        instructor_firstName = new JTextField(15);
        firstNamePanel.add(firstNameLabel);
        firstNamePanel.add(instructor_firstName);

        JPanel lastNamePanel = new JPanel(new GridLayout(2, 1, 5, 5));
        JLabel lastNameLabel = new JLabel("Last Name:");
        instructor_lastName = new JTextField(15);
        lastNamePanel.add(lastNameLabel);
        lastNamePanel.add(instructor_lastName);

        JPanel fullNamePanel = new JPanel(new FlowLayout(FlowLayout.LEFT, 10, 0));
        fullNamePanel.add(firstNamePanel);
        fullNamePanel.add(lastNamePanel);

        gbc.gridx = 0;
        gbc.gridy = 0;
        centerPanel.add(fullNamePanel, gbc);

        JPanel emailPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel emailLabel = new JLabel("Email:                     ");
        instructor_email = new JTextField(15);
        emailPanel.add(emailLabel);
        emailPanel.add(instructor_email);

        gbc.gridx = 0;
        gbc.gridy = 1;
        centerPanel.add(emailPanel, gbc);

        JPanel contactPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel contactLabel = new JLabel("Contact number: ");
        instructor_contactNo = new JTextField(15);
        contactPanel.add(contactLabel);
        contactPanel.add(instructor_contactNo);

        gbc.gridx = 0;
        gbc.gridy = 2;
        centerPanel.add(contactPanel, gbc);

        JPanel collegePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel collegeLabel = new JLabel("College:                 ");
        instructorCollege = new JComboBox<>();
        instructorCollege.setPreferredSize(new Dimension(275, 20));
        collegePanel.add(collegeLabel);
        collegePanel.add(instructorCollege);

        gbc.gridx = 0;
        gbc.gridy = 3;
        centerPanel.add(collegePanel, gbc);

        JPanel buttonPanels = new JPanel(new FlowLayout(FlowLayout.LEFT));
        registerInstructor = new JButton("Register Instructor");
        clearRegisterFieldsInstructor = new JButton("Clear Fields");
        buttonPanels.add(registerInstructor);
        buttonPanels.add(clearRegisterFieldsInstructor);

        gbc.gridx = 0;
        gbc.gridy = 4;
        centerPanel.add(buttonPanels, gbc);

        mainPanel.add(centerPanel, BorderLayout.WEST);

        mainPanel.revalidate();
        mainPanel.repaint();
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
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.weightx = 1.0;

        JPanel idNumberPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel idNumberlabel = new JLabel("Enter ID number: ");
        idNumber = new JTextField(20);
        search = new JButton("Search");
        idNumberPanel.add(idNumberlabel);
        idNumberPanel.add(idNumber);
        idNumberPanel.add(search);

        gbc.gridx = 0;
        gbc.gridy = 0;
        centerPanel.add(idNumberPanel, gbc);

        JPanel typePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel typeLabel = new JLabel("Type:                            ");
        typeLabel.setFont(labelFont);
        type = new JLabel("");
        type.setFont(labelFont);
        typePanel.add(typeLabel);
        typePanel.add(type);

        gbc.gridx = 0;
        gbc.gridy = 1;
        centerPanel.add(typePanel, gbc);

        JLabel idNumberLabel = new JLabel("ID number:                  ");
        idNumberLabel.setFont(labelFont);
        IDNumber = new JLabel("");
        IDNumber.setFont(textFieldFont);
        JPanel idPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        idPanel.add(idNumberLabel);
        idPanel.add(IDNumber);

        gbc.gridx = 0;
        gbc.gridy = 2;
        centerPanel.add(idPanel, gbc);

        JLabel firstNameLabel = new JLabel("First Name:                 ");
        firstNameLabel.setFont(labelFont);
        FirstName = new JLabel("");
        FirstName.setFont(labelFont);
        JPanel firstNamePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        firstNamePanel.add(firstNameLabel);
        firstNamePanel.add(FirstName);

        gbc.gridx = 0;
        gbc.gridy = 3;
        centerPanel.add(firstNamePanel, gbc);

        JLabel lastNameLabel = new JLabel("Last Name:                 ");
        lastNameLabel.setFont(labelFont);
        LastName = new JLabel("");
        LastName.setFont(labelFont);
        JPanel lastNamePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        lastNamePanel.add(lastNameLabel);
        lastNamePanel.add(LastName);

        gbc.gridx = 0;
        gbc.gridy = 4;
        centerPanel.add(lastNamePanel, gbc);

        JLabel emailLabel = new JLabel("Email:                          ");
        emailLabel.setFont(labelFont);
        Email = new JLabel("");
        Email.setFont(labelFont);
        JPanel emailPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        emailPanel.add(emailLabel);
        emailPanel.add(Email);

        gbc.gridx = 0;
        gbc.gridy = 5;
        centerPanel.add(emailPanel, gbc);

        JLabel phoneNumberLabel = new JLabel("Phone number:          ");
        phoneNumberLabel.setFont(labelFont);
        phoneNumber = new JLabel("");
        phoneNumber.setFont(labelFont);
        JPanel phoneNumberPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        phoneNumberPanel.add(phoneNumberLabel);
        phoneNumberPanel.add(phoneNumber);

        gbc.gridx = 0;
        gbc.gridy = 6;
        centerPanel.add(phoneNumberPanel, gbc);

        JLabel collegeLabel = new JLabel("College:                      ");
        collegeLabel.setFont(labelFont);
        College = new JLabel("");
        College.setFont(labelFont);
        JPanel CollegePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        CollegePanel.add(collegeLabel);
        CollegePanel.add(College);

        gbc.gridx = 0;
        gbc.gridy = 7;
        centerPanel.add(CollegePanel, gbc);

        horizontalPanel.add(centerPanel);

        mainPanel.add(horizontalPanel, BorderLayout.CENTER);

        mainPanel.repaint();
        mainPanel.revalidate();
    }

    public void setOpenClass(ActionListener listener){ this.openClass.addActionListener(listener);}

    public void setRegisterStudent(ActionListener listener){
        this.addStudent.addActionListener(listener);
    }

    public void setListOfColleges(ActionListener listener){
        listOfColleges.addActionListener(listener);
    }

    public void setListOfPrograms(ActionListener listener){
        program_ids.addActionListener(listener);
    }

    public String getStudentProgram(){
        return (String) studentProgram.getSelectedItem();
    }

    public String getSelectedCollege(){
        return (String) listOfColleges.getSelectedItem();
    }

    public String getStudentCollege(){
        return (String) studentCollege.getSelectedItem();
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

    public String getInstructorFirstName() { return instructor_firstName.getText(); }

    public String getInstructorLastName() { return instructor_lastName.getText(); }

    public String getInstructorEmail() { return instructor_email.getText(); }

    public String getInstructorContactNo() { return instructor_contactNo.getText(); }

    public String getInstructorCollege() { return (String) instructorCollege.getSelectedItem(); }

    public void setAddClass(ActionListener listener){
        this.addClass.addActionListener(listener);
    }

    public void clearInstructorList() {
        instructorModel.clear();
    }

    public void setClearRegisterInstructor(ActionListener listener) { this.clearRegisterFieldsInstructor.addActionListener(listener);}

    private void clearComboBoxListeners(JComboBox<String> comboBox) {
        for (ActionListener listener : comboBox.getActionListeners()) {
            comboBox.removeActionListener(listener);
        }
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

    public void resetProgramsAndCourses() {
        program_ids.removeAllItems();
        program_ids.setSelectedIndex(-1);
        listOfCourses.removeAllItems();
        listOfCourses.setSelectedIndex(-1);
    }

    public void populateProgram(int collegeId, AdminDao adminDao){
        program_ids.removeAllItems();
        for (String programs : adminDao.getProgramsByCollegeId(collegeId)){
            program_ids.addItem(programs);
        }
    }

    public void populateStudentCollege(AdminDao adminDao){
        studentCollege.removeAllItems();

        for (String college : adminDao.getColleges()){
            studentCollege.addItem(college);
        }
    }

    public void setStudentCollege(ActionListener listener){
        this.studentCollege.addActionListener(listener);
    }

    public void populateStudentProgram(int collegeID, AdminDao adminDao){
        studentProgram.removeAllItems();

        for (String programs: adminDao.getProgramsByCollegeId(collegeID)){
            studentProgram.addItem(programs);
        }
    }

    public void setInstructorCollege(ActionListener listener){ this.instructorCollege.addActionListener(listener);}

    public void RegisterInstructor(ActionListener listener) { this.registerInstructor.addActionListener(listener);}

    public void populateInstructorCollege(AdminDao adminDao){
        instructorCollege.removeAllItems();

        for (String college : adminDao.getColleges()){
            instructorCollege.addItem(college);
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

    public void setclearFields(ActionListener listener){
        this.clearFields.addActionListener(listener);
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

    public void RegisterStudent(ActionListener listener){
        this.registerStudent.addActionListener(listener);
    }

    public char getGender() {
        if (male.isSelected()) {
            return 'M';
        } else if (female.isSelected()) {
            return 'F';
        }

        return '\0';
    }

    public String getFirstName(){
        return firstName.getText().trim();
    }

    public String getLastName(){
        return lastName.getText().trim();
    }

    public String getContactNumber(){
        return contactNumber.getText().trim();
    }

    public String getEmail(){
        return email.getText().trim();
    }

    public String getHomeAddress(){
        return homeAddress.getText().trim();
    }

    public void setListOfMonths(ActionListener listener){ Month.addActionListener(listener); }

    public String getSelectedMonth(){
        return (String) Month.getSelectedItem();
    }

    public String getStudentBirthday(){
        String month = (String) Month.getSelectedItem();
        String day = (String) Day.getSelectedItem();
        String year = (String) Year.getSelectedItem();

        return month + " " + day + ", " + year;
    }


    public void populateDateComboBoxes(AdminDao adminDao) {
        Month.removeAllItems();
        for (String month : adminDao.getMonths()) {
            Month.addItem(month);
        }

        Year.removeAllItems();
        for (String year : adminDao.getYears()) {
            Year.addItem(year);
        }

        updateDaysComboBox(adminDao, "January");
    }

    public void updateDaysComboBox(AdminDao adminDao, String selectedMonth) {
        Day.removeAllItems();
        for (String day : adminDao.getDays(selectedMonth)) {
            Day.addItem(day);
        }
    }

    public void setUpdateTerm(ActionListener listener){
        this.updateTerm.addActionListener(listener);
    }

    public void setRegisterInstructor(ActionListener listener){
        this.addInstructor.addActionListener(listener);
    }

    public String getIDNumber(){
        return this.idNumber.getText();
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

    public void setCollegeID(String college){
        this.College.setText(college);
    }

    public void resetStudentFields() {
        firstName.setText("");
        lastName.setText("");
        contactNumber.setText("");
        email.setText("");
        homeAddress.setText("");

        genderGroup.clearSelection();

        Month.setSelectedIndex(-1);
        Day.setSelectedIndex(-1);
        Year.setSelectedIndex(-1);
        studentCollege.setSelectedIndex(-1);
        studentProgram.setSelectedIndex(-1);
    }

    public void resetInstructorFields(){
        instructor_firstName.setText("");
        instructor_lastName.setText("");
        instructor_contactNo.setText("");
        instructor_email.setText("");

        instructorCollege.setSelectedIndex(-1);
    }

    public void resetPanel(){
        mainPanel.revalidate();
        mainPanel.repaint();
    }

    public void setSearchButton(ActionListener listener){
        this.search.addActionListener(listener);
    }

    public void setSearchProfileButton(ActionListener listener){
        this.searchProfile.addActionListener(listener);
    }


}