package com.example.module2.repository;

import com.example.module2.entity.AssetAllocationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AssetAllocationRepo extends JpaRepository<AssetAllocationEntity, Integer> {

}
