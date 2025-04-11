package ru.example.thread.concurrent;

public class Node<T> {
/*
    1. Ниже приведен код не потокобезопасного класса, описывающего узел односвязного списка.
    2. Сделайте этот класс Immutable.

    private Node<T> next;
    private T value;

    public Node<T> getNext() {
        return next;
    }

    public void setNext(Node<T> next) {
        this.next = next;
    }

    public T getValue() {
        return value;
    }

    public void setValue(T value) {
        this.value = value;
    }
     */

    /*Immutable - это еще и запретить наследование. Конструктор и setter - убрать
    * Или сделать record */
    private final Node<T> next;
    private final T value;

    public Node(Node<T> next, T value) {
        this.next = next;
        this.value = value;
    }

    public Node<T> getNext() {
        return next;
    }

    public T getValue() {
        return value;
    }
}