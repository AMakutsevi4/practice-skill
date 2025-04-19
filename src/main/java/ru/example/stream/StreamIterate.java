package ru.example.stream;

import java.util.stream.Stream;

public class StreamIterate {
    public static void showArray(Integer[] data) {
        Stream.iterate(0, i -> i < 3, i -> i + 2)
                .forEach(i -> System.out.println(data[i]));
    }
}
