package ru.example.thread.deadlock;

import net.jcip.annotations.GuardedBy;
import net.jcip.annotations.ThreadSafe;

import java.util.Comparator;

/*
 * В этом примере, мы реализуем deadlock, а затем устраним возникновение deadlock.
 * Чтобы избежать взаимной блокировки, необходимо блокировать мониторы всегда в одном порядке.
 */
public class DeadLock {
    public static void main(String[] args) {
        Account monitor1 = new Account(1, 100);
        Account monitor2 = new Account(2, 100);

        Thread thread1 = new Thread(() -> {
            sendMoney(monitor1, monitor2);
        }, "Thread 1");

        Thread thread2 = new Thread(() -> {
            sendMoney(monitor2, monitor1);
        }, "Thread 2");

        thread1.start();
        thread2.start();
    }

    public static void sendMoney(Account from, Account to) {
        /*Сначала блокируем аккаунт с меньшим id, а затем с большим.*/
        Account monitor1 = from.id < to.id ? from : to;
        Account monitor2 = to.id < from.id ? to : from;

        synchronized (monitor1) {
            System.out.println(Thread.currentThread().getName() + " monitor 1 synchronized");
            synchronized (monitor2) {
                System.out.println(Thread.currentThread().getName() + " monitor 2 synchronized");
            }
        }
        System.out.println(Thread.currentThread().getName() + " finished");
    }

    @ThreadSafe
    static class Account {
        @GuardedBy("this")
        int id;
        int balance;

        public Account(int id, int balance) {
            this.id = id;
            this.balance = balance;
        }
    }
}

/* ---Пример взаимной блокировки---

    Object monitor1 = new Object();
        Object monitor2 = new Object();

        Thread thread1 = new Thread(() -> {
            synchronized (monitor1) {
                System.out.println("Thread 1 monitor 1 synchronized");
                synchronized (monitor2) {
                    System.out.println("Thread 1 monitor2 synchronized");
                }
            }
            System.out.println("Thread 1 finished");
        }, "Thread 1");

        Thread thread2 = new Thread(() -> {
            synchronized (monitor2) {
                System.out.println("Thread 2 monitor 2 synchronized");
                synchronized (monitor1) {
                    System.out.println("Thread 2 monitor 1 synchronized");
                }
            }
            System.out.println("Thread 2 finished");
        }, "Thread 2");

        thread1.start();
        thread2.start();
 */