package com.example.module3.service.impl;

import com.example.module3.config.EmailConfig;
import com.example.module3.repository.InvestorIndividualRepository;
import com.example.module3.service.InvestorIndividualService;
import com.example.module3.util.MailSenderService;
import com.example.trainingbase.constants.ConstantDefault;
import com.example.trainingbase.constants.RegexConstant;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.entity.crm.enums.EngageOption;
import com.example.trainingbase.exceptions.BusinessException;
import com.example.trainingbase.mapper.InvestorIndividualMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.regex.Pattern;

@Service
@Slf4j
public class InvestorIndividualServiceImpl implements InvestorIndividualService {
    @Autowired
    private InvestorIndividualRepository investorIndividualRepository;

    @Autowired
    private MailSenderService sendMail;

    @Autowired
    private MailSenderService emailSender;

    @Autowired
    private InvestorIndividualMapper individualMapper;

    @Override
    public List<InvestorIndividual> getListInvestorIndividual() {
        return investorIndividualRepository.findAll();
    }

    @Override
    public void saveInvestorIndividual(InvestorIndividual req) {
        try {
            isValidReq(req);

            sendMail(req);

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
    public void sendMail(InvestorIndividual investor) {
        if (Objects.equals(investor.getEngageOption(), EngageOption.REMOTE.getValue())) {
            EmailConfig message = new EmailConfig();
            message.setTo(investor.getEmail());
            message.setSubject("BIB - Complete your registration!!");
            log.info("Start sending the information by email...");
            emailSender.sendEmail(message, individualMapper.investorToDto(investor));
            log.info("mail sent successful!");
        }
    }

    @Override
    public Optional<InvestorIndividual> getInvestorByIdAndRmId(String id, Integer rmId) {
        return investorIndividualRepository.findInvestorIndividualByInvestorIdAndRmId(id, rmId);
    }

    @Override
    public Optional<InvestorIndividual> getInvestorById(String id) {
        return investorIndividualRepository.findById(id);
    }
}
