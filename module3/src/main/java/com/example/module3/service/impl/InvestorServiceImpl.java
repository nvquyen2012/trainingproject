package com.example.module3.service.impl;

import com.example.module3.repository.InvestorIndividualRepository;
import com.example.module3.repository.InvestorInstitutionalRepository;
import com.example.module3.service.InvestorService;
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

    @Override
    public List<Object> getListInvestorByRmId(int rmId, String status) {
        List<Object> objectList = new ArrayList<>();
//        if (status.equals(null) || "".equals(status)) {
            objectList.add(investorIndividualRepository.findInvestorIndividualsByRmIdAndStatus(rmId, status));
            objectList.add(investorInstitutionalRepository.findInvestorInstitutionalByRmIdAndStatus(rmId, status));
//        }
        return objectList;
    }
}
