package ru.example.concurrency.synchronization;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class FooSafe {

    private final ReentrantLock lock = new ReentrantLock();

    private final Condition firstMethodCalled = lock.newCondition();
    private final Condition secondMethodCalled = lock.newCondition();

    public void first() {
        lock.lock();
        try {
            System.out.println("First");
            firstMethodCalled.signal();
        } finally {
            lock.unlock();
        }
    }

    public void second() {
        lock.lock();
        try {
            firstMethodCalled.await();
            System.out.println("Second");
            secondMethodCalled.signal();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            lock.unlock();
        }
    }

    public void three() {
        lock.lock();
        try {
            secondMethodCalled.await();
            System.out.println("Three");
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            lock.unlock();
        }
    }
}