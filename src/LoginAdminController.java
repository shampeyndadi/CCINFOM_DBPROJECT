import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class LoginAdminController {

    private AdminView adminView;
    private LoginView loginView;
    private AdminLogin loginAdmin;

    public LoginAdminController(LoginView loginUI, AdminLogin loginAdmin){
        this.loginView = loginUI;
        this.loginAdmin = loginAdmin;

       loginAdmin.setSignIn(new ActionListener() {
           @Override
           public void actionPerformed(ActionEvent e) {
               String username = "GROUP9_ADMIN";
               String password = "weWILLPASS";

               String retractedUsername = loginAdmin.getUsername().trim();
               String retractedPassword = loginAdmin.getPassword().trim();

               if (username.equals(retractedUsername) && password.equals(retractedPassword)){
                  AdminView adminView = new AdminView();
                  new AdminController(adminView, loginAdmin);
                  loginAdmin.dispose();
               }else{
                   loginAdmin.resetTextField();
                   JOptionPane.showMessageDialog(adminView, "Invalid username or password.", "Invalid Credentials", JOptionPane.INFORMATION_MESSAGE);
               }

           }
       });

       loginAdmin.setBack(new ActionListener() {
           @Override
           public void actionPerformed(ActionEvent e) {
               loginAdmin.dispose();
               loginUI.setVisible(true);
           }
       });

    }
}
