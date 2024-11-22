import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;

public class InstructorLogin extends JFrame {

    private JTextField userName;
    private JTextField passWord;
    private JButton backButton;
    private JButton signInButton;

    public InstructorLogin() {
        super("Instructor Login");

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(400, 600);
        setMinimumSize(new Dimension(300, 500));
        setLocationRelativeTo(null);

        init();

        pack();
        setVisible(true);
    }

    private void init() {
        JPanel mainPanel = new JPanel(new BorderLayout());
        mainPanel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));

        JPanel centerPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(10, 10, 10, 10);
        gbc.fill = GridBagConstraints.HORIZONTAL;

        JLabel adminLabel = new JLabel("Instructor Login");
        adminLabel.setFont(new Font("Arial", Font.BOLD, 24));
        adminLabel.setHorizontalAlignment(SwingConstants.CENTER);
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.gridwidth = 2;
        centerPanel.add(adminLabel, gbc);

        JLabel loginLabel = new JLabel("Enter username:");
        loginLabel.setFont(new Font("Arial", Font.PLAIN, 16));
        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.gridwidth = 1;
        centerPanel.add(loginLabel, gbc);

        userName = new JTextField(20);
        gbc.gridx = 1;
        gbc.gridy = 1;
        centerPanel.add(userName, gbc);

        JLabel passwordLabel = new JLabel("Enter password:");
        passwordLabel.setFont(new Font("Arial", Font.PLAIN, 16));
        gbc.gridx = 0;
        gbc.gridy = 2;
        centerPanel.add(passwordLabel, gbc);

        passWord = new JTextField(20);
        gbc.gridx = 1;
        gbc.gridy = 2;
        centerPanel.add(passWord, gbc);

        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.CENTER, 20, 10));
        signInButton = new JButton("Sign In");
        backButton = new JButton("Back");

        buttonPanel.add(signInButton);
        buttonPanel.add(backButton);

        gbc.gridx = 0;
        gbc.gridy = 3;
        gbc.gridwidth = 2;
        centerPanel.add(buttonPanel, gbc);

        mainPanel.add(centerPanel, BorderLayout.CENTER);

        this.add(mainPanel);
    }

    public void setSignIn(ActionListener listener){
        this.signInButton.addActionListener(listener);
    }

    public void setBack(ActionListener listener){
        this.backButton.addActionListener(listener);
    }

    public int getIdnumber(){
        return Integer.parseInt(userName.getText());
    }

    public String getPassword(){
        return passWord.getText();
    }

    public void resetTextField(){
        userName.setText("");
        passWord.setText("");
    }

}
