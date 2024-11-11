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

    private JTextField courseField;
    private JTextField classField;

    private JScrollPane courseScrollPane;
    private JPanel courseListPanel;

    private JTable classTable;
    private DefaultTableModel tableModel;


    public StudentView() {
        super("Student View");
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

        enrollCourse = new JButton("Enroll Course");
        dropCourseButton = new JButton("Drop Course");
        viewSchedButton = new JButton("View Schedule");
        viewCoursesButton = new JButton("View Courses");
        logoutButton = new JButton("Logout");

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
        sidePanel.add(viewCoursesButton, gbcSide);

        gbcSide.gridx = 0;
        gbcSide.gridy = 4;
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

    public void dropCourseView(){
        mainPanel.removeAll();



        mainPanel.repaint();
        mainPanel.revalidate();
    }

    public void populateClassTable(Object[][] data) {
        tableModel.setRowCount(0); // Clear existing data
        for (Object[] row : data) {
            tableModel.addRow(row);
        }
    }

    public String getCourseName(){
        return courseField.getText();
    }

    public void setViewSchedButton(ActionListener listener){
        this.viewSchedButton.addActionListener(listener);
    }

    public void setDropCourseButton(ActionListener listener){
        this.dropCourseButton.addActionListener(listener);
    }

    public void setViewCoursesButton(ActionListener listener){
        this.viewCoursesButton.addActionListener(listener);
    }

    public void setLogoutButton(ActionListener listener){
        this.logoutButton.addActionListener(listener);
    }

    public void setEnrollCourse(ActionListener listener){
        this.enrollCourse.addActionListener(listener);
    }

    public void setSearchButton(ActionListener listener){
        this.searchButton.addActionListener(listener);
    }

}
