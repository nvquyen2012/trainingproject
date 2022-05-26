package com.example.module3.repository;

import com.example.trainingbase.entity.crm.InvestorInstitutional;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface InvestorInstitutionalRepository extends JpaRepository<InvestorInstitutional,String> {

    Optional<InvestorInstitutional> findByNpwpNo(String npwpNo);

    List<InvestorInstitutional> findInvestorInstitutionalByRmIdAndStatus(int rmId, String status);
    List<InvestorInstitutional> findInvestorInstitutionalByRmId(int rmId);
}
