import javax.swing.*;
import java.awt.*;

public class StudentView extends JFrame {

    private JPanel mainPanel;
    private Student student;

    private JButton viewSchedButton;
    private JButton viewCoursesButton;
    private JButton dropCourseButton;
    private JButton enrollCourse;

    private JTextField courseField;
    private JTextField classField;

    private JScrollPane courseScrollPane;
    private JPanel courseListPanel;

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

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();

        JLabel courseLabel = new JLabel("Enter Course Name:");
        courseField = new JTextField(20);

        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.insets = new Insets(10, 10, 10, 10);
        gbc.anchor = GridBagConstraints.WEST;
        centerPanel.add(courseLabel, gbc);

        gbc.gridx = 1;
        gbc.gridy = 0;
        gbc.weightx = 1.0;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        centerPanel.add(courseField, gbc);

        JLabel classLabel = new JLabel("Enter Class:");
        classField = new JTextField(20);

        gbc.gridx = 0;
        gbc.gridy = 5;
        gbc.weightx = 0;
        gbc.fill = GridBagConstraints.NONE;
        gbc.anchor = GridBagConstraints.WEST;
        centerPanel.add(classLabel, gbc);

        gbc.gridx = 1;
        gbc.gridy = 5;
        gbc.weightx = 1.0;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        centerPanel.add(classField, gbc);

        courseScrollPane = new JScrollPane(courseListPanel);
        courseScrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
        courseScrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        courseScrollPane.setPreferredSize(new Dimension(400, 200));

        gbc.gridx = 0;
        gbc.gridy = 3;
        gbc.gridwidth = 2;
        gbc.fill = GridBagConstraints.BOTH;
        gbc.weighty = 1.0;
        centerPanel.add(courseScrollPane, gbc);

        mainPanel.add(centerPanel, BorderLayout.CENTER);

        JPanel bottomPanel = new JPanel();
        JPanel sidePanel2 = new JPanel();

        this.add(topPanel, BorderLayout.NORTH);
        this.add(sidePanel, BorderLayout.WEST);
        this.add(sidePanel2, BorderLayout.EAST);
        this.add(bottomPanel, BorderLayout.SOUTH);

        this.add(mainPanel, BorderLayout.CENTER);

        validate();
        repaint();
    }

    public static void main(String[] args) {
        new StudentView();
    }
}
