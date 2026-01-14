package ru.example.concurrency.threadsintro;

public class ThreadCounterJoinWorker extends Thread {

    private final String name;
    private final Integer range;


    public ThreadCounterJoinWorker(String name, Integer range) {
        this.name = name;
        this.range = range;
    }

    @Override
    public void run() {
        int counter = 0;
        while (counter <= range) {
            System.out.println(name + ": " + counter++);
        }
    }
}
