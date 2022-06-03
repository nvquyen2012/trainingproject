package com.example.module3.service.impl;

import com.example.module3.config.EmailConfig;
import com.example.module3.service.LeadService;
import com.example.module3.util.Constants;
import com.example.module3.service.MailSenderService;
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
    public void sendMailToLead(Lead lead, String subj) {
        EmailConfig message = new EmailConfig();
        message.setTo(lead.getEmail());
        message.setSubject(subj);
        emailSender.sendEmail(message, lead, Constants.FILE_LEAD);
    }
}
