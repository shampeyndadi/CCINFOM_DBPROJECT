public class Student{
    private int studentId;
    private String firstName;
    private String lastName;
    private String email;
    private String birthday;
    private String programId;
    public String address;
    private char gender;

    public Student(int studentId, String firstName, String lastName, String email, char gender, String birthday, String address, String programId){
        this.studentId = studentId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.birthday = birthday;
        this.programId = programId;
        this.address = address;
        this.gender = gender;
    }

    public int getStudentId() { return studentId; }

    public void setStudentId(int studentId) { this.studentId = studentId; }

    public String getFirstName() { return firstName; }

    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }

    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }

    public String getBirthday(){ return birthday; }

    public void setBirthday(String birthday) { this.birthday = birthday;}

    public char getGender(){return gender; }

    public void setGender(char gender){ this.gender = gender; }

    public String getAddress(){return address; }

    public void setAddress(String address){this.address = address; }

    public String getProgramId() { return programId; }

    public void setProgramId(String programId) { this.programId = programId; }



}