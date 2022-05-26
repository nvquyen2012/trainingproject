package com.example.module3.repository;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.entity.crm.InvestorInstitutional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface InvestorIndividualRepository extends JpaRepository<InvestorIndividual, String> {
    @Query("select i from InvestorIndividual i where i.identityNumberKTPNIK = :nikNumber")
    Optional<InvestorIndividual> findByNikNumber(@Param("nikNumber") String nikNumber);
    Optional<InvestorIndividual> findInvestorIndividualByInvestorIdAndRmId(String id, Integer rmId);
    List<InvestorIndividual> findInvestorIndividualsByRmIdAndStatus(int rmId, String status);
}
