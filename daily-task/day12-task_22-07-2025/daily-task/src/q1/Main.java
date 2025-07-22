package q1;

public class Main {
    public static void main(String[] args) {
        Student s = new Student("Alice", "S01", 20, 55, "City A");
        UGStudent ug = new UGStudent("Bob", "U01", 19, 75, "City B", "BSc", "CS");
        PGStudent pg = new PGStudent("Carol", "P01", 24, 80, "City C", "AI", 3);

        s.display();
        System.out.println("Passed: " + s.isPassed());

        ug.display();
        System.out.println("Passed: " + ug.isPassed());
        
        pg.display();
        System.out.println("Passed: " + pg.isPassed());
    }
} 