package holiday;

import java.util.List;

public interface PackageService {
    void addPackage(Package pkg) throws InvalidPackageIdException;
    List<Package> getAllPackages();
    Package findPackageById(String packageId);
    double calculatePackageCost(String packageId) throws InvalidPackageIdException;
} 