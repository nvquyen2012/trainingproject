package com.example.module1.service.impl;

import com.example.module1.service.EmailService;
import freemarker.template.Configuration;
import freemarker.template.TemplateException;
import lombok.AllArgsConstructor;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;


@Service
@Async
@AllArgsConstructor
public class EmailServiceImpl implements EmailService {
    private final JavaMailSender javaMailSender;
    private final Configuration configuration;

    @Override
    @Async
    public void sendMail(String mail, String link) throws MessagingException, IOException, TemplateException {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper helper= new MimeMessageHelper(mimeMessage);
        helper.setSubject("Confirm your email");
        helper.setTo("brucetrinhcmc@gmail.com");
        String emailContent = getConfirmEmailContent(mail, link);
        helper.setText(emailContent, true);
        javaMailSender.send(mimeMessage);
    }

    @Override
    @Async
    public void sendMail(String otp) throws MessagingException, IOException, TemplateException {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
        helper.setSubject("Here is your otp to reset password");
        helper.setTo("brucetrinhcmc@gmail.com");
        String emailContent = getOtpEmailContent(otp);
        helper.setText(emailContent, true);
        javaMailSender.send(mimeMessage);
    }

    private String getOtpEmailContent(String otp) throws IOException, TemplateException {
        StringWriter stringWriter = new StringWriter();
        Map<String, Object> model = new HashMap<>();
        model.put("authUserOtp", otp);
        configuration.getTemplate("otp.ftlh").process(model, stringWriter);
        return stringWriter.getBuffer().toString();
    }

    private String getConfirmEmailContent(String email, String link) throws IOException, TemplateException {
        StringWriter stringWriter = new StringWriter();
        Map<String, Object> model = new HashMap<>();
        model.put("authUserEmail", email);
        model.put("authUserLink", link);
        configuration.getTemplate("email.ftlh").process(model, stringWriter);
        return stringWriter.getBuffer().toString();
    }
}
