package com.example.module3.service;

import com.example.module3.repository.InvestorIndividualRepository;
import com.example.trainingbase.dto.InvestorStatusDto;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.entity.crm.InvestorInstitutional;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Optional;

public interface InvestorService {
    List<InvestorStatusDto> getListInvestorByRmId(int rmId, String status);

    InvestorStatusDto updateInvestorStatus(InvestorStatusDto investorStatusDto);

    InvestorStatusDto sendMail(Object investorStatusDto);

}
