package ru.example.thread.concurrent;

import static java.lang.System.out;

public class ConcurrentOutput {

    public static void main(String[] args) {
        Thread second = new Thread(
                () -> out.print(Thread.currentThread().getName())
        );
        second.start();
        out.println(Thread.currentThread().getName());

        Thread another = new Thread(
                new Runnable() {
                    @Override
                    public void run() {
                        out.println(Thread.currentThread().getName());
                    }
                }
        );
        another.start();
        out.println(Thread.currentThread().getName());
    }
}