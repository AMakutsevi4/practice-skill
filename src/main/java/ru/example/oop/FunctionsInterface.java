package ru.example.oop;

import java.util.concurrent.Callable;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.function.UnaryOperator;

public class FunctionsInterface {
    public static void main(String[] args) throws Exception {

        // 1. Predicate<T> — проверка условия (принимает T, возвращает boolean)
        Predicate<Integer> isPositive = x -> x > 0;
        System.out.println("Predicate (5 > 0): " + isPositive.test(5)); // true

        // 2. Consumer<T> — действие над объектом (принимает T, возвращает void)
        Consumer<String> printer = s -> System.out.println("Consumer: Hello, " + s);
        printer.accept("Spring"); // Выведет: Hello, Spring

        // 3. Supplier<T> — поставщик данных (ничего не принимает, возвращает T)
        Supplier<Double> randomValue = () -> Math.random();
        System.out.println("Supplier: " + randomValue.get());

        // 4. Function<T, R> — преобразование (принимает T, возвращает R)
        Function<String, Integer> stringLength = s -> s.length();
        System.out.println("Function (длина строки): " + stringLength.apply("Java")); // 4

        // 5. UnaryOperator<T> — частный случай Function (принимает T, возвращает T)
        UnaryOperator<Integer> square = x -> x * x;
        System.out.println("UnaryOperator (квадрат 5): " + square.apply(5)); // 25


        Thread thread1 = new Thread(() -> {
            System.out.println("ss");
        });
        thread1.setName("123");
        thread1.start();

        Thread thread2 = new Thread(() -> System.out.println("123123123"));

        Callable<String> callable = thread1::getName;

        System.out.println(callable.call());
    }
}
