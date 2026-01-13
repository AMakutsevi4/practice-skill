package ru.example.spring;

import org.springframework.stereotype.Component;
import ru.example.spring.aop.Loggable;

@Component
public class TaskExecutor {

    private final Task task;

    public TaskExecutor(Task task) {
        this.task = task;
    }

    @Loggable("ERROR")
    public void executeTask() {
        System.out.printf("Execute task with name %s, total second %s%n", task.getName(), task.getDuration());
    }
}
