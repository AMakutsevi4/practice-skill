package ru.example.stream;

import java.util.List;
import java.util.stream.Stream;

public class CollectToList {

    public static List<Integer> collect(Stream<Integer> data) {
    return data.toList();
    }
}
