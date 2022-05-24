package com.example.module3.service.impl;

import com.example.module3.repository.InvestorIndividualRepository;
import com.example.module3.service.InvestorIndividualService;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.exceptions.BusinessException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InvestorIndividualServiceImpl implements InvestorIndividualService {
    @Autowired
    private InvestorIndividualRepository investorIndividualRepository;

    @Override
    public List<InvestorIndividual> getListInvestorIndividual() {
        return investorIndividualRepository.findAll();
    }

    @Override
    public void saveInvestorIndividual(InvestorIndividual req) {
        try {
            if (req.getInvestorId() != null) {
                if (!investorIndividualRepository.findById(req.getInvestorId()).isPresent()) {
                    throw new BusinessException("Not found", "500");
                }
            }
        } catch (BusinessException ex) {
            ex.printStackTrace();
        }

//        investorIndividualRepository.save(req);
    }
}
