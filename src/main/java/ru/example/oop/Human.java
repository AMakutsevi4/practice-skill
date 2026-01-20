package ru.example.oop;

public class Human {

    private final Heart heart = new Heart();

    public void live() {
        heart.beat();
    }
}