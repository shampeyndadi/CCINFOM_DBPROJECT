import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionListener;

public class InstructorView extends JFrame {

    private JPanel mainPanel;
    private JButton gradeStudents;
    private JButton viewSchedule;
    private JButton updatePersonalInformation;
    private JButton viewClasses;
    private JButton signOut;
    private JButton submit;
    private JButton clearGradeFields;

    private JComboBox assignedClasses;

    private JTable classListTable;
    private DefaultTableModel tableModel;

    private JScrollPane classScrollPane;

    public InstructorView() {
        super("Instructor View");
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

        gradeStudents = new JButton("Submit Final Grades");
        viewSchedule = new JButton("View Schedule");
        updatePersonalInformation = new JButton("Update Personal Information");
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
            public boolean isCellEditable(int row, int column) {
                return column == 3; // Only the "Grade" column is editable
            }
        };

        classListTable = new JTable(tableModel);
        classListTable.setRowHeight(30);

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
        clearGradeFields = new JButton("Clear fields");
        bottomPanel.add(submit);
        bottomPanel.add(clearGradeFields);

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

    public void populateClassIdComboBox(InstructorDao instructorDao, int instructorID){
        assignedClasses.removeAllItems();

        for (int classID : instructorDao.getClassIdsForInstructor(instructorID)){
            assignedClasses.addItem(classID);
        }

    }

    public void setGradeStudents(ActionListener listener){
        this.gradeStudents.addActionListener(listener);
    }

    public void setSignOut(ActionListener listener){
        this.signOut.addActionListener(listener);
    }

    public static void main(String[] args){
        InstructorView instructorView = new InstructorView();

        instructorView.submitFinalGradesView();
    }
}


