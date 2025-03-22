package ru.example.sql.stream;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;


public class OptionalFlatMap {

    public static Optional<Integer> flatMap(List<String> strings) {
     return strings.stream().filter(s -> s.endsWith(".java"))
             .findFirst()
             .flatMap(s -> Optional.of(s.length()));
    }

    /*
     * Есть сущность User (id, name, age).
     * Необходимо из списка пользователей сделать получить пользователей старше 18 лет и привести к
     * MAP<Integer, String>, где и Integer – id, String – имя.*/

    public static Map<Integer, String> map(List<Employee> strings) {

     return strings.stream().filter(employee -> employee.age() > 18)
                .collect(Collectors.toMap(Employee::age, Employee::name));
    }
}