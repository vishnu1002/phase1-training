package q3;

class Shape {
    public double calculateArea() {
        return 0.0;
    }
} 

class Rectangle extends Shape {
    private double length, width;
    public Rectangle(double length, double width) {
        this.length = length;
        this.width = width;
    }
    @Override
    public double calculateArea() {
        return length * width;
    }
}

class Square extends Shape {
    private double side;
    public Square(double side) {
        this.side = side;
    }
    @Override
    public double calculateArea() {
        return side * side;
    }
} 

class Triangle extends Shape {
    private double base, height;
    public Triangle(double base, double height) {
        this.base = base;
        this.height = height;
    }
    @Override
    public double calculateArea() {
        return 0.5 * base * height;
    }
} 

public class Main {
    public static void main(String[] args) {
        Shape s1 = new Square(5);
        Shape s2 = new Triangle(4, 6);
        Shape s3 = new Rectangle(3, 7);

        System.out.println("Square Area: " + s1.calculateArea());
        System.out.println("Triangle Area: " + s2.calculateArea());
        System.out.println("Rectangle Area: " + s3.calculateArea());
    }
} 