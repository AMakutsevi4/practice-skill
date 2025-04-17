package ru.example.thread.deadlock;


import static java.lang.System.out;

/*
 * В данном примере мы используем ожидание поочередного выполнения потоков.
 * */
public class FooJoinTwo {
    public void first() {
        out.print("first ");

    }

    public void second() {
        out.print("second ");
    }

    public void third() {
        out.print("third ");
    }

    public static void main(String[] args) {
        FooJoinTwo foo = new FooJoinTwo();

        Thread t1 = new Thread(foo::first);

        Thread t2 = new Thread(() -> {
            try {
                t1.join();
                foo.second();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });

        Thread t3 = new Thread(() -> {
            try {
                t2.join();
                foo.third();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });

        t1.start();
        t2.start();
        t3.start();
    }
}