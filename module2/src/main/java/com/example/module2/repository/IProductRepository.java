package com.example.module2.repository;

import com.example.module2.entity.Data;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IProductRepository extends JpaRepository<Data, Long> {
}
