package ru.example.concurrency.threadsintro;

public class ThreadCounterJoinDemo {
    public static void main(String[] args) {
        ThreadCounterWorker tcw1 = new ThreadCounterWorker("A", 15);
        ThreadCounterWorker tcw2 = new ThreadCounterWorker("B", 100);

        tcw1.start();
        tcw2.start();

        try {
            tcw1.join();
            tcw2.join();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
        System.out.println("Process is finished!!!");
    }
}
