import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.InputMismatchException;

public class EnrollmentHubController {
    private LoginView loginUI;
    private StudentDao studentDao;

    public EnrollmentHubController(){
        this.loginUI = new LoginView();
        this.studentDao = new StudentDao();

        this.loginUI.setEnterButton(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try{
                    int idNumber = loginUI.getIdNumber();
                    String password = loginUI.getPassword();

                    if (studentDao.authenticateUser(idNumber, password)){
                        StudentView studentView = new StudentView();
                        new StudentViewController(studentView, loginUI, studentDao);
                        loginUI.resetTextFields();
                        loginUI.dispose();
                    }else{
                        JOptionPane.showMessageDialog(loginUI, "Student not found.", "Login Error", JOptionPane.ERROR_MESSAGE);
                    }
                }catch(InputMismatchException e1){
                    JOptionPane.showMessageDialog(loginUI, "Invalid ID format.", "Input Error", JOptionPane.ERROR_MESSAGE);
                }catch (NumberFormatException e1 ){
                    JOptionPane.showMessageDialog(loginUI, "Invalid Input.", "Input Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        });
    }

}
