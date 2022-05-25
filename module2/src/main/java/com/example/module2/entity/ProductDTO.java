package com.example.module2.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class ProductDTO {
    private List<Data> data;
    private Meta meta;

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    @ToString
    public static class Data {
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

        //AssetAllocation
        @JsonProperty("asset_allocation")
        private AssetAllocation assetAllocation;

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

        //Return infos
        @JsonProperty("return_infos")
        private List<ReturnInfo> returnInfos;
        //Nav
        @JsonProperty("nav")
        private Nav nav;

        //investmentManager
        @JsonProperty("investment_manager")
        private InvestmentManager investmentManager;
    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    @ToString
    public static class InvestmentManager { // quản lý đầu từ
        private int id;
        private String code;
        private String name;
        @JsonProperty("full_name")
        private String fullName;
        @JsonProperty("icon_url")
        private String iconUrl;
        @JsonProperty("product_count")
        private int productCount;
    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    @ToString
    public static class Nav {
        private LocalDate date;
        private BigDecimal value;

    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    @ToString
    public static class AssetAllocation { // phân bổ tài sản
        @JsonProperty("institution_title")
        private String institutionTitle;
        private List<Institution> institutions;
        private List<Instrument> instruments;
        @JsonProperty("updated_at")
        private LocalDate updateAt;
    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    @ToString
    public static class Instrument { // dụng cụ
        private Double percentage;
        private String name;
    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    @ToString
    public static class Institution {// tổ chức
        private String name;
    }



    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    @ToString
    public static class Meta {
        @JsonProperty("offset")
        private Integer offset;
        @JsonProperty("limit")
        private Integer limit;
        @JsonProperty("total")
        private Integer total;
        @JsonProperty("http_status")
        private Integer httpStatus;
    }
}
