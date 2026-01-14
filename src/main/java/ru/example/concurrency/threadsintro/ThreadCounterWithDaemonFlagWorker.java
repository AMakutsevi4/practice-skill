package ru.example.concurrency.threadsintro;

public class ThreadCounterWithDaemonFlagWorker extends Thread {

    private final String name;
    private final Integer range;

    public ThreadCounterWithDaemonFlagWorker(String name, Integer range, boolean flag) {
        this.name = name;
        this.range = range;
        super.setDaemon(flag);
    }

    @Override
    public void run() {
        int counter = 0;

        while (counter <= range) {
            System.out.println(name + ": " + counter++);
        }
    }
}
