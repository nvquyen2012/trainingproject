package com.example.module3.service.impl;

import com.example.module3.repository.InvestorIndividualRepository;
import com.example.module3.repository.InvestorInstitutionalRepository;
import com.example.module3.repository.LeadRepository;
import com.example.module3.service.InvestorIndividualService;
import com.example.module3.service.InvestorInstitutionalService;
import com.example.module3.service.InvestorService;
import com.example.module3.service.LeadService;
import com.example.trainingbase.dto.InvestorStatusDto;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.entity.crm.InvestorInstitutional;
import com.example.trainingbase.entity.crm.Lead;
import com.example.trainingbase.mapper.InvestorStatusMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@Service
@Slf4j
public class InvestorServiceImpl implements InvestorService {
    @Autowired
    private InvestorIndividualRepository investorIndividualRepository;
    @Autowired
    private InvestorInstitutionalRepository investorInstitutionalRepository;

    @Autowired
    private LeadRepository leadRepository;

    @Autowired
    private InvestorStatusMapper investorStatusMapper;

    @Autowired
    private InvestorIndividualService individualService;

    @Autowired
    private InvestorInstitutionalService institutionalService;

    @Autowired
    private LeadService leadService;

    @Override
    public List<InvestorStatusDto> getListInvestorByRmId(int rmId, String status) {
        List<InvestorStatusDto> objectList = new ArrayList<>();
        List<InvestorIndividual> individualList = new ArrayList<>();
        List<InvestorInstitutional> institutionalList = new ArrayList<>();
        if ("".equals(status)) {
            individualList = investorIndividualRepository.findByRmId(rmId);
            institutionalList = investorInstitutionalRepository.findByRmId(rmId);
        } else {
            individualList = investorIndividualRepository.findByRmIdAndStatus(rmId, status);
            institutionalList = investorInstitutionalRepository.findByRmIdAndStatus(rmId, status);
        }
        for (int i = 0; i < individualList.size(); i++) {
            objectList.add(investorStatusMapper.toIndividualDto(individualList.get(i)));
        }
        for (int i = 0; i < institutionalList.size(); i++) {
            objectList.add(investorStatusMapper.toInstitutionalDto(institutionalList.get(i)));
        }
        return objectList;
    }

    @Override
    public InvestorStatusDto updateInvestorStatus(int rmId, InvestorStatusDto investorStatusDto) {
        Optional<InvestorIndividual> investorIndividual = investorIndividualRepository.findByRmIdAndInvestorId(rmId, investorStatusDto.getInvestorId());
        if (investorIndividual.isPresent()) {
            InvestorIndividual individual = investorIndividual.get();
            individual.setStatus(investorStatusDto.getStatus());
            individual.setUpdatedAt(LocalDateTime.now());

            individualService.sendMail(individual);

            this.investorIndividualRepository.save(individual);
            investorStatusDto =  investorStatusMapper.toIndividualDto(individual);
        }
        Optional<InvestorInstitutional> investorInstitutional = investorInstitutionalRepository.findByRmIdAndInvestorId(rmId, investorStatusDto.getInvestorId());
        if (investorInstitutional.isPresent()) {
            InvestorInstitutional institutional = investorInstitutional.get();
            institutional.setStatus(investorStatusDto.getStatus());
            institutional.setUpdatedAt(LocalDateTime.now());

            //send mail to client and investor
            institutionalService.sendMail(institutional);

            Optional<Lead> lead = leadRepository.findLeadByRmId(institutional.getRmId());
            if ( lead.isPresent()) {
                leadService.sendMail(lead.get());
            }

            this.investorInstitutionalRepository.save(institutional);
            investorStatusDto =  investorStatusMapper.toInstitutionalDto(institutional);
        }
        return investorStatusDto;
    }
}
