package ru.example.thread.concurrent;

public class Count {
    private int value;

    public void increment() {
        value++;
    }

    public int get() {
        return value;
    }
}
