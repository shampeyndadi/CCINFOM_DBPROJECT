import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.HashMap;

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
                            adminView.populateProgram(collegeId, adminDao);

                            adminView.setListOfPrograms(new ActionListener() {
                                @Override
                                public void actionPerformed(ActionEvent e) {
                                    String getProgram = adminView.getSelectedProgram();
                                    ArrayList <String> courses = adminDao.getCourses(collegeId, getProgram);
                                    adminView.setCourses(courses);
                                    adminView.enableComboBox();

                                    searchProfs(collegeId, adminView, adminDao);
                                }
                            });
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

        this.adminView.setRegisterStudent(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                AdminDao adminDao = new AdminDao();
                executeStudentRegister(adminView, adminDao);
            }
        });

        this.adminView.setRegisterInstructor(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                AdminDao adminDao = new AdminDao();
                executeInstructorRegister(adminView, adminDao);
            }
        });

        this.adminView.setSearchProfileButton(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                adminView.viewPersonalInformationView();
                adminView.setSearchButton(new ActionListener() {
                    @Override
                    public void actionPerformed(ActionEvent e) {
                        String idInput = adminView.getIDNumber();
                        try {
                            int idNumber = Integer.parseInt(idInput);
                            AdminDao adminDao = new AdminDao();
                            HashMap<String, String> profileInfo = adminDao.searchProfileById(idNumber);
                            displaySearchResult(adminView, profileInfo);
                        } catch (NumberFormatException ex) {
                            JOptionPane.showMessageDialog(adminView, "Invalid ID number format. Please enter a valid integer ID.", "Input Error", JOptionPane.ERROR_MESSAGE);
                        }
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
        adminView.resetSearchInstructor();

        adminView.setSearchInstructors(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
               try{
                   String selectedCourse = adminView.getSelectedCourse().trim();
                   String classHours = adminView.getSelectedClassHours().trim();
                   String scheduledDays = adminView.getSelectedDays().trim();
                   String capacity = adminView.getMaxCapacity().trim();

                   if (capacity != null && !capacity.isEmpty() && selectedCourse != null && !selectedCourse.isEmpty() &&
                           classHours != null && !classHours.isEmpty() && scheduledDays != null && !scheduledDays.isEmpty()) {
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
                       JOptionPane.showMessageDialog(adminView, "Required inputs incomplete");
                   }
               }catch(NullPointerException ex){
                   JOptionPane.showMessageDialog(adminView, "A required field is missing. Please ensure all fields are selected.", "Input Error", JOptionPane.WARNING_MESSAGE);
               }catch(Exception ex){
                   JOptionPane.showMessageDialog(adminView, "An unexpected error occurred: " + ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
               }
            }
        });
    }

    private void openClass(AdminView adminView, AdminDao adminDao) {
        adminView.resetFields();

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

                    if (maxCapacityInput == null || maxCapacityInput.isEmpty()) {
                        JOptionPane.showMessageDialog(adminView, "Please enter the max capacity.", "Input Error", JOptionPane.WARNING_MESSAGE);
                        return;
                    }

                    if (instructorIdInput == null || instructorIdInput.isEmpty()) {
                        JOptionPane.showMessageDialog(adminView, "Please enter the instructor ID.", "Input Error", JOptionPane.WARNING_MESSAGE);
                        return;
                    }

                    int maxCapacity = Integer.parseInt(maxCapacityInput);
                    int instructorID = Integer.parseInt(instructorIdInput);

                    if (!adminDao.doesInstructorExist(instructorID)) {
                        JOptionPane.showMessageDialog(adminView, "The instructor ID provided does not exist. Please enter a valid ID.", "Input Error", JOptionPane.WARNING_MESSAGE);
                        return;
                    }

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

    private void executeStudentRegister(AdminView adminView, AdminDao adminDao){
        adminView.registerStudentView();

        adminView.populateStudentCollege(adminDao);

        adminView.populateDateComboBoxes(adminDao);

        adminView.setListOfMonths(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String selectedMonth = adminView.getSelectedMonth();
                if (selectedMonth != null) {
                    adminView.updateDaysComboBox(adminDao, selectedMonth);
                }
            }
        });

       adminView.setStudentCollege(new ActionListener() {
           @Override
           public void actionPerformed(ActionEvent e) {
               String selectedCollege = adminView.getStudentCollege();
               if (selectedCollege != null && !selectedCollege.isEmpty()) {
                   int collegeId = adminDao.getCollegeIdByName(selectedCollege);
                   adminView.populateStudentProgram(collegeId, adminDao);
               }
           }
       });

       adminView.RegisterStudent(new ActionListener() {
           @Override
           public void actionPerformed(ActionEvent e) {
                StudentDao studentDao = new StudentDao();
                registerStudent(adminView, adminDao, studentDao);
           }
       });

       adminView.setClearFields(new ActionListener() {
           @Override
           public void actionPerformed(ActionEvent e) {
               adminView.resetStudentFields();
           }
       });

    }

    private void registerStudent(AdminView adminView, AdminDao adminDao, StudentDao studentDao){
        try{
            String firstName = adminView.getFirstName();
            String lastName = adminView.getLastName();
            String contactNumber = adminView.getContactNumber();
            String email = adminView.getEmail();
            String homeAddress = adminView.getHomeAddress();
            String college = adminView.getStudentCollege();
            String program = adminView.getStudentProgram();
            char gender = adminView.getGender();
            String birthday = adminView.getStudentBirthday();

            if (gender == '\0' || firstName.isEmpty() || lastName.isEmpty() || contactNumber.isEmpty() || email.isEmpty()
                    || homeAddress.isEmpty() || college == null || program == null || birthday.isEmpty()) {
                JOptionPane.showMessageDialog(adminView, "Please fill out all required fields.", "Input Error", JOptionPane.WARNING_MESSAGE);
                return;
            }

            int generatedIDnumber = Integer.parseInt(adminDao.generateUniqueStudentId());
            String generatedPassWord = adminDao.generatePassword();

            Student student = new Student(generatedIDnumber, firstName, lastName, email, gender, birthday, homeAddress, program, generatedPassWord, contactNumber);
            boolean isAdded = studentDao.addStudent(student);

            if (isAdded){
                JOptionPane.showMessageDialog(adminView, "Student successfully registered.\nStudent ID: " + generatedIDnumber + "\nPassword: " + generatedPassWord, "Success", JOptionPane.INFORMATION_MESSAGE);
                adminView.resetStudentFields();
            }else{
                JOptionPane.showMessageDialog(adminView, "Failed to register student. Please check the input or try again.", "Registration Error", JOptionPane.ERROR_MESSAGE);
            }

        }catch(Exception ex){
            System.out.println("Error adding student");
        }
    }

    private void executeInstructorRegister(AdminView adminView, AdminDao adminDao){
        adminView.registerInstructorView();

        adminView.populateInstructorCollege(adminDao);

        adminView.RegisterInstructor(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                InstructorDao instructorDao = new InstructorDao();
                registerInstructor(adminView, adminDao, instructorDao);
            }
        });

        adminView.setClearRegisterInstructor(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                adminView.resetInstructorFields();
            }
        });
    }

    private void registerInstructor(AdminView adminView, AdminDao adminDao, InstructorDao instructorDao) {
        try {
            String instructorFirstName = adminView.getInstructorFirstName().trim();
            String instructorLastName = adminView.getInstructorLastName().trim();
            String instructorEmail = adminView.getInstructorEmail().trim();
            String instructorContactNo = adminView.getInstructorContactNo().trim();
            String selectedCollege = adminView.getInstructorCollege().trim();

            if (selectedCollege == null || selectedCollege.isEmpty()) {
                JOptionPane.showMessageDialog(adminView, "Please select a college for the instructor.", "Input Error", JOptionPane.WARNING_MESSAGE);
                return;
            }

            int collegeId = adminDao.getCollegeIdByName(selectedCollege);
            int instructorId = adminDao.generateNewInstructorId();

            Instructor instructor = new Instructor(instructorId, instructorFirstName, instructorLastName, collegeId, instructorContactNo, instructorEmail);

            boolean isAdded = instructorDao.addInstructor(instructor);

            if (isAdded) {
                JOptionPane.showMessageDialog(adminView, "Instructor successfully registered.\nInstructor name: " + instructorFirstName + " " + instructorLastName + "\nID Number: " + instructorId, "Success", JOptionPane.INFORMATION_MESSAGE);
                adminView.resetInstructorFields();
            } else {
                JOptionPane.showMessageDialog(adminView, "Failed to register instructor. Please check the input or try again.", "Registration Error", JOptionPane.ERROR_MESSAGE);
            }

        } catch (Exception ex) {
            System.err.println("Error adding instructor: " + ex.getMessage());
        }
    }

    private void displaySearchResult(AdminView adminView, HashMap<String, String> profileInfo){
        if (profileInfo == null) {
            JOptionPane.showMessageDialog(adminView, "No student or instructor found with the given ID.", "Search Result", JOptionPane.INFORMATION_MESSAGE);
            return;
        }

        adminView.viewPersonalInformationView();

        String type = profileInfo.get("type");

        adminView.setIDNumber(profileInfo.get("id"));
        adminView.setFirstName(profileInfo.get("firstName"));
        adminView.setLastName(profileInfo.get("lastName"));
        adminView.setEmail(profileInfo.get("email"));

        if ("Student".equals(type)) {
            adminView.setType(type);
            adminView.setCollegeID(profileInfo.get("program"));
            adminView.setPhoneNumber(profileInfo.get("contactNumber"));
        } else if ("Instructor".equals(type)) {
            adminView.setType(type);
            adminView.setCollegeID(profileInfo.get("college"));
            adminView.setPhoneNumber(profileInfo.get("contactNumber"));
        }

        adminView.setSearchButton(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String idInput = adminView.getIDNumber();
                try {
                    int idNumber = Integer.parseInt(idInput);
                    AdminDao adminDao = new AdminDao();
                    HashMap<String, String> profileInfo = adminDao.searchProfileById(idNumber);
                    displaySearchResult(adminView, profileInfo);
                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(adminView, "Invalid ID number format. Please enter a valid integer ID.", "Input Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        adminView.resetPanel();
    }

}