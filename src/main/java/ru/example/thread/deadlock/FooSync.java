package ru.example.thread.deadlock;

import static java.lang.System.out;

/*
 * В данном примере мы используем синхронизатор, в котором каждый последующий поток ожидает пробуждения от первого после выполнения.
 * */
public class FooSync {

    private boolean firstFinish = false;
    private boolean secondFinish = false;

    public synchronized void first() {
        out.print("first ");
        firstFinish = true;
        notifyAll();
    }

    public synchronized void second() {
        while (!firstFinish) {
            try {
                wait();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
        out.print("second ");
        secondFinish = true;
        notifyAll();
    }

    public synchronized void third() {
        while (!secondFinish) {
            try {
                wait();
             } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
        out.print("third ");
    }

    public static void main(String[] args) {
        FooSync foo = new FooSync();

        Thread t1 = new Thread(foo::first);
        Thread t2 = new Thread(foo::second);
        Thread t3 = new Thread(foo::third);

        t3.start();
        t1.start();
        t2.start();
    }
}