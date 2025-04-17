package ru.example.thread.deadlock;

import java.util.HashMap;
import java.util.Map;

import static java.lang.System.out;

/*
 * В данном примере, мы сохраняем порядок вызова методов через параллельный стрим
 * */
public class FooForEachOrdered {

    public void first() {
        out.print("first ");
    }

    public void second() {
        out.print("second ");
    }

    public void third() {
        out.print("third");
    }

    public static void main(String[] args) {
        FooForEachOrdered foo = new FooForEachOrdered();

        Map<String,Runnable> threadMap = new HashMap<>();
        threadMap.put("t1", new Thread(foo::first));
        threadMap.put("t2", new Thread(foo::second));
        threadMap.put("t3", new Thread(foo::third));

        threadMap.entrySet()
                .parallelStream()
                .forEachOrdered(thread -> thread.getValue().run());
    }
}