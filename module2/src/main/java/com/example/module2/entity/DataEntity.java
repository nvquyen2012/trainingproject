package com.example.module2.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(schema = "public", name = "Data")
public class DataEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @JsonProperty("isin_code")
    private String isinCode;
    @JsonProperty("fund_name")
    private String fundName;
    @JsonProperty("fund_type")
    private String fundType;
    @JsonProperty("prospectus_url")
    private String prospectusUrl;
    @JsonProperty("factsheet_url")
    private String factSheetUrl;
    @JsonProperty("asset_under_management")
    private BigDecimal assetUnderManagement;

    @JsonProperty("min_subscription")
    private Double minSubscription;
    @JsonProperty("min_redemption")
    private Double minRedemption;
    @JsonProperty("min_subsequent_subscription")
    private Double minSubsequentSubscription;
    @JsonProperty("custodian_bank_name")
    private String custodianBankName;
    @JsonProperty("intermediary_bank_name")
    private String intermediaryBankName;
    @JsonProperty("product_info_updated_at")
    private LocalDateTime productInfoUpdatedAt;
    @JsonProperty("launch_date")
    private LocalDate launchDate;


    //AssetAllocation
    @JsonProperty("asset_allocation")
    @ManyToOne
    @JoinColumn(name = "data_assetAllocation")
    private AssetAllocationEntity assetAllocationEntity;

    //Return infos
    @JsonProperty("return_infos")
    @OneToMany(mappedBy = "dataEntity")
    private List<ReturnInfoEntity> returnInfoEntity = new ArrayList<>();

    //Nav
    @JsonProperty("nav")
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "data_nav")
    private NavEntity navEntity;

    //investmentManager
    @JsonProperty("investment_manager")
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "data_investmentManager")
    private InstitutionEntity investmentManagerEntity;
}
