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

        this.studentView.setUpdatePersonalInformation(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                studentView.updatePersonalInformationView();
                Student s1 = studentDao.getStudentInfo(idNumber);

                studentView.setIdNumberText(idNumber);
                studentView.setProgramId(s1.getProgramId());
                studentView.setGender(Character.toString(s1.getGender()));
                studentView.setBirthday(s1.getBirthday());

                updateInfo(studentView, s1, studentDao, idNumber);

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
                try {
                    int classId = studentView.getClassNumber();

                    studentDao.dropStudentFromClass(idNumber, classId);

                    Object[][] enrolledDate = studentDao.getEnrolledCourses(idNumber);
                    studentView.populateEnrolledTable(enrolledDate);

                    studentView.revalidatePanel();
                }catch (NumberFormatException ex){

                }
            }
        });
    }

    private void updateInfo(StudentView studentView, Student s1, StudentDao studentDao, int idNumber){
        this.studentView.setSaveChangesButton(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String newFirstName = studentView.getNewFirstName();
                String newLastName = studentView.getNewLastName();
                String newEmail = studentView.getNewEmail();
                String newPhoneNumber = studentView.getNewPhoneNumber();
                String newHomeAddress = studentView.getNewHomeAddress();

                if (newFirstName.isEmpty() || newLastName.isEmpty() || newEmail.isEmpty() || newPhoneNumber.isEmpty() || newHomeAddress.isEmpty()) {
                    JOptionPane.showMessageDialog(
                            studentView,
                            "All fields must be filled out. Please complete all fields before saving.",
                            "Input Error",
                            JOptionPane.WARNING_MESSAGE
                    );
                    return;
                }

                String message = "Are you sure you want to save the following changes?\n"
                        + "First Name: " + s1.getFirstName() + " -> " + newFirstName + "\n"
                        + "Last Name: " + s1.getLastName() + " -> " + newLastName + "\n"
                        + "Email: " + s1.getEmail() + " -> " + newEmail + "\n"
                        + "Phone Number: " + s1.getPhoneNumber() + " -> " + newPhoneNumber + "\n"
                        + "Home Address: " + s1.getAddress() + " -> " + newHomeAddress;

                int response = JOptionPane.showConfirmDialog(
                        studentView,
                        message,
                        "Confirm Changes",
                        JOptionPane.YES_NO_OPTION,
                        JOptionPane.QUESTION_MESSAGE
                );

                if (response == JOptionPane.YES_OPTION) {
                    studentDao.updateStudentInfo(idNumber, newFirstName, newLastName, newEmail, newPhoneNumber, newHomeAddress);
                    studentView.clearTextFields();
                }
            }
        });

        this.studentView.setCancelButton(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                studentView.clearTextFields();
            }
        });
    }
}
