package com.example.module2.repository;

import com.example.module2.entity.ReturnInfoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReturnInfoRepo extends JpaRepository<ReturnInfoEntity, Integer> {
}
