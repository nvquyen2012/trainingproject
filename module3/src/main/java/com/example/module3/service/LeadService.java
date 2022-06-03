package com.example.module3.service;

import com.example.trainingbase.entity.crm.Lead;

public interface LeadService {
    void sendMailToLead(Lead lead, String subj);
}
