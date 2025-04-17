package ru.example.thread.deadlock;


import static java.lang.System.out;

/*
 * В данном примере мы используем поочередное ожидание выполнения вех потоков.
 * */
public class FooJoin {
    public void first() {
        out.print("first ");

    }

    public void second() {
        out.print("second ");
    }

    public void third() {
        out.print("third ");
    }

    public static void main(String[] args) throws InterruptedException {
        FooJoin foo = new FooJoin();

        Thread t1 = new Thread(foo::first);
        Thread t2 = new Thread(foo::second);
        Thread t3 = new Thread(foo::third);

      t1.start();
      t1.join();
      t2.start();
      t2.join();
      t3.start();

    }
}