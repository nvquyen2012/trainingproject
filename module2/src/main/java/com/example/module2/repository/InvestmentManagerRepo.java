package com.example.module2.repository;

import com.example.module2.entity.InvestmentManagerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InvestmentManagerRepo extends JpaRepository<InvestmentManagerEntity, Integer> {
}
