package com.example.module3.service.impl;

import com.example.module3.config.EmailConfig;
import com.example.module3.repository.InvestorIndividualRepository;
import com.example.module3.repository.InvestorInstitutionalRepository;
import com.example.module3.repository.LeadRepository;
import com.example.module3.service.InvestorService;
import com.example.module3.service.LeadService;
import com.example.module3.service.MailSenderService;
import com.example.module3.util.Constants;
import com.example.trainingbase.constants.ConstantDefault;
import com.example.trainingbase.constants.RegexConstant;
import com.example.trainingbase.dto.InvestorIndividualDto;
import com.example.trainingbase.dto.InvestorInstitutionalDto;
import com.example.trainingbase.dto.InvestorStatusDto;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.entity.crm.InvestorInstitutional;
import com.example.trainingbase.entity.crm.Lead;
import com.example.trainingbase.entity.crm.enums.EngageOption;
import com.example.trainingbase.exceptions.BusinessException;
import com.example.trainingbase.mapper.InvestorIndividualMapper;
import com.example.trainingbase.mapper.InvestorInstitutionalMapper;
import com.example.trainingbase.mapper.InvestorStatusMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.regex.Pattern;


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
    private LeadService leadService;

    @Autowired
    private MailSenderService emailSender;

    @Autowired
    private InvestorIndividualMapper individualMapper;

    @Autowired
    private InvestorInstitutionalRepository institutionalRepository;

    @Autowired
    private InvestorInstitutionalMapper institutionalMapper;

    @Override
    public List<InvestorStatusDto> getListInvestorByRmId(int rmId, String status) {
        List<InvestorStatusDto> objectList = new ArrayList<>();
        List<InvestorIndividual> individualList = new ArrayList<>();
        List<InvestorInstitutional> institutionalList = new ArrayList<>();
        if ("".equals(status)) {
            individualList = investorIndividualRepository.findInvestorIndividualsByRmId(rmId);
            institutionalList = investorInstitutionalRepository.findInvestorInstitutionalByRmId(rmId);
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

    @Override
    public InvestorStatusDto updateInvestorStatus(int rmId, InvestorStatusDto investorStatusDto) {
        Optional<InvestorIndividual> investorIndividual = investorIndividualRepository.findInvestorIndividualsByInvestorId(investorStatusDto.getInvestorId());
        if (investorIndividual.isPresent()) {
            InvestorIndividual individual = investorIndividual.get();
            individual.setStatus(investorStatusDto.getStatus());
            individual.setUpdatedAt(LocalDateTime.now());

            sendMailToIndividualInvestor(individual, Constants.SUBJ_UPD_STATUS);

            this.investorIndividualRepository.save(individual);
            investorStatusDto = investorStatusMapper.toIndividualDto(individual);
        }
        Optional<InvestorInstitutional> investorInstitutional = investorInstitutionalRepository.findByRmIdAndInvestorId(rmId, investorStatusDto.getInvestorId());
        if (investorInstitutional.isPresent()) {
            InvestorInstitutional institutional = investorInstitutional.get();
            institutional.setStatus(investorStatusDto.getStatus());
            institutional.setUpdatedAt(LocalDateTime.now());

            //send mail to client and investor
            sendMailToInstitutionalInvestor(institutional,  Constants.SUBJ_UPD_STATUS);

            Optional<Lead> lead = leadRepository.findLeadByRmId(institutional.getRmId());
            if (lead.isPresent()) {
                leadService.sendMailToLead(lead.get(), Constants.SUBJ_UPD_STATUS);
            }

            this.investorInstitutionalRepository.save(institutional);
            investorStatusDto = investorStatusMapper.toInstitutionalDto(institutional);
        }
        return investorStatusDto;
    }

    @Override
    public List<InvestorIndividual> getListIndividualInvestor() {
        return investorIndividualRepository.findAll();
    }

    @Override
    public void createIndividualInvestor(InvestorIndividual req) {
        try {
            isValidReq(req);
            sendMailToIndividualInvestor(req, Constants.SUBJ_REGISTER);
            investorIndividualRepository.save(req);
        } catch (BusinessException ex) {
            throw new BusinessException(ex.getCode(), ex.getMessage());
        }
    }

    private void isValidReq(InvestorIndividual req) {
        Optional<InvestorIndividual> currentInvestor = investorIndividualRepository.findByNikNumber(req.getIdentityNumberKTPNIK());
        // validate nik number
        if (currentInvestor.isPresent() && currentInvestor.get().getStatus().equals(ConstantDefault.APPROVED_STATUS)) {
            throw new BusinessException("403", "This nik is already registered!");
        }
        // validate email
        if (!Pattern.compile(RegexConstant.EMAIL_REGEX).matcher(req.getEmail()).matches()) {
            throw new BusinessException("403", "This email address is not valid");
        }
        // validate identify
        if (!Pattern.compile(RegexConstant.IDENTIFY_REGEX).matcher(req.getIdentityNumberKTPNIK()).matches()) {
            throw new BusinessException("403", "This identify is not valid");
        }
    }

    @Override
    public void sendMailToIndividualInvestor(InvestorIndividual investor, String subj) {
        if (Objects.equals(investor.getEngageOption(), EngageOption.REMOTE.getValue())) {
            EmailConfig message = new EmailConfig();
            message.setTo(investor.getEmail());
            message.setSubject(subj);
            emailSender.sendEmail(message, individualMapper.investorToDto(investor), Constants.FILE_INDIVIDUAL);
        }
    }

    @Override
    public InvestorIndividualDto updateIndividualInvestor(String investorId, Integer rmId, InvestorIndividualDto req) {
        InvestorIndividual newInvestor = individualMapper.dtoToInvestor(req);
        newInvestor.setInvestorId(investorId);
        newInvestor.setRmId(rmId);
        newInvestor.setSid(newInvestor.getSid());
        newInvestor.setIfua(newInvestor.getIfua());
        newInvestor.setEngageOption(newInvestor.getEngageOption());
        newInvestor.setUpdatedAt(LocalDateTime.now());

        createIndividualInvestor(newInvestor);
        return null;
    }

    @Override
    public InvestorIndividualDto getIndividualInvestorByIdAndRmId(String id, Integer rmId) {
        Optional<InvestorIndividual> find = investorIndividualRepository.findInvestorIndividualByInvestorIdAndRmId(id, rmId);
        if (find.isPresent()) {
            return individualMapper.investorToDto(find.get());
        }
        return null;
    }

    @Override
    public InvestorIndividualDto getIndividualInvestorById(String id) {
        Optional<InvestorIndividual> find = investorIndividualRepository.findById(id);
        if (find.isPresent()) {
            return individualMapper.investorToDto(find.get());
        }
        return null;
    }

    @Override
    public void createInstitutionalInvestor(InvestorInstitutional investor) {
        Optional<InvestorInstitutional> currentInvestor = institutionalRepository.findByNpwpNo(investor.getNpwpNo());
        // validate npwp number
        if (currentInvestor.isPresent() && currentInvestor.get().getStatus().equals(ConstantDefault.APPROVED_STATUS)) {
            throw new BusinessException("403", "This npwp is already registered!");
        }
        // validate email
        if (!Pattern.compile(RegexConstant.EMAIL_REGEX).matcher(investor.getEmail()).matches()) {
            throw new BusinessException("403", "This email address is not valid");
        }
        // validate identify
        if (!Pattern.compile(RegexConstant.IDENTIFY_REGEX).matcher(investor.getInvestorId()).matches()) {
            throw new BusinessException("403", "This identify is not valid");
        }
        sendMailToInstitutionalInvestor(investor, Constants.SUBJ_REGISTER);

        institutionalRepository.save(investor);
    }

    @Override
    public void sendMailToInstitutionalInvestor(InvestorInstitutional investor, String subj) {
        if (Objects.equals(investor.getEngageOption(), EngageOption.REMOTE.getValue())) {
            EmailConfig message = new EmailConfig();
            message.setTo(investor.getEmail());
            message.setSubject(subj);
            emailSender.sendEmail(message, institutionalMapper.toDto(investor), Constants.FILE_INSITUTION);
        }
    }

    @Override
    public InvestorInstitutionalDto findInstitutionalInvestorById(String id) {
        Optional<InvestorInstitutional> find = institutionalRepository.findById(id);
        if (find.isPresent()) {
            InvestorInstitutional result = find.get();
            return institutionalMapper.toDto(result);
        }
        return null;
    }

    @Override
    public List<InvestorInstitutional> getListInstitutionalInvestors() {
        return institutionalRepository.findAll();
    }

}
