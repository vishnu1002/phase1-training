package q1;

public class Student {
    protected String name, id, address;
    protected int age, grade;

    public Student() {}
    public Student(String name, String id, int age, int grade, String address) {
        this.name = name; this.id = id; this.age = age; this.grade = grade; this.address = address;
    }

    public String getName() { 
        return name; 
    }
    public void setName(String name) { 
        this.name = name; 
    }

    public String getId() { 
        return id; 
    }
    public void setId(String id) { 
        this.id = id; 
    }

    public int getAge() { 
        return age; 
    }
    public void setAge(int age) { 
        this.age = age; 
    }
    
    public int getGrade() { 
        return grade; 
    }
    public void setGrade(int grade) { 
        this.grade = grade; 
    }

    public String getAddress() { 
        return address; 
    }
    public void setAddress(String address) { 
        this.address = address; 
    }

    public void display() {
        System.out.println("Name: " + name + ", Id: " + id + ", Age: " + age + ", Grade: " + grade + ", Address: " + address);
    }
    
    public boolean isPassed() { 
        return grade > 50; 
    }
} 