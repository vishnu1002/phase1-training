package q2;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("1. Two Wheeler\n2. Four Wheeler");
        System.out.print("Enter Vehicle Type: ");
        int type = sc.nextInt();
        sc.nextLine();
        if (type == 1) {
            TwoWheeler tw = new TwoWheeler("Honda", "TN01AB1234", "Petrol", 10, 110, true);
            tw.displayMake();
            tw.displayBasicInfo();
            tw.displayDetailInfo();
        } else if (type == 2) {
            FourWheeler fw = new FourWheeler("Toyota", "TN02CD5678", "Diesel", 40, 2000, "JBL", 4);
            fw.displayMake();
            fw.displayBasicInfo();
            fw.displayDetailInfo();
        } else {
            System.out.println("Invalid type");
        }
        sc.close();
    }
} 