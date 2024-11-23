import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class InstructorController {

    private InstructorView instructorView;
    private InstructorLogin instructorLogin;
    private int inst_id;

    public InstructorController (InstructorView instructorView, InstructorLogin instructorLogin, int inst_id){
        this.instructorView = instructorView;
        this.instructorLogin = instructorLogin;
        this.inst_id = inst_id;

        this.instructorView.setGradeStudents(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                InstructorDao instructorDao = new InstructorDao();
                instructorView.submitFinalGradesView();
                instructorView.populateClassIdComboBox(instructorDao, inst_id);

                instructorView.setAssignedClass(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        getStudents();
                    }
                });

                instructorView.setSubmitButton(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        int confirmation = JOptionPane.showConfirmDialog(
                                null,
                                "Are you sure you want to submit grades? Once submitted, they cannot be modified.",
                                "Confirm Submission",
                                JOptionPane.YES_NO_OPTION,
                                JOptionPane.WARNING_MESSAGE
                        );

                        if (confirmation == JOptionPane.YES_OPTION) {
                            submitGrades();
                        } else {
                            JOptionPane.showMessageDialog(
                                    null,
                                    "Grade submission canceled.",
                                    "Submission Canceled",
                                    JOptionPane.INFORMATION_MESSAGE
                            );
                        }
                    }
                });
            }
        });

        this.instructorView.setViewSchedule(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                instructorView.viewScheduleView();
            }
        });

        this.instructorView.setViewPersonalInformation(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                InstructorDao instructorDao = new InstructorDao();

                instructorView.viewPersonalInformationView();

                Instructor instructor = instructorDao.getInstructorDetails(inst_id);

                instructorView.setType("Instructor");
                instructorView.setEmail(instructor.getEmail());
                instructorView.setFirstName(instructor.getFirstName());
                instructorView.setLastName(instructor.getLastName());
                instructorView.setCollege(instructor.getCollegeName());
                instructorView.setPhoneNumber(instructor.getContactNo());
                instructorView.setIDNumber(String.valueOf(instructor.getInstructorId()));

            }
        });

        this.instructorView.setViewClasses(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                InstructorDao instructorDao = new InstructorDao();
                instructorView.viewClass();
                instructorView.populateClassIdComboBox1(instructorDao, inst_id);

                instructorView.setAssignedClasses1(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        getStudents1();
                    }
                });

            }
        });

        this.instructorView.setSignOut(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                instructorView.dispose();
                instructorLogin.setVisible(true);

            }
        });
    }

    private void getStudents(){
        Integer selectedClassID = instructorView.getClassId();

        if (selectedClassID != null){
            InstructorDao instructorDao = new InstructorDao();
            instructorView.populateStudentTable(instructorDao, selectedClassID);
        }
    }

    private void getStudents1(){
        Integer selectedClassID = instructorView.getClassId1();

        if (selectedClassID != null){
            InstructorDao instructorDao = new InstructorDao();
            instructorView.populateStudentTable1(instructorDao, selectedClassID);
        }
    }

    private void submitGrades() {
        InstructorDao instructorDao = new InstructorDao();
        AdminDao adminDao = new AdminDao();

        int classId = instructorView.getClassId();
        String courseId = instructorDao.getCourseIdForClass(classId);
        ArrayList<Student> students = instructorDao.getStudentsForClass(classId);

        boolean hasLockedGrades = false;
        boolean allGradesSaved = true;

        for (Student student : students) {
            if (instructorDao.isGradeLocked(student.getStudentId(), classId)) {
                hasLockedGrades = true;
            }
        }

        if (hasLockedGrades) {
            JOptionPane.showMessageDialog(null,
                    "Grades for this class have already been submitted and locked. Further modifications are not allowed.",
                    "Submission Halted",
                    JOptionPane.WARNING_MESSAGE);
            return;
        }

        for (int i = 0; i < students.size(); i++) {
            Student student = students.get(i);
            double grade = instructorView.getGradeInput(i);

            if (grade < 0.0) {
                System.err.println("Invalid grade for student ID: " + student.getStudentId());
                allGradesSaved = false;
                continue;
            }

            boolean success = instructorDao.saveGrade(
                    student.getStudentId(),
                    courseId,
                    adminDao.getCurrentTerm(),
                    adminDao.getCurrentSchoolYear(),
                    grade
            );

            if (!success) {
                allGradesSaved = false;
            }
        }

        if (allGradesSaved) {
            ArrayList<String> academicHistoryIds = instructorDao.getAcademicHistoryIds(
                    courseId,
                    adminDao.getCurrentTerm(),
                    adminDao.getCurrentSchoolYear()
            );

            for (String academicHistoryId : academicHistoryIds) {
                instructorDao.lockGrades(academicHistoryId);
            }

            JOptionPane.showMessageDialog(null,
                    "All grades have been saved and locked successfully.",
                    "Grades Locked",
                    JOptionPane.INFORMATION_MESSAGE);

            instructorView.setGradesSubmitted(true);

        } else {
            JOptionPane.showMessageDialog(null,
                    "Some grades could not be saved. Grades will not be locked.",
                    "Error",
                    JOptionPane.WARNING_MESSAGE);
        }
    }



}