package com.example.module3.service.impl;

import com.example.module3.repository.InvestorInstitutionalRepository;
import com.example.module3.service.InvestorInstitutionalService;
import com.example.trainingbase.constants.ConstantDefault;
import com.example.trainingbase.constants.RegexConstant;
import com.example.trainingbase.dto.InvestorInstitutionalDto;
import com.example.trainingbase.entity.crm.InvestorInstitutional;
import com.example.trainingbase.entity.crm.enums.EngageOption;
import com.example.trainingbase.exceptions.BusinessException;
import com.example.trainingbase.mapper.InvestorInstitutionalMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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

//    @Autowired
//    private InvestorInstitutionalMapper institutionalMapper;

    @Autowired
    private JavaMailSender emailSender;

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

        if (Objects.equals(investor.getEngageOption(), EngageOption.REMOTE.getValue())) {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("buiducthinh2502@gmail.com");
            message.setTo(investor.getEmail());
            message.setSubject("BIB - Complete your registration!!");
            message.setText("To confirm your account please click here: " +
                    "http://localhost:8080/confirm-account?uuid=" + investor.getInvestorId());
            log.info("Start sending the information by email...");
            emailSender.send(message);
            log.info("mail sent successful!");
        }

        institutionalRepository.save(investor);
//        return institutionalMapper.toDto(investor);
    }

    @Override
    public InvestorInstitutional findByInvestorId(String id) {
        if (institutionalRepository.findById(id).isPresent()){
            return institutionalRepository.findById(id).get();
        } else {
            throw new BusinessException("404","Investor NOT found");
        }
    }

    @Override
    public List<InvestorInstitutional> getAllInvestors() {
        return institutionalRepository.findAll();
    }
}
