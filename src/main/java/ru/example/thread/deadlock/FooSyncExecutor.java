package ru.example.thread.deadlock;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import static java.lang.System.out;

/*
 * В данном примере мы используем синхронизатор, в котором каждый последующий поток ожидает пробуждения от первого после выполнения.
 * Для создания и запуска потоков используем ExecutorService.
 * */
public class FooSyncExecutor {

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
        FooSyncExecutor foo = new FooSyncExecutor();

        ExecutorService executor = Executors.newFixedThreadPool(2);
        executor.submit(foo::first);
        executor.submit(foo::second);
        executor.submit(foo::third);

        executor.shutdown();
    }
}