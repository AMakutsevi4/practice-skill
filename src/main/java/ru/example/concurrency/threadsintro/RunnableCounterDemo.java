package ru.example.concurrency.threadsintro;

public class RunnableCounterDemo {

    public static void main(String[] args) {
        RunnableCounterWorker rcw1 = new RunnableCounterWorker("A", 15);
        RunnableCounterWorker rcw2 = new RunnableCounterWorker("B", 15);

        Thread t1 = new Thread(rcw1);
        Thread t2 = new Thread(rcw2);
        t1.start();
        t2.start();
    }
}
