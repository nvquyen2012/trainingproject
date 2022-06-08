package com.example.module1.service;

import com.example.module1.dto.RegistrationDTO;
import freemarker.template.TemplateException;

import javax.mail.MessagingException;
import java.io.IOException;
import java.util.function.Predicate;

public interface EmailService {
    void sendEmail(String link, String email) throws MessagingException, IOException, TemplateException;
}
