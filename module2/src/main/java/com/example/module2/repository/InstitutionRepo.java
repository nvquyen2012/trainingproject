package com.example.module2.repository;

import com.example.module2.entity.InstitutionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InstitutionRepo extends JpaRepository<InstitutionEntity, Integer> {
}
