package ru.example.spring.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;


@Component
@Aspect
public class LoggingAspect {

//    @Before("execution(* ru.example.spring.TaskManager.*(..))")
//    public void logBefore(JoinPoint joinPoint) {
//        System.out.println("Перед вызовом метода: " + joinPoint.getSignature().getName());
//    }
//
//    @AfterReturning(value = "execution(* ru.example.spring.TaskManager.*(..))", returning = "result")
//    public void logAfterReturning(JoinPoint joinPoint, Object result) {
//        System.out.println("После возвращения результата: " + joinPoint.getSignature().getName() + " " + "результат = " + result);
//    }
//
//    @AfterThrowing(value = "execution(* ru.example.spring.TaskManager.*(..))")
//    public void logAfterThrowing(JoinPoint joinPoint, Exception exc) {
//        System.out.println("После выполнения : " + exc.getMessage());
//    }
//
//    @After(value = "execution(* ru.example.spring.TaskManager.*(..))")
//    public void logAfter(JoinPoint joinPoint) {
//        System.out.println("После выполнения метода: " + joinPoint.getSignature().getName());
//    }

//    @Around(value = "execution(* ru.example.spring.TaskManager.*(..))")
//    public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable {
//        System.out.println("До метода");
//        Object result = joinPoint.proceed();
//        System.out.println("После метода");
//        return result;
//    }

    @Before("@annotation(loggable)")
    public void log(JoinPoint joinPoint, Loggable loggable) {
        System.out.printf("LOG %s : before method = %s\n", loggable.value(), joinPoint.getSignature().getName());
    }
}
