package ru.example.concurrency.synchronization;

import java.util.concurrent.Semaphore;

public class FooSemaphoreSafe {

    private final Semaphore betweenFirstAndSecond = new Semaphore(0);
    private final Semaphore betweenSecondAndThird = new Semaphore(0);

    public void first() {
        System.out.println("First");
        betweenFirstAndSecond.release();
    }

    public void second() {
        try {
            betweenFirstAndSecond.acquire();
            System.out.println("Second");
            betweenSecondAndThird.release();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    public void three() {
        try {
            betweenSecondAndThird.acquire();
            System.out.println("Three");
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }
    }
}
