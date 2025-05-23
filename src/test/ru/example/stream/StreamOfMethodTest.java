package ru.example.stream;

import org.junit.jupiter.api.Test;

import java.util.stream.Collectors;

import static org.junit.Assert.assertEquals;

public class StreamOfMethodTest {
    @Test
    public void whenUserStreamMethod() {
        assertEquals("abc",
                StreamOfMethod.createStream().map(Object::toString).collect(Collectors.joining()));
    }
}