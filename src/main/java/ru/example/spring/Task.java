package ru.example.spring;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.concurrent.ThreadLocalRandom;

@Component
//@Scope("prototype")
public class Task {

    private final String name;
    private final Long duration;

    public Task(@Value("${task.name}") String name,
                @Value("${task.duration}") Long duration) {
        this.name = name;
        this.duration = duration;
        System.out.println("Call task constructor");
    }

    public String getName() {
        return name;
    }

    public Long getDuration() {
        return duration;
    }

    @Override
    public String toString() {
        return "Task{"
                + "name='" + name + '\''
                + ", duration=" + duration
                + '}';
    }
}
