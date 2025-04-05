package ru.example.thread.concurrent;

public class ConsoleProgress implements Runnable {
    @Override
    public void run() {
        try {
            int index = 0;
            var process = new char[] {'-', '\'', '|', '/'};
            while (!Thread.currentThread().isInterrupted()) {
                System.out.print("\r load: " + process[index++]);
                if (index == process.length) {
                    index = 0;
                }
                Thread.sleep(500);
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    public static void main(String[] args) {
        ConsoleProgress progress = new ConsoleProgress();
        progress.run();
    }
}
