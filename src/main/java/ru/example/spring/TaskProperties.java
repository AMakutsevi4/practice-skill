package ru.example.spring;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Set;

@Component
public class TaskProperties {

    @Value("${task.value}")
    private String taskName;
    @Value("${task.duration}")
    private Integer taskDuration;
    @Value("#{'${list.values}'.split(',')}")
    private List<String> listValues;
    @Value("#{'${set.values}'.split(',')}")
    private Set<String> setValues;

    @Override
    public String toString() {
        return "TaskProperties{"
                + "taskName='" + taskName + '\''
                + ", taskDuration=" + taskDuration
                + ", listValues=" + listValues
                + ", setValues=" + setValues
                + '}';
    }
}
