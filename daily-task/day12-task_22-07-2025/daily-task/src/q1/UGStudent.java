package q1;

public class UGStudent extends Student {
    private String degree, stream;

    public UGStudent() {}
    public UGStudent(String name, String id, int age, int grade, String address, String degree, String stream) {
        super(name, id, age, grade, address);
        this.degree = degree; this.stream = stream;
    }

    public String getDegree() { 
        return degree; 
    }
    public void setDegree(String degree) { 
        this.degree = degree; 
    }

    public String getStream() { 
        return stream; 
    }
    public void setStream(String stream) { 
        this.stream = stream; 
    }

    @Override
    public void display() {
        super.display();
        System.out.println("Degree: " + degree + ", Stream: " + stream);
    }
    
    @Override
    public boolean isPassed() { return grade > 70; }
} 