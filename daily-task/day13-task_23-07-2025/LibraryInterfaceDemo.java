package day13_task;

public class LibraryInterfaceDemo {
  public static void main(String[] args) {
    // Test KidUser
    KidUser kid1 = new KidUser(10, "Kids");
    kid1.registerAccount();
    kid1.requestBook();

    KidUser kid2 = new KidUser(15, "Fiction");
    kid2.registerAccount();
    kid2.requestBook();

    // Test AdultUser
    AdultUser adult1 = new AdultUser(23, "Fiction");
    adult1.registerAccount();
    adult1.requestBook();

    AdultUser adult2 = new AdultUser(11, "Kids");
    adult2.registerAccount();
    adult2.requestBook();
  }
}