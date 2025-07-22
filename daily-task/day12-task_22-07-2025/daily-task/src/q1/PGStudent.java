package q1;

public class PGStudent extends Student {
    private String specialization;
    private int noOfPapersPublished;

    public PGStudent() {}
    public PGStudent(String name, String id, int age, int grade, String address, String specialization, int noOfPapersPublished) {
        super(name, id, age, grade, address);
        this.specialization = specialization; this.noOfPapersPublished = noOfPapersPublished;
    }
    public String getSpecialization() { return specialization; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }
    public int getNoOfPapersPublished() { return noOfPapersPublished; }
    public void setNoOfPapersPublished(int n) { this.noOfPapersPublished = n; }
    @Override
    public void display() {
        super.display();
        System.out.println("Specialization: " + specialization + ", Papers Published: " + noOfPapersPublished);
    }
    @Override
    public boolean isPassed() { return grade > 70 && noOfPapersPublished >= 2; }
} 