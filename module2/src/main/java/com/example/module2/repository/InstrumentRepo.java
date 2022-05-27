package com.example.module2.repository;

import com.example.module2.entity.InstrumentEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InstrumentRepo extends JpaRepository<InstrumentEntity, Integer> {
}
