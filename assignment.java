package anti.movie_booking;

// Base class
class Shape {

    void calculateArea() {
        System.out.println("Calculating Area");
    }
}

// Rectangle class
class Rectangle extends Shape {

    double length;
    double breadth;

    Rectangle(double length, double breadth) {
        this.length = length;
        this.breadth = breadth;
    }

    void calculateArea() {
        double area = length * breadth;
        System.out.println("Area of Rectangle = " + area);
    }

    void calculatePerimeter() {
        double perimeter = 2 * (length + breadth);
        System.out.println("Perimeter of Rectangle = " + perimeter);
    }
}

// Circle class
class Circle extends Shape {

    double radius;

    Circle(double radius) {
        this.radius = radius;
    }

    void calculateArea() {
        double area = Math.PI * radius * radius;
        System.out.println("Area of Circle = " + area);
    }

    void calculateCircumference() {
        double circumference = 2 * Math.PI * radius;
        System.out.println("Circumference of Circle = " + circumference);
    }
}

// Main class
public class assignment {

    public static void main(String[] args) {

        Rectangle r = new Rectangle(10, 5);
        r.calculateArea();
        r.calculatePerimeter();

        System.out.println();

        Circle c = new Circle(7);
        c.calculateArea();
        c.calculateCircumference();
    }
}