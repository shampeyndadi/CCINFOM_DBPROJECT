import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

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


}
