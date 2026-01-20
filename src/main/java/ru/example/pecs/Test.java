package ru.example.pecs;

import java.util.List;
import java.util.Objects;

public class Test {

    public static void producer(List<? extends Class1> list) {
        System.out.println(list.get(8));
        Class1 class1 = list.get(0);
        Object object = list.get(0);
        System.out.println(class1);
       // list.add(new Class0());
    }

    public static void consumer(List<? super Class1> list) {
        System.out.println("Возможности консьюмера");
        System.out.println(list.get(8));
       // Class1 class1 = list.get(0);
        list.add(new Class2());
        System.out.println(list.get(1));
        // list.add(new Class0());
    }
}
