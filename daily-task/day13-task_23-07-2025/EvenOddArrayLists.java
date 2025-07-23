package day13_task;

import java.util.*;

public class EvenOddArrayLists {
  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    ArrayList<Integer> inputList = new ArrayList<>();
    ArrayList<Integer> evenNumbersList = new ArrayList<>();
    ArrayList<Integer> oddNumbersList = new ArrayList<>();
    System.out.print("Enter number of integers: ");
    int n = sc.nextInt();
    System.out.println("Enter the integers:");
    for (int i = 0; i < n; i++) {
      int num = sc.nextInt();
      inputList.add(num);
      if (num % 2 == 0) {
        evenNumbersList.add(num);
      } else {
        oddNumbersList.add(num);
      }
    }
    System.out.println("Input List: " + inputList);
    System.out.println("Even Numbers List: " + evenNumbersList);
    System.out.println("Odd Numbers List: " + oddNumbersList);
  }
}