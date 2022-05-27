package com.example.module2.repository;

import com.example.module2.entity.NavEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NavRepo extends JpaRepository<NavEntity, Integer> {
}
