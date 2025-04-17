package ru.example.thread.deadlock;

import java.util.concurrent.CountDownLatch;

import static java.lang.System.out;

/*
 * В данном примере мы используем блокировку потоков с обратным отсчётом.
 * */
public class FooCountDown {

    CountDownLatch firstLatch = new CountDownLatch(1);
    CountDownLatch secondLatch = new CountDownLatch(1);

    public void first() {
        out.print("first ");
        firstLatch.countDown();
    }

    public void second() {
        try {
            firstLatch.await();
            out.print("second ");
            secondLatch.countDown();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    public void third(){
        try {
            secondLatch.await();
            out.print("third ");
            secondLatch.countDown();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    public static void main(String[] args) {
        FooCountDown foo = new FooCountDown();

        Thread t1 = new Thread(foo::first);
        Thread t2 = new Thread(foo::second);
        Thread t3 = new Thread(foo::third);

        t3.start();
        t1.start();
        t2.start();

    }
}