package com.example.module1.security;

import java.util.function.Predicate;

public class EmailValidator implements Predicate<String> {

    @Override
    public boolean test(String s) {
        //TODO: Regex to validate email
        return true;
    }
}
