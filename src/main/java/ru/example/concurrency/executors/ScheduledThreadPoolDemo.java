package ru.example.concurrency.executors;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class ScheduledThreadPoolDemo {
    public static void main(String[] args) {
        int cores = Runtime.getRuntime().availableProcessors();
        long start = System.currentTimeMillis();

        try (ScheduledExecutorService executorService = Executors.newScheduledThreadPool(cores - 1)) {

            GenerateRandomIntegerWithTask task1 = new GenerateRandomIntegerWithTask(1);
            GenerateRandomIntegerWithTask task2 = new GenerateRandomIntegerWithTask(2);
            GenerateRandomIntegerWithTask task3 = new GenerateRandomIntegerWithTask(3);
            GenerateRandomIntegerWithTask task4 = new GenerateRandomIntegerWithTask(4);
            GenerateRandomIntegerWithTask task5 = new GenerateRandomIntegerWithTask(5);


            executorService.schedule(task2,10, TimeUnit.SECONDS);
            executorService.schedule(task1,3, TimeUnit.SECONDS);
            executorService.schedule(task3,2, TimeUnit.SECONDS);
            executorService.schedule(task4,1, TimeUnit.SECONDS);
            executorService.schedule(task5,0, TimeUnit.SECONDS);

        } finally {
            long end = System.currentTimeMillis();
            long duration = end - start;
            System.out.println("Processed in: " + duration + " ms");
        }
    }
}