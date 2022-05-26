package com.example.module3.service.impl;

import com.example.module3.repository.InvestorIndividualRepository;
import com.example.module3.repository.InvestorInstitutionalRepository;
import com.example.module3.service.InvestorService;
import com.example.trainingbase.dto.InvestorStatusDto;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.entity.crm.InvestorInstitutional;
import com.example.trainingbase.mapper.InvestorStatusMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
@Slf4j
public class InvestorServiceImpl implements InvestorService {
    @Autowired
    private InvestorIndividualRepository investorIndividualRepository;
    @Autowired
    private InvestorInstitutionalRepository investorInstitutionalRepository;

    @Autowired
    private InvestorStatusMapper investorStatusMapper;

    @Override
    public List<InvestorStatusDto> getListInvestorByRmId(int rmId, String status) {
        List<InvestorStatusDto> objectList = new ArrayList<>();
        List<InvestorIndividual> individualList = new ArrayList<>();
        List<InvestorInstitutional> institutionalList = new ArrayList<>();

        if (status.equals(null) || "".equals(status)) {
            individualList = investorIndividualRepository.findAll();
            institutionalList = investorInstitutionalRepository.findAll();
        } else {
            individualList = investorIndividualRepository.findInvestorIndividualsByRmIdAndStatus(rmId, status);
            institutionalList = investorInstitutionalRepository.findInvestorInstitutionalByRmIdAndStatus(rmId, status);
        }
        for (int i = 0; i < individualList.size(); i++) {
            objectList.add(investorStatusMapper.toIndividualDto(individualList.get(i)));
        }
        for (int i = 0; i < institutionalList.size(); i++) {
            objectList.add(investorStatusMapper.toInstitutionalDto(institutionalList.get(i)));
        }
        return objectList;
    }
}
