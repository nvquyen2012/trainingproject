package com.example.module1.service;

import com.example.trainingbase.entity.auth.ConfirmationToken;
import freemarker.template.TemplateException;

import javax.mail.MessagingException;
import java.io.IOException;

public interface EmailService {
    void sendMail(String mail, String link) throws MessagingException, IOException, TemplateException;
}
