import java.awt.*;
import java.awt.event.ActionListener;
import javax.swing.*;

public class LoginView extends JFrame{
    private JTextField idField;
    private JTextField passField;

    private JButton enterButton;
    private JButton adminButton;
    private JButton instructorButton;

    public LoginView (){
        super();

        setSize(400, 700);

        setBackground(Color.WHITE);

        setLayout(new BorderLayout());

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        setVisible(true);

        init();
    }

    private void init() {
        JPanel topPanel = new JPanel(new BorderLayout());
        JLabel topLabel = new JLabel("EnrollmentHub", SwingConstants.CENTER);
        topLabel.setFont(new Font("Arial", Font.BOLD, 24));

        topPanel.add(topLabel, BorderLayout.CENTER);

        this.add(topPanel, BorderLayout.NORTH);

        JPanel midCenterPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();

        JLabel idLabel = new JLabel("ID Number:");
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.anchor = GridBagConstraints.WEST;
        midCenterPanel.add(idLabel, gbc);

        idField = new JTextField(15);
        gbc.gridx = 1;
        gbc.gridy = 0;
        gbc.weightx = 1.0;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        midCenterPanel.add(idField, gbc);

        JLabel passLabel = new JLabel("Password:");
        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.insets = new Insets(5, 5, 5, 5);
        gbc.anchor = GridBagConstraints.WEST;
        midCenterPanel.add(passLabel, gbc);

        passField = new JTextField(15);
        gbc.gridx = 1;
        gbc.gridy = 1;
        gbc.weightx = 1.0;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        midCenterPanel.add(passField, gbc);

        enterButton = new JButton("Login");
        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.gridwidth = 2; // Span across both columns
        gbc.weightx = 0;
        gbc.insets = new Insets(10, 5, 5, 5);
        gbc.anchor = GridBagConstraints.CENTER;
        gbc.fill = GridBagConstraints.NONE;
        midCenterPanel.add(enterButton, gbc);

        JPanel southPanel = new JPanel(new GridBagLayout());
        GridBagConstraints southGbc = new GridBagConstraints();

        adminButton = new JButton("<html><u>Admin view</u></html>");
        adminButton.setOpaque(false);
        adminButton.setContentAreaFilled(false);
        adminButton.setBorderPainted(false);
        adminButton.setFocusPainted(false);

        instructorButton = new JButton("<html><u>Instructor view</u></html>");
        instructorButton.setOpaque(false);
        instructorButton.setContentAreaFilled(false);
        instructorButton.setBorderPainted(false);
        instructorButton.setFocusPainted(false);

        southGbc.gridx = 0;
        southGbc.gridy = 0;
        southGbc.insets = new Insets(10, 5, 10, 5);
        southGbc.anchor = GridBagConstraints.CENTER;
        southPanel.add(adminButton, southGbc);

        southGbc.gridx = 1;
        southGbc.gridy = 0;
        southGbc.insets = new Insets(10, 5, 10, 5);
        southGbc.anchor = GridBagConstraints.CENTER;
        southPanel.add(instructorButton, southGbc);

        this.add(southPanel, BorderLayout.SOUTH);
        this.add(midCenterPanel, BorderLayout.CENTER);
    }

    public int getIdNumber(){
        return Integer.parseInt(idField.getText());
    }

    public String getPassword(){
        return passField.getText();
    }

    public void setEnterButton(ActionListener listener){
        enterButton.addActionListener(listener);
    }

    public void setAdminButton(ActionListener listener){
        adminButton.addActionListener(listener);
    }

    public void setInstructorButton(ActionListener listener){
        instructorButton.addActionListener(listener);
    }


}
