package ru.example.concurrency.threadsintro;

public class ThreadWithSleepCounterDemo {
    public static void main(String[] args) {
        ThreadWithSleepCounterWorker twscw1 = new ThreadWithSleepCounterWorker("A", 15);
        ThreadWithSleepCounterWorker twscw2 = new ThreadWithSleepCounterWorker("B", 15);

        twscw1.start();
        twscw2.start();
    }
}
