package com.example.auth.repository;

import com.example.trainingbase.entity.new_auth.User;
import com.example.trainingbase.repository.BasicRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository("userRepository")
public interface UserRepository extends BasicRepository<User> {

  Optional<User> findByUsername(String username);

  Optional<User> findByEmail(String email);

  Boolean existsByUsername(String username);

  Boolean existsByEmail(String email);

  Boolean existsByPhone(String phone);

}
