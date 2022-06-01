package com.example.module3.util;

import com.example.module3.config.EmailConfig;
import freemarker.template.Configuration;
import freemarker.template.Template;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import javax.mail.internet.MimeMessage;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class MailSenderService {
    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private Environment env;

    @Autowired
    private Configuration config;

    public void sendEmail(EmailConfig mail, Object object) {
        MimeMessage mailMessage = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(mailMessage,
                    MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                    StandardCharsets.UTF_8.name());

            Template template = config.getTemplate("email-template.ftl");
            Map<String, Object> model = new HashMap<>();
            model.put("Investor", object);
            String html = FreeMarkerTemplateUtils.processTemplateIntoString(template,model);

            helper.setFrom(env.getProperty("spring.mail.from"));
            helper.setTo(mail.getTo());
            helper.setSubject(mail.getSubject());
            helper.setText(html,true);
            javaMailSender.send(mailMessage);

        } catch (Exception e) {
            log.debug(e.getMessage());
        }
    }
}
