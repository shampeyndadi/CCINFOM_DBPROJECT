import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class AdminController {
    private AdminView adminView;
    private AdminLogin adminLogin;

    public AdminController(AdminView adminView, AdminLogin adminLogin){
        this.adminView = adminView;
        this.adminLogin = adminLogin;

        this.adminView.setOpenClass(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                AdminDao adminDao = new AdminDao();
                adminView.openClassView();
                adminView.populateComboBoxes(adminDao);
            }
        });

        this.adminView.setSignOut(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                adminView.dispose();
                adminLogin.setVisible(true);
            }
        });

    }
}
