// Abstract class Employee
abstract class Employee {
    String name;

    Employee(String name) {
        this.name = name;
    }

    // Abstract method - must be implemented by subclasses
    abstract double calculateSalary();

    void displaySalary() {
        System.out.println(name + "'s Salary: " + calculateSalary());
    }
}

// Subclass 1 - FullTimeEmployee
class FullTimeEmployee extends Employee {
    double monthlySalary = 30000;

    FullTimeEmployee(String name) {
        super(name);
    }

    @Override
    double calculateSalary() {
        return monthlySalary;
    }
}

// Subclass 2 - PartTimeEmployee
class PartTimeEmployee extends Employee {
    double hoursWorked;
    double hourlyRate;

    PartTimeEmployee(String name, double hoursWorked, double hourlyRate) {
        super(name);
        this.hoursWorked = hoursWorked;
        this.hourlyRate = hourlyRate;
    }

    @Override
    double calculateSalary() {
        return hoursWorked * hourlyRate;
    }
}

// Main class
public class MainAbstraction {
    public static void main(String[] args) {

        // Create objects
        FullTimeEmployee emp1 = new FullTimeEmployee("Rahul");
        PartTimeEmployee emp2 = new PartTimeEmployee("Alina", 80, 200);

        // Display salaries
        emp1.displaySalary();
        emp2.displaySalary();
    }
}
