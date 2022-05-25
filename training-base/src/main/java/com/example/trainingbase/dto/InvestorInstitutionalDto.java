package com.example.trainingbase.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class InvestorInstitutionalDto {
    private String investorId;

    private Integer rmId;

    // Company Details
    private String companyName;
    private String countryOfDomicile;
    private String placeOfEstablishment;
    private LocalDate dateOfEstablishment;
    private String articlesOfAssociationNo;
    private String npwpNo;
    private LocalDate npwpRegistrationDate;

    private String siupNo;
    private LocalDate siupExpirationDate;
    private String skdNo;
    private LocalDate skdExpirationDate;

    private String companyAddress;
    private String companyCityCode;
    private String companyCityName;
    private String companyPostalCode;
    private String email;
    private String officePhone;
    private String companyCorrespondentAddress;
    private String companyCorrespondentCityCode;
    private String companyCorrespondentCityName;
    private String companyCorrespondentPostalCode;
    private String emailCorrespondent;

    //AuthorizedPerson1Information
    private String authorizedPerson1FullName;
    private String authorizedPerson1Position;
    private String authorizedPerson1MobilePhone;
    private String authorizedPerson1Email;

    // AuthorizedPerson2Information
    private String authorizedPerson2FullName;
    private String authorizedPerson2Position;
    private String authorizedPerson2MobilePhone;
    private String authorizedPerson2Email;

    private Integer investorsRiskProfile;

    // Bussiness Data
    private Integer companyType;
    private Integer companyCharacteristic;
    private Integer incomeLevel;
    private Integer investmentObjective;
    private Integer sourceOfFund;

    //Bank information ??
    private String bankName;
    private String bankAccountNumber;
    private String bankAccountName;
    private String bankBranch;

    // FATCA
    private Integer fatca;
    private String tinForeignTIN;
    private String tinForeignTINIssuanceCountry;
    private String giin;
    private String substantialUSOwnerName;
    private String substantialUSOwnerAddress;
    private String substantialUSOwnerTIN;

    private String identityPicture;
    private String signatureFile;

    private Integer signMethod;
    private String status;

    // BIB sync
//    private String sid;
//    private String ifua;

    private Integer engageOption;
}
