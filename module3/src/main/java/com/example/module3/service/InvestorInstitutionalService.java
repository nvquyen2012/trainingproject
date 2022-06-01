package com.example.module3.service;

import com.example.trainingbase.dto.InvestorInstitutionalDto;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.entity.crm.InvestorInstitutional;
import java.util.List;
import java.util.Optional;

public interface InvestorInstitutionalService {
    InvestorInstitutionalDto createInvestorInstitutional(InvestorInstitutional investor);

    Optional<InvestorInstitutional> getInvestorById(String id);
  
    InvestorInstitutionalDto findByInvestorId(String id);

    List<InvestorInstitutional> getAllInvestors();

}
