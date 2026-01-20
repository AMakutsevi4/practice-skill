package ru.example.oop;

public class Main {
    public static void main(String[] args) {
        // Агрегация: колесо создано отдельно
        Wheel independentWheel = new Wheel();
        Car myCar = new Car(independentWheel);

        // Композиция: сердце создается автоматически внутри Human
        Human person = new Human();
    }
}
