package com.example.module3.repository;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface InvestorIndividualRepository extends JpaRepository<InvestorIndividual, String> {
    @Query("select i from InvestorIndividual i where i.identityNumberKTPNIK = :nikNumber")
    Optional<InvestorIndividual> findByNikNumber(@Param("nikNumber") String nikNumber);
    Optional<InvestorIndividual> findByInvestorIdAndRmId(String id, Integer rmId);
    List<InvestorIndividual> findByRmIdAndStatus(Integer rmId, String status);
    List<InvestorIndividual> findByRmId(Integer rmId);
    Optional<InvestorIndividual> findByRmIdAndInvestorId(Integer rmId, String investorId);
}
