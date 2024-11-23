import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.InputMismatchException;

public class LoginInstructorController {

    private InstructorLogin instructorLogin;
    private LoginView loginView;
    private InstructorDao instructorDao;

    public LoginInstructorController(LoginView loginView, InstructorLogin instructorLogin){
        this.loginView = loginView;
        this.instructorLogin = instructorLogin;
        this.instructorDao = new InstructorDao();

        instructorLogin.setSignIn(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try{
                    int idNumber = instructorLogin.getIdnumber();
                    char [] enteredPassword = instructorLogin.getPassword();
                    String password = new String(enteredPassword);

                    if (instructorDao.authenticateUser(idNumber, password)){
                        InstructorView instructorView = new InstructorView(idNumber);
                        new InstructorController(instructorView, instructorLogin, idNumber);
                        instructorLogin.dispose();
                        instructorLogin.resetTextField();
                    }else{
                        JOptionPane.showMessageDialog(instructorLogin, "Instructor not found.", "Login Error", JOptionPane.ERROR_MESSAGE);
                    }
                }catch(InputMismatchException e1){
                    JOptionPane.showMessageDialog(instructorLogin, "Invalid ID format.", "Input Error", JOptionPane.ERROR_MESSAGE);
                }catch (NumberFormatException e1 ){
                    JOptionPane.showMessageDialog(instructorLogin, "Invalid Input.", "Input Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        instructorLogin.setBack(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                instructorLogin.dispose();
                loginView.setVisible(true);
            }
        });

    }


}
