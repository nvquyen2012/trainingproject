package com.example.module1.repository;

import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.entity.auth.RefreshToken;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RefreshTokenRepository extends JpaRepository<RefreshToken, Integer> {
    Optional<RefreshToken> findById(Integer id);
    Optional<RefreshToken> findByToken(String token);

    @Modifying
    void deleteByAuthUser(AuthUser authUser);

}
