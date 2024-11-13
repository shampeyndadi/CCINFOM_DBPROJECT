import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;

import javax.swing.table.DefaultTableModel;


public class AdminView extends JFrame {

    private JPanel mainPanel;
    private Student student;

    private JButton Back;
    private JButton openClass;
    private JButton addStudent;
    private JButton addInstructor;
    private JButton searchProfile;
    private JButton searchClass;
    private JButton signOut;
    private JButton signIn;

    private JTextField userName;
    private JTextField passWord;


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

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);
        gbc.anchor = GridBagConstraints.CENTER;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.weightx = 1.0;

        JLabel adminLabel = new JLabel("Admin");
        Font labelFont = new Font("Arial", Font.BOLD, 18);
        adminLabel.setFont(labelFont);
        JPanel adminPanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
        adminPanel.add(adminLabel);

        gbc.gridx = 0;
        gbc.gridy = 0;
        centerPanel.add(adminPanel, gbc);

        JLabel loginLabel = new JLabel("Enter username: ");
        userName = new JTextField(20);
        JPanel userPanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
        userPanel.add(loginLabel);
        userPanel.add(userName);

        gbc.gridx = 0;
        gbc.gridy = 1;
        centerPanel.add(userPanel, gbc);

        JLabel passwordLabel = new JLabel("Enter password: ");
        passWord = new JTextField(20);
        JPanel passwordPanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
        passwordPanel.add(passwordLabel);
        passwordPanel.add(passWord);

        gbc.gridx = 0;
        gbc.gridy = 2;
        centerPanel.add(passwordPanel, gbc);

        signIn = new JButton("Sign In");
        Back = new JButton("Back");
        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
        buttonPanel.add(signIn);
        buttonPanel.add(Back);

        gbc.gridx = 0;
        gbc.gridy = 3;
        centerPanel.add(buttonPanel, gbc);

        mainPanel.add(centerPanel, BorderLayout.CENTER);

        JPanel bottomPanel1 = new JPanel();
        JPanel sidePanel2 = new JPanel();
        JPanel sidePanel = new JPanel();

        this.add(topPanel, BorderLayout.NORTH);
        this.add(sidePanel, BorderLayout.WEST);
        this.add(sidePanel2, BorderLayout.EAST);
        this.add(bottomPanel1, BorderLayout.SOUTH);

        this.add(mainPanel, BorderLayout.CENTER);

        validate();
        repaint();
    }

    public void mainView(){
        mainPanel.removeAll();

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

        mainPanel.revalidate();
        mainPanel.repaint();
    }

    public void setSignIn(ActionListener listener){
        this.signIn.addActionListener(listener);
    }

    public void setBack(ActionListener listener){
        this.Back.addActionListener(listener);
    }

    public String getUsername(){
        return this.userName.getText();
    }

    public void setSignOut(ActionListener listener){
        this.signOut.addActionListener(listener);
    }

    public String getPassword(){
        return this.passWord.getText();
    }

    public void resetTextFields(){
        this.userName.setText("");
        this.passWord.setText("");
    }

}
