package com.example.module2.repository;

import com.example.module2.entity.DataEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepo extends JpaRepository<DataEntity, Integer> {
    DataEntity findById(int id);
}
