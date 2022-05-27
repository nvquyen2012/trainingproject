package com.example.module2.entity;

import com.example.trainingbase.entity.AbstractEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(schema = "crm_bib")
public class Data extends AbstractEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String isInCode;
    private String fundName;
    private String fundType;
    private String prospectusUrl;
    private String factSheetUrl;
    private BigDecimal assetUnderManagement;

    @ManyToOne
    @JoinColumn(name = "assetAllocation_id", nullable = false)
    private AssetAllocation assetAllocation;

    private Double minSubscription;
    private Double minRedemption;
    private Double minSubsequentSubscription;
    private String custodianBankName;
    private String intermediaryBankName;
    private LocalDateTime productInfoUpdatedAt;
    private LocalDate launchDate;

    @OneToMany(mappedBy = "data")
    private List<ReturnInfo> returnInfos;

    @ManyToOne
    @JoinColumn(name = "nav_id",nullable = false, insertable = false, updatable = false)
    private Nav nav;

    @Column(name = "nav_id")
    private Long navId;

    @ManyToOne
    @JoinColumn(name = "investmentManager_id",nullable = false, insertable = false, updatable = false)
    private InvestmentManager investmentManager;

    @Column(name = "investmentManager_id")
    private Long investmentManagerId;
}
