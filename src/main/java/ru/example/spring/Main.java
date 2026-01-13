package ru.example.spring;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main {

    public static void main(String[] args) {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext("ru.example.spring");

//        Task task = context.getBean(Task.class);
//        System.out.println(task);
        TaskManager taskManager = context.getBean(TaskManager.class);
        taskManager.printTask();
//
        TaskExecutor taskExecutor = context.getBean(TaskExecutor.class);
        taskExecutor.executeTask();
//
//        var properties = context.getBean(TaskProperties.class);
//        System.out.println(properties);



        context.close();
    }
}
