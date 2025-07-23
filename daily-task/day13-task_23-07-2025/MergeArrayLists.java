package day13_task;

import java.util.*;

public class MergeArrayLists {
  public static ArrayList<Integer> mergeAndFetch(ArrayList<Integer> list1, ArrayList<Integer> list2) {
    ArrayList<Integer> merged = new ArrayList<>(list1);
    merged.addAll(list2);
    Collections.sort(merged);
    ArrayList<Integer> result = new ArrayList<>();
    int[] indices = { 2, 6, 8 };
    for (int idx : indices) {
      if (idx < merged.size()) {
        result.add(merged.get(idx));
      }
    }
    return result;
  }

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    ArrayList<Integer> list1 = new ArrayList<>();
    ArrayList<Integer> list2 = new ArrayList<>();
    System.out.println("Enter 5 integers for list1:");
    for (int i = 0; i < 5; i++)
      list1.add(sc.nextInt());
    System.out.println("Enter 5 integers for list2:");
    for (int i = 0; i < 5; i++)
      list2.add(sc.nextInt());
    ArrayList<Integer> result = mergeAndFetch(list1, list2);
    System.out.println("Result: " + result);
  }
}