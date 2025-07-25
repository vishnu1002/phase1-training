package holiday;

public class Package {
    private String packageId;
    private String sourcePlace;
    private String destinationPlace;
    private int noOfDays;
    private double packageCost;

    public Package() {}

    public Package(String packageId, String sourcePlace, String destinationPlace, int noOfDays, double packageCost) {
        this.packageId = packageId;
        this.sourcePlace = sourcePlace;
        this.destinationPlace = destinationPlace;
        this.noOfDays = noOfDays;
        this.packageCost = packageCost;
    }

    public String getPackageId() {
        return packageId;
    }

    public void setPackageId(String packageId) {
        this.packageId = packageId;
    }

    public String getSourcePlace() {
        return sourcePlace;
    }

    public void setSourcePlace(String sourcePlace) {
        this.sourcePlace = sourcePlace;
    }

    public String getDestinationPlace() {
        return destinationPlace;
    }

    public void setDestinationPlace(String destinationPlace) {
        this.destinationPlace = destinationPlace;
    }

    public int getNoOfDays() {
        return noOfDays;
    }

    public void setNoOfDays(int noOfDays) {
        this.noOfDays = noOfDays;
    }

    public double getPackageCost() {
        return packageCost;
    }

    public void setPackageCost(double packageCost) {
        this.packageCost = packageCost;
    }
} 