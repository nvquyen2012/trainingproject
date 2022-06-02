package com.example.module3.service.impl;

import com.example.module3.config.EmailConfig;
import com.example.module3.repository.InvestorInstitutionalRepository;
import com.example.module3.service.InvestorInstitutionalService;
import com.example.module3.util.MailSenderService;
import com.example.trainingbase.constants.ConstantDefault;
import com.example.trainingbase.constants.RegexConstant;
import com.example.trainingbase.dto.InvestorInstitutionalDto;
import com.example.trainingbase.entity.crm.InvestorInstitutional;
import com.example.trainingbase.entity.crm.enums.EngageOption;
import com.example.trainingbase.exceptions.BusinessException;
import com.example.trainingbase.mapper.InvestorInstitutionalMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.regex.Pattern;


@Service
@Slf4j
public class InvestorInstitutionalServiceImpl implements InvestorInstitutionalService {

    @Autowired
    private InvestorInstitutionalRepository institutionalRepository;

    @Autowired
    private InvestorInstitutionalMapper institutionalMapper;

    @Autowired
    private MailSenderService emailSender;

    @Override
    public void createInvestorInstitutional(InvestorInstitutional investor) {
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
        sendMail(investor);

        institutionalRepository.save(investor);
    }

    @Override
    public void sendMail(InvestorInstitutional investor) {
        if (Objects.equals(investor.getEngageOption(), EngageOption.REMOTE.getValue())) {
            EmailConfig message = new EmailConfig();
            message.setTo(investor.getEmail());
            message.setSubject("BIB - Complete your registration!!");
            log.info("Start sending the information by email...");
            emailSender.sendEmail(message, institutionalMapper.toDto(investor));
            log.info("mail sent successful!");
        }
    }

    @Override
    public InvestorInstitutionalDto findByInvestorId(String id) {
        if (institutionalRepository.findById(id).isPresent()) {
            InvestorInstitutional result = institutionalRepository.findById(id).get();
            return institutionalMapper.toDto(result);
        } else {
            throw new BusinessException("404", "Investor NOT found");
        }
    }

    @Override
    public List<InvestorInstitutional> getAllInvestors() {
        return institutionalRepository.findAll();
    }

    @Override
    public Optional<InvestorInstitutional> getInvestorById(String id) {
        return institutionalRepository.findById(id);
    }


}
