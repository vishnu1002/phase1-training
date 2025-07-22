package q2;

public class TwoWheeler extends Vehicle {
    private boolean kickStartAvailable;

    public TwoWheeler(String make, String vehicleNumber, String fuelType, int fuelCapacity, int cc, boolean kickStartAvailable) {
        super(make, vehicleNumber, fuelType, fuelCapacity, cc);
        this.kickStartAvailable = kickStartAvailable;
    }

    public boolean isKickStartAvailable() { return kickStartAvailable; }
    public void setKickStartAvailable(boolean kickStartAvailable) { this.kickStartAvailable = kickStartAvailable; }

    @Override
    public void displayDetailInfo() {
        System.out.println("Kick Start Available: " + (kickStartAvailable ? "Yes" : "No"));
    }
} 