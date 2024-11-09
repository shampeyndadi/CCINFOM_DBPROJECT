public class Instructor {
    private int instId;
    private String instFirstName;
    private String instLastName;
    private String departmentName;
    private String contactNo;
    private String instEmail;
    private String officeHours;
    private String hireDate;
    private String employmentStatus;
    private double salary;

    public Instructor(int instId, String instFirstName, String instLastName, String departmentName,
                      String contactNo, String instEmail, String officeHours, String hireDate,
                      String employmentStatus, double salary) {
        this.instId = instId;
        this.instFirstName = instFirstName;
        this.instLastName = instLastName;
        this.departmentName = departmentName;
        this.contactNo = contactNo;
        this.instEmail = instEmail;
        this.officeHours = officeHours;
        this.hireDate = hireDate;
        this.employmentStatus = employmentStatus;
        this.salary = salary;
    }

    public int getInstId() {
        return instId;
    }

    public void setInstId(int instId) {
        this.instId = instId;
    }

    public String getInstFirstName() {
        return instFirstName;
    }

    public void setInstFirstName(String instFirstName) {
        this.instFirstName = instFirstName;
    }

    public String getInstLastName() {
        return instLastName;
    }
}