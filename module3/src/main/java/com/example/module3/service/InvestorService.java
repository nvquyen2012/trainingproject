package com.example.module3.service;

import com.example.trainingbase.dto.InvestorIndividualDto;
import com.example.trainingbase.dto.InvestorInstitutionalDto;
import com.example.trainingbase.dto.InvestorStatusDto;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.entity.crm.InvestorInstitutional;

import java.util.List;
import java.util.Optional;

public interface InvestorService {
    List<InvestorStatusDto> getListInvestorByRmId(int rmId, String status);

    // get list investor by rmId
    // update investor by investor id and rmId
    InvestorStatusDto updateInvestorStatus(int rmId, InvestorStatusDto investorStatusDto);

//  This is Investor Individual services
    List<InvestorIndividualDto> getAllInvestorIndividual();

    void createInvestorIndividual(InvestorIndividual investor);

    InvestorIndividualDto getInvestorIndiviById(String id);

//    void sendMail(InvestorIndividual investor);

    InvestorIndividualDto getInvestorIndiviByIdAndRmId(String id, Integer rmId);

//  This is Investor Institutional services

    List<InvestorInstitutionalDto> getAllInvestorInstitutional();

    void createInvestorInstitutional(InvestorInstitutional investor);

    InvestorInstitutionalDto getInvestorInstituById(String id);


//    void sendMail(InvestorInstitutional investor);

}
