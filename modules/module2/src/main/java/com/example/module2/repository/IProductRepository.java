package com.example.module2.repository;


import com.example.module2.dto.ProductExcelDTO;
import com.example.module2.entity.Data;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IProductRepository extends JpaRepository<Data, Long> {

    @Query(value = "SELECT NEW com.example.module2.dto.ProductExcelDTO(i.name,d.custodianBankName,d.launchDate,d.minSubscription)" +
            " from Data d join InvestmentManager i ON d.investmentManagerId = i.id " +
            " where i.id = 1")
    List<ProductExcelDTO> findAllProductExcelDTO();
}
