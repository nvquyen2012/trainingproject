package com.example.module2.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class DataDTO {
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
}
