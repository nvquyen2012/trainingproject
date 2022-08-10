package com.example.auth.repository;

import com.example.trainingbase.entity.new_auth.Role;
import com.example.trainingbase.repository.BasicRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository("roleRepository")
public interface RoleRepository extends BasicRepository<Role> {

  Optional<Role> findByName(String name);

  Boolean existsByName(String name);

}
