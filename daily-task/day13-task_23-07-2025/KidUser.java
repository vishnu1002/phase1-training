package day13_task;

public class KidUser implements LibraryUser {
  private int age;
  private String bookType;

  public KidUser(int age, String bookType) {
    this.age = age;
    this.bookType = bookType;
  }

  @Override
  public void registerAccount() {
    if (age < 12) {
      System.out.println("You have successfully registered under a Kids Account");
    } else {
      System.out.println("Sorry, Age must be less than 12 to register as a kid");
    }
  }

  @Override
  public void requestBook() {
    if ("Kids".equalsIgnoreCase(bookType)) {
      System.out.println("Book Issued successfully, please return the book within 10 days");
    } else {
      System.out.println("You are allowed to take only kids books");
    }
  }
}