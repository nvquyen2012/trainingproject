package com.example.trainingbase.repository;

import com.example.trainingbase.entity.AbstractEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface BasicRepository<T extends AbstractEntity> extends JpaRepository<T, Long> {
}
