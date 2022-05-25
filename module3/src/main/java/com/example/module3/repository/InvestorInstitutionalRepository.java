package com.example.module3.repository;

import com.example.trainingbase.entity.crm.InvestorInstitutional;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface InvestorInstitutionalRepository extends JpaRepository<InvestorInstitutional,String> {

    Optional<InvestorInstitutional> findByNpwpNo(String npwpNo);
}
