package com.example.trainingbase.repository;

import com.example.trainingbase.entity.crm.Bank;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BankRepository extends JpaRepository<Bank, Integer> {

}
