package ru.example.thread.concurrent;

public class ThreadState {
    public static void main(String[] args) {
        Thread first = new Thread(
                () -> {
                    System.out.printf("First thread: %s\n", Thread.currentThread().getName());
                }
        );
        Thread second = new Thread(
                () -> {
                    System.out.printf("Second thread: %s\n", Thread.currentThread().getName());
                }
        );
        first.start();
        second.start();

        first.setName("First thread");
        second.setName("Second thread");

        while (first.getState() != Thread.State.TERMINATED
                || second.getState() != Thread.State.TERMINATED) {
            System.out.println(first.getName() + ": " + first.getState() +
                    System.lineSeparator() +
                    second.getName() + ": " + second.getState());
        }
        System.out.println(first.getName() + ": " + first.getState() +
                System.lineSeparator() +
                second.getName() + ": " + second.getState());
        System.out.println("The End");
    }
}