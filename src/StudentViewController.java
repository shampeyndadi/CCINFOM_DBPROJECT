import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class StudentViewController {
    private StudentView studentView;
    private LoginView login;
    private StudentDao studentDao;

    public StudentViewController(StudentView studentView, LoginView login, StudentDao studentDao){
        this.studentView = studentView;
        this.login = login;
        this.studentDao = studentDao;

        this.studentView.setDropCourseButton(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                studentView.dropCourseView();
            }
        });

        this.studentView.setEnrollCourse(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                studentView.enrollCourseView();
                enroll(studentView, studentDao);
            }
        });

        this.studentView.setLogoutButton(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                studentView.dispose();
                login.setVisible(true);
            }
        });
    }

    private void enroll(StudentView studentView, StudentDao studentDao){
        this.studentView.setSearchButton(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String courseName = studentView.getCourseName();
                Object[][] classData = studentDao.searchClasses(courseName);

                if (classData.length == 0) {
                    JOptionPane.showMessageDialog(studentView, "No classes found.", "Search Result", JOptionPane.INFORMATION_MESSAGE);
                } else {
                    studentView.populateClassTable(classData);
                }
            }
        });
    }
}
