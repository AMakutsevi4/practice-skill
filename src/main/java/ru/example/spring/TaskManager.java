package ru.example.spring;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ru.example.spring.aop.Loggable;

@Component
public class TaskManager {

    //    @Autowired
    private final Task task;

//    public TaskManager() {
//    }


    public TaskManager(Task task) {
        this.task = task;
    }

    @Loggable
    public Long printTask() {
        System.out.println("Current task: " + task.toString());
     //   throw new RuntimeException("Exception runtime in Task manager");
       return task.getDuration();
    }

    @PostConstruct
    public void postConstruct() {
        System.out.println("Task post construct");
    }

    @PreDestroy
    public void preDestroy() {
        System.out.println("Task pre destroy");
    }

    @Override
    public String toString() {
        return "TaskManager{"
                + "task=" + task
                + '}';
    }

//    @Autowired
//    public void setTask(Task task) {
//        this.task = task;
//    }
}
