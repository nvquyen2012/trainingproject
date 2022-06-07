package com.example.module3.repository;

import com.example.trainingbase.dto.InvestorStatusDto;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface InvestorIndividualRepository extends JpaRepository<InvestorIndividual, String> {
    @Query("select i from InvestorIndividual i where i.identityNumberKTPNIK = :nikNumber")
    Optional<InvestorIndividual> findByNikNumber(@Param("nikNumber") String nikNumber);

    Optional<InvestorIndividual> findInvestorIndividualByInvestorIdAndRmId(String id, Integer rmId);

    String findQuery = "select *" +
            " from   (( select investor_id , name , status, created_at, updated_at  " +
            "from crm_bib.investor_individual where rm_id= :rmId ) " +
            "union (select investor_id , company_name , status,  created_at, updated_at " +
            "from crm_bib.investor_institutional where rm_id= :rmId  ) ) as temp" +
            " where status LIKE CONCAT('%',UPPER(:status) ,'%') ";
    String countQuery = "select count(*)" +
            " from   ((" +
            " select investor_id, status from crm_bib.investor_individual where rm_id= :rmId ) " +
            "union (select investor_id, status from crm_bib.investor_institutional where rm_id= :rmId  ) ) as temp" +
            " where status LIKE CONCAT('%',UPPER(:status) ,'%')";

    @Query(value = findQuery, countQuery = countQuery, nativeQuery = true)
    Page<Object> findInvestorByRmIdAndStatus(Pageable pageable, int rmId, String status);

    Optional<InvestorIndividual> findInvestorIndividualsByInvestorId(String investorId);

}
