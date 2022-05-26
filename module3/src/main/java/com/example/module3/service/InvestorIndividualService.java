package com.example.module3.service;

import com.example.trainingbase.entity.crm.InvestorIndividual;

import java.util.List;
import java.util.Optional;

public interface InvestorIndividualService {
    List<InvestorIndividual> getListInvestorIndividual();

    void saveInvestorIndividual(InvestorIndividual req);

    Optional<InvestorIndividual> getInvestorByIdAndRmId(String id, Integer rmId);
}
