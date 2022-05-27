package com.example.module1.repository;

import com.example.trainingbase.entity.auth.AuthUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.swing.text.html.Option;
import javax.transaction.Transactional;
import java.util.Optional;

@Transactional
@Repository
public interface UserRepository extends JpaRepository<AuthUser, Integer> {

    Optional<AuthUser> findById(Integer Id);
    Optional<AuthUser> findByEmail(String email);
    Optional<AuthUser> findByCompanyId(Integer Id);
    Optional<AuthUser> deleteByEmail(String email);
}
