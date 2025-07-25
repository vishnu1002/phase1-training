package holiday;

import java.util.List;

public class PackageServiceImpl implements PackageService {
    private PackageDao packageDao = new PackageDaoImpl();

    @Override
    public void addPackage(Package pkg) throws InvalidPackageIdException {
        if (pkg.getPackageId() == null || pkg.getPackageId().length() != 7) {
            throw new InvalidPackageIdException("Invalid Package Id. The ID should be 7 characters long.");
        }
        packageDao.addPackage(pkg);
    }

    @Override
    public List<Package> getAllPackages() {
        return packageDao.getAllPackages();
    }

    @Override
    public Package findPackageById(String packageId) {
        return packageDao.findPackageById(packageId);
    }

    @Override
    public double calculatePackageCost(String packageId) throws InvalidPackageIdException {
        if (packageId == null || packageId.length() != 7) {
            throw new InvalidPackageIdException("Invalid Package Id");
        }
        Package pkg = packageDao.findPackageById(packageId);
        if (pkg == null) {
            return 0.0;
        }
        double basicFare = pkg.getPackageCost(); // Assuming packageCost is used as basic fare input
        int days = pkg.getNoOfDays();
        double baseCost = basicFare * days;
        double discount = 0.0;

        if (days > 5 && days <= 8) {
            discount = baseCost * 0.03;
        } else if (days > 8 && days <= 10) {
            discount = baseCost * 0.05;
        } else if (days > 10) {
            discount = baseCost * 0.07;
        }
        
        double discountedCost = baseCost - discount;
        double gst = discountedCost * 0.12;
        double totalCost = discountedCost + gst;
        
        pkg.setPackageCost(totalCost); 
        return totalCost;
    }
} 