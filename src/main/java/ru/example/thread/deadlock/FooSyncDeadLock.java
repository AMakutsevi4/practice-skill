package ru.example.thread.deadlock;

import static java.lang.System.out;

/*
 * В данном примере мы реализовали deadlock, ведь мы не пробуждаем потоки, которые ждут выполнения определённых задач.
 * Если бы мы ждали выполнения без цикла while, то программа могла завершиться.
 * */
public class FooSyncDeadLock {

    private boolean firstFinish = false;
    private boolean secondFinish = false;

    public synchronized void first() {
        out.print("first ");
        firstFinish = true;
        //   notifyAll();
    }

    public synchronized void second() {
        while (!firstFinish) {
            try {
                out.println("Ждём, пока нас разбудит Thread First......");
                wait();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
        out.print("second ");
        secondFinish = true;
        //   notifyAll();
    }

    public synchronized void third() {
        while (!secondFinish) {
            try {
                out.println("Ждём, пока нас разбудит Thread Second......");
                wait();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
        out.print("third ");
    }

    public static void main(String[] args) {
        FooSyncDeadLock foo = new FooSyncDeadLock();

        Thread t1 = new Thread(foo::first);
        Thread t2 = new Thread(foo::second);
        Thread t3 = new Thread(foo::third);

        t3.start();
        t1.start();
        t2.start();
    }
}