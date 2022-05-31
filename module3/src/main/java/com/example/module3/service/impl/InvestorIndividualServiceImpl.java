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
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.persistence.Entity;
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

    private EmailConfig emailConfig;

    @Override
    public List<InvestorIndividual> getListInvestorIndividual() {
        return investorIndividualRepository.findAll();
    }

    @Override
    public void saveInvestorIndividual(InvestorIndividual req) {
        try {
            isValidReq(req);
            if (Objects.equals(req.getEngageOption(), EngageOption.REMOTE.getValue())) {
                String subj = "BIB - Complete your registration!\nTo confirm your account please click here: " +
                        "http://localhost:8080/confirm-account?uuid=" + req.getInvestorId();
                sendMail(req.getEmail(), subj);
            }
            investorIndividualRepository.save(req);
        } catch (BusinessException ex) {
            throw new BusinessException(ex.getCode(), ex.getMessage());
        }
    }

    @Override
    public void sendMail(String to, String subj) {
        emailConfig = new EmailConfig();
        emailConfig.setTo(to);
        emailConfig.setContent(subj);
        sendMail.sendEmail(emailConfig);
    }

    @Override
    public Optional<InvestorIndividual> getInvestorById(String id) {
        return investorIndividualRepository.findById(id);
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
}
