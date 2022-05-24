package com.example.module3.service;

import com.example.trainingbase.entity.crm.InvestorIndividual;

import java.util.List;

public interface InvestorIndividualService {
    List<InvestorIndividual> getListInvestorIndividual();

    void saveInvestorIndividual(InvestorIndividual req);
}
