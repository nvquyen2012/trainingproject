package com.example.module3.service;

import com.example.trainingbase.dto.InvestorIndividualDto;
import com.example.trainingbase.dto.InvestorInstitutionalDto;
import com.example.trainingbase.dto.InvestorStatusDto;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.entity.crm.InvestorInstitutional;

import java.util.List;

public interface InvestorService {
    List<InvestorStatusDto> getListInvestorByRmId(int rmId, String status);

    InvestorStatusDto updateInvestorStatus(int rmId, InvestorStatusDto investorStatusDto);

    //individual
    List<InvestorIndividual> getListIndividualInvestor();

    void createIndividualInvestor(InvestorIndividual req);

    InvestorIndividualDto getIndividualInvestorById(String id);

    InvestorIndividualDto getIndividualInvestorByIdAndRmId(String id, Integer rmId);

    //institutional
    List<InvestorInstitutional> getListInstitutionalInvestors();

    void createInstitutionalInvestor(InvestorInstitutional investor);

    InvestorInstitutionalDto findInstitutionalInvestorById(String id);

    void sendMailToInstitutionalInvestor(InvestorInstitutional investor, String subj);

    void sendMailToIndividualInvestor(InvestorIndividual investor, String subj);

    InvestorIndividualDto updateIndividualInvestor(String investorId, Integer rmId, InvestorIndividualDto req);
}
