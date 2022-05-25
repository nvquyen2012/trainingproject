package com.example.module3.service;

import com.example.module3.repository.InvestorIndividualRepository;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.entity.crm.InvestorInstitutional;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface InvestorService {
    List<Object> getListInvestorByRmId(int rmId, String status);
}
