import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class StudentViewController {
    private StudentView studentView;
    private LoginView login;
    private StudentDao studentDao;
    private int idNumber;

    public StudentViewController(StudentView studentView, LoginView login, StudentDao studentDao, int idNumber){
        this.studentView = studentView;
        this.login = login;
        this.studentDao = studentDao;
        this.idNumber = idNumber;

        this.studentView.setDropCourseButton(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                studentView.dropCourseView();

                Object[][] enrolledDate = studentDao.getEnrolledCourses(idNumber);
                studentView.populateEnrolledTable(enrolledDate);

                dropSubject(studentView, studentDao, idNumber);
            }
        });

        this.studentView.setEnrollCourse(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                studentView.enrollCourseView();
                enroll(studentView, studentDao, idNumber);
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

    private void enroll(StudentView studentView, StudentDao studentDao, int idNumber){
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

        this.studentView.setEnrollButton(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String courseName = studentView.getCourseName();
                int classId = studentView.getClassNumber();
                studentDao.enrollStudent(idNumber, classId, courseName);
            }
        });

    }

    private void dropSubject(StudentView studentView, StudentDao studentDao, int idNumber){
        this.studentView.setDropButton(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                int classId = studentView.getClassNumber();
                studentDao.dropStudentFromClass(idNumber, classId);

                studentView.revalidatePanel();
            }
        });
    }
}
