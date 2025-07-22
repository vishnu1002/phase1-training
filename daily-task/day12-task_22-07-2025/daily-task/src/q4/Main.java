package q4;

class Associate {
    private int associateId;
    private String associateName, workStatus;

    public Associate(int associateId, String associateName) {
        this.associateId = associateId;
        this.associateName = associateName;
        this.workStatus = "";
    }
    public int getAssociateId() { return associateId; }
    public void setAssociateId(int associateId) { this.associateId = associateId; }
    public String getAssociateName() { return associateName; }
    public void setAssociateName(String associateName) { this.associateName = associateName; }
    public String getWorkStatus() { return workStatus; }
    public void setWorkStatus(String workStatus) { this.workStatus = workStatus; }
    public void trackAssociateStatus(int days) {
        if (days >= 0 && days <= 20) workStatus = "Core skills";
        else if (days <= 40) workStatus = "Advanced modules";
        else if (days <= 60) workStatus = "Project phase";
        else workStatus = "Deployed in project";
    }
} 

public class Main {
    public static void main(String[] args) {
        Associate a = new Associate(101, "John Doe");
        int[] testDays = {10, 30, 50, 70};
        for (int days : testDays) {
            a.trackAssociateStatus(days);
            System.out.println("Days: " + days + ", Status: " + a.getWorkStatus());
        }
    }
} 