public class Instructor{
    private int instructor_id;
    private String firstName;
    private String lastName;
    private int collegeId;
    private String contact_no;
    private String email;
    private String password;

    public Instructor(int instructor_id, String firstName, String lastName, int collegeId, String contact_no, String email, String password){
        this.instructor_id = instructor_id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.collegeId = collegeId;
        this.contact_no = contact_no;
        this.email = email;
        this.password = password;
    }

    public int getInstructorId(){ return instructor_id; }

    public void setInstructor_id(int instructor_id) { this.instructor_id = instructor_id; }

    public String getFirstName() { return firstName; }

    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }

    public void setLastName(String lastName) { this.lastName = lastName; }

    public int getCollegeId() { return collegeId; }

    public void setCollegeId(int collegeId) { this.collegeId = collegeId; }

    public String getContactNo() { return contact_no; }

    public void setContact_no(String contactNo) { this.contact_no = contactNo; }

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }

    public String getInstructorPassword(){
        return this.password;
    }
}