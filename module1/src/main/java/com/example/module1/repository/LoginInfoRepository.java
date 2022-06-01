package com.example.module1.repository;

import com.example.trainingbase.entity.auth.AuthLoginLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

@Repository
public interface LoginInfoRepository extends JpaRepository<AuthLoginLog, Integer> {
    @Modifying
    @Query("UPDATE AuthLoginLog a " +
            "SET a.updatedAt =:updatedAt " +
            "WHERE a.userId =:id")
    int updateConfirmedAt(@Param("id") String id,
                          @Param("updatedAt") LocalDateTime updatedAt);
}
