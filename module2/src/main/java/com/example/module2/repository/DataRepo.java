package com.example.module2.repository;

import com.example.module2.entity.DataEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource
public interface DataRepo extends JpaRepository<DataEntity, Integer>, JpaSpecificationExecutor<DataEntity> {
}
