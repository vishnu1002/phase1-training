package day13_task;

import java.util.*;

public class StudentGrades {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    HashMap<String, Float> studentMap = new HashMap<>();
    System.out.print("Enter number of students: ");
    int n = sc.nextInt();
    sc.nextLine();
    for (int i = 0; i < n; i++) {
      System.out.print("Enter name: ");
      String name = sc.nextLine();
      System.out.print("Enter mark: ");
      float mark = sc.nextFloat();
      sc.nextLine();
      studentMap.put(name, mark);
    }
    System.out.print("Enter student name to get grade: ");
    String query = sc.nextLine();
    if (studentMap.containsKey(query)) {
      float mark = studentMap.get(query);
      if (mark < 60) {
        System.out.println("FAIL");
      } else {
        System.out.println("PASS");
      }
    } else {
      System.out.println("Student not found.");
    }
  }
}