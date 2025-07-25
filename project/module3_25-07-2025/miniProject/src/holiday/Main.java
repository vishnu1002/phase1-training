package holiday;

import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        PackageService service = new PackageServiceImpl();

        while (true) {
            System.out.println("\n\n###################################");
            System.out.println("Holiday Package Management System\n");
            System.out.println("1. Add Package");
            System.out.println("2. Display All Packages");
            System.out.println("3. Search Package by ID");
            System.out.println("4. Calculate Package Cost by ID");
            System.out.println("5. Exit");
            System.out.print(">> ");
            int choice = scanner.nextInt();
            
            scanner.nextLine();
            
            switch (choice) {
                case 1:
                    System.out.print("\nEnter Package ID       : "); String id = scanner.nextLine();
                    System.out.print("Enter Source Place     : "); String source = scanner.nextLine();
                    System.out.print("Enter Destination Place: "); String dest = scanner.nextLine();
                    System.out.print("Enter Number of Days   : "); int days = scanner.nextInt();
                    System.out.print("Enter Package Cost     : "); double cost = scanner.nextDouble();
                    
                    scanner.nextLine();
                    Package pkg = new Package(id, source, dest, days, cost);
                    try {
                        service.addPackage(pkg);
                        System.out.println("\nPackage added successfully.");
                    } catch (InvalidPackageIdException e) {
                        System.out.println("\n" + e.getMessage());
                    }
                    break;

                case 2:
                    List<Package> packages = service.getAllPackages();
                    for (Package p : packages) {
                        System.out.println("\nID: " + p.getPackageId() + ", Source: " + p.getSourcePlace() + ", Destination: " + p.getDestinationPlace() + ", Days: " + p.getNoOfDays() + ", Cost: " + p.getPackageCost());
                    }
                    break;

                case 3:
                    System.out.print("\nEnter Package ID to search: ");
                    String searchId = scanner.nextLine();
                    Package found = service.findPackageById(searchId);
                    if (found != null) {
                        System.out.println("\nID: " + found.getPackageId() + ", Source: " + found.getSourcePlace() + ", Destination: " + found.getDestinationPlace() + ", Days: " + found.getNoOfDays() + ", Cost: " + found.getPackageCost());
                    } else {
                        System.out.println("\nPackage not found. Please enter a valid package ID.");
                    }
                    break;

                case 4:
                    System.out.print("\nEnter Package ID to calculate cost: ");
                    String costId = scanner.nextLine();
                    try {
                        double totalCost = service.calculatePackageCost(costId);
                        System.out.println("\nTotal Package Cost: " + totalCost);
                    } catch (InvalidPackageIdException e) {
                        System.out.println("\n" + e.getMessage());
                    }
                    break;

                case 5:
                    System.out.println("\nExiting...");
                    scanner.close();
                    return;

                default:
                    System.out.println("\nInvalid choice. Try again.");
            }
        }
    }
} 