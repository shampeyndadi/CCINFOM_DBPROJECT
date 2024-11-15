import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.table.DefaultTableModel;

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

    private JTextField SearchClassField;
    private JTextField instructorID;
    private JTextField Capacity;

    private JComboBox listOfCourses;
    private JComboBox startTimes;
    private JComboBox scheduledDays;
    private JComboBox listOfColleges;
    private JComboBox program_ids;

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

    public void setOpenClass(ActionListener listener){ this.openClass.addActionListener(listener);}

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

}