package com.example.module3.service.impl;

import com.example.module3.config.EmailConfig;
import com.example.module3.service.LeadService;
import com.example.module3.util.Constants;
import com.example.module3.util.MailSenderService;
import com.example.trainingbase.entity.crm.Lead;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class LeadServiceImpl implements LeadService {

    @Autowired
    private MailSenderService emailSender;
    @Override
    public void sendMail(Lead lead) {
        EmailConfig message = new EmailConfig();
        message.setTo(lead.getEmail());
        message.setSubject("Change status success");
        log.info("Start sending the information by email...");
        emailSender.sendEmail(message, lead, Constants.FILE_LEAD);
        log.info("mail sent successful!");
    }
}
