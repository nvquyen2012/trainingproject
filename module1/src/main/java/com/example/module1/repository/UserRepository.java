package com.example.module1.repository;

import com.example.trainingbase.entity.auth.AuthUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.swing.text.html.Option;
import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Optional;

@Transactional
@Repository
public interface UserRepository extends JpaRepository<AuthUser, Integer> {

    Optional<AuthUser> findById(Integer Id);
    Optional<AuthUser> findByEmail(String email);
    Optional<AuthUser> findByCompanyId(Integer Id);
    Optional<AuthUser> deleteByEmail(String email);
    @Modifying
    @Query("UPDATE AuthUser a " +
            "SET a.loginFailCount =:loginFailCount " +
            "WHERE a.id =:id")
    void saveFailedLogin(@Param("id") Integer id,
                          @Param("loginFailCount") Integer loginFailCount);

    @Modifying
    @Query("UPDATE AuthUser a " +
            "SET a.status =:status " +
            "WHERE a.id =:id")
    void setStatus(@Param("id") Integer id,
                        @Param("status") String status);

    @Modifying
    @Query("UPDATE AuthUser a " +
            "SET a.password =:password " +
            "WHERE a.id =:id")
    void setPassword(@Param("id") Integer id,
                   @Param("password") String password);

    @Modifying
    @Query("UPDATE AuthUser a " +
            "SET a.loginFailCount = 0 " +
            "WHERE a.id =:id")
    void resetLoginFailCount(@Param("id") Integer id);


}
