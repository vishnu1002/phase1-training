package holiday;

import java.util.ArrayList;
import java.util.List;

public class PackageDaoImpl implements PackageDao {
    private List<Package> packageList = new ArrayList<>();

    @Override
    public void addPackage(Package pkg) {
        packageList.add(pkg);
    }

    @Override
    public List<Package> getAllPackages() {
        return packageList;
    }

    @Override
    public Package findPackageById(String packageId) {
        for (Package pkg : packageList) {
            if (pkg.getPackageId().equals(packageId)) {
                return pkg;
            }
        }
        return null;
    }

    @Override
    public double calculatePackageCost(String packageId) {
        Package pkg = findPackageById(packageId);
        if (pkg != null) {
            return pkg.getPackageCost();
        }
        return 0.0;
    }
} 