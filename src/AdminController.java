import com.mysql.cj.log.Log;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class AdminController {

    private AdminView adminView;
    private LoginView loginView;

    public AdminController(AdminView adminView, LoginView loginUI){
        this.adminView = adminView;
        this.loginView = loginUI;

        this.adminView.setSignIn(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String username = "GROUP9_ADMIN";
                String password = "weWILLPASS";

                String retractedUsername = adminView.getUsername().trim();
                String retractedPassword = adminView.getPassword().trim();

                if (username.equalsIgnoreCase(retractedUsername) && password.equalsIgnoreCase(retractedPassword)){
                    adminView.mainView();

                    adminView.setSignOut(new ActionListener() {
                        @Override
                        public void actionPerformed(ActionEvent e) {
                            adminView.dispose();
                            loginUI.setVisible(true);
                        }
                    });
                }else{
                    adminView.resetTextFields();
                    JOptionPane.showMessageDialog(adminView, "Invalid username or password.", "Invalid Credentials", JOptionPane.INFORMATION_MESSAGE);
                }
            }
        });

        this.adminView.setBack(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                adminView.dispose();
                loginView.setVisible(true);
            }
        });

    }

}
