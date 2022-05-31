package com.example.module3.repository;

import com.example.trainingbase.entity.crm.Lead;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface LeadRepository extends JpaRepository<Lead, String> {
    Optional<Lead> findLeadByRmId(int rmId);
}
