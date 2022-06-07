package com.example.module3.repository;

import com.example.trainingbase.entity.crm.InvestorInstitutional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface InvestorInstitutionalRepository extends JpaRepository<InvestorInstitutional,String> {

    Optional<InvestorInstitutional> findByNpwpNo(String npwpNo);
    Page<InvestorInstitutional> findInvestorInstitutionalByRmIdAndStatus(Pageable pageable,int rmId, String status);
    Page<InvestorInstitutional> findInvestorInstitutionalByRmId(Pageable pageable,int rmId);

    Optional<InvestorInstitutional> findByRmIdAndInvestorId(int rmId, String investorId);
}
