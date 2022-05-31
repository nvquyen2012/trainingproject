package com.example.module3.util;

import com.example.module3.config.EmailConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailSenderService {
    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private Environment env;


    public void sendEmail(EmailConfig mail) {
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom(env.getProperty("spring.mail.from"));
        msg.setTo(mail.getTo());
        msg.setSubject(env.getProperty("spring.mail.subject"));
        msg.setText(mail.getContent());
        javaMailSender.send(msg);
    }
}
