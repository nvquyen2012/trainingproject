package com.example.module1.service.impl.email;

import com.example.module1.service.EmailService;
import freemarker.template.Configuration;
import freemarker.template.TemplateException;
import lombok.AllArgsConstructor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

@Service
@AllArgsConstructor
public class EmailServiceImpl implements EmailService {
    private final Configuration configuration;
    private final JavaMailSender javaMailSender;

    @Override
    public void sendMail(String email, String link) throws MessagingException, IOException, TemplateException {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
        helper.setSubject("Confirm your email");
//        helper.setTo(email);
        helper.setTo("fateavernous@gmail.com");
        String emailContent = getConfirmEmailContent(email, link);
        helper.setText(emailContent, true);
        javaMailSender.send(mimeMessage);
    }

    @Override
    public void sendMail(String otp) throws MessagingException, IOException, TemplateException {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
        helper.setSubject("Here is your otp to reset password");
        helper.setTo("fateavernous@gmail.com");
        String emailContent = getOtpEmailContent(otp);
        helper.setText(emailContent, true);
        javaMailSender.send(mimeMessage);
    }

    private String getConfirmEmailContent(String email, String link) throws IOException, TemplateException {
        StringWriter stringWriter = new StringWriter();
        Map<String, Object> model = new HashMap<>();
        model.put("authUserEmail", email);
        model.put("authUserLink", link);
        configuration.getTemplate("email.ftlh").process(model, stringWriter);
        return stringWriter.getBuffer().toString();
    }

    private String getOtpEmailContent(String otp) throws IOException, TemplateException {
        StringWriter stringWriter = new StringWriter();
        Map<String, Object> model = new HashMap<>();
        model.put("authUserOtp", otp);
        configuration.getTemplate("otp.ftlh").process(model, stringWriter);
        return stringWriter.getBuffer().toString();
    }
}
