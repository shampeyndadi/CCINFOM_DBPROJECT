import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

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

                adminView.setListOfColleges(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String selectedCollege = adminView.getSelectedCollege();

                        if (selectedCollege != null && !selectedCollege.isEmpty()) {
                            int collegeId = adminDao.getCollegeIdByName(selectedCollege);

                            ArrayList<String> courses = adminDao.getCourses(collegeId);
                            adminView.setCourses(courses);

                            adminView.populateProgram(collegeId, adminDao);
                            adminView.enableComboBox();

                            searchProfs(collegeId, adminView, adminDao);
                        }

                        adminView.setClearFields(new ActionListener() {
                            @Override
                            public void actionPerformed(ActionEvent e) {
                                adminView.resetView(adminDao);
                            }
                        });
                    }
                });

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

    private void searchProfs(int collegeID, AdminView adminView, AdminDao adminDao){
        adminView.setSearchInstructors(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                     String selectedCourse = adminView.getSelectedCourse();
                     String classHours = adminView.getSelectedClassHours();
                     String scheduledDays = adminView.getSelectedDays();

                if (selectedCourse != null && classHours != null && scheduledDays != null) {
                    ArrayList<String[]> availableInstructors = adminDao.getAvailableInstructors(collegeID, selectedCourse, classHours, scheduledDays);

                    adminView.clearInstructorList();

                    adminView.addInstructorPanel();

                    if (availableInstructors.isEmpty()) {
                        JOptionPane.showMessageDialog(adminView, "No available instructors found for the selected time slot.");
                    } else {
                        for (String[] instructor : availableInstructors) {
                            String displayText = "ID: " + instructor[0] + " - " + instructor[1];
                            adminView.addInstructorToList(displayText);
                        }

                        openClass(adminView, adminDao);
                    }
                } else {
                    JOptionPane.showMessageDialog(adminView, "Please select a course, class hours, and scheduled days.");
                }
            }
        });
    }

    private void openClass(AdminView adminView, AdminDao adminDao) {
        adminView.setAddClass(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    String selectedCollege = adminView.getSelectedCollege();
                    int collegeId = adminDao.getCollegeIdByName(selectedCollege);

                    String selectedCourse = adminView.getSelectedCourse();
                    String classHours = adminView.getSelectedClassHours();
                    String scheduledDays = adminView.getSelectedDays();
                    String programId = adminView.getSelectedProgram();

                    String maxCapacityInput = adminView.getMaxCapacity();
                    String instructorIdInput = adminView.getInstructorID();

                    if (maxCapacityInput == null || maxCapacityInput.isEmpty() || instructorIdInput == null || instructorIdInput.isEmpty()) {
                        JOptionPane.showMessageDialog(adminView, "Please fill in both Max Capacity and Instructor ID.", "Input Error", JOptionPane.WARNING_MESSAGE);
                        return;
                    }

                    int maxCapacity = Integer.parseInt(maxCapacityInput);
                    int instructorID = Integer.parseInt(instructorIdInput);

                    boolean isClassAdded = adminDao.addClass(selectedCourse, programId, instructorID, collegeId, maxCapacity, scheduledDays, classHours);

                    if (isClassAdded) {
                        JOptionPane.showMessageDialog(adminView, "Class added successfully!", "Success", JOptionPane.INFORMATION_MESSAGE);
                        adminView.resetView(adminDao);
                    } else {
                        JOptionPane.showMessageDialog(adminView, "Failed to add class. Please check the input or try again.", "Error", JOptionPane.ERROR_MESSAGE);
                    }

                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(adminView, "Invalid input for Max Capacity or Instructor ID. Please enter valid numbers.", "Input Error", JOptionPane.ERROR_MESSAGE);
                } catch (NullPointerException ex) {
                    JOptionPane.showMessageDialog(adminView, "Please ensure all fields are selected and filled out correctly.", "Input Error", JOptionPane.WARNING_MESSAGE);
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(adminView, "An unexpected error occurred: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        });
    }


}