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
public class InvestorIndividualDto {
    private String identityNumberKTPNIK;
    private String name;
    private String placeOfBirth;
    private LocalDate dateOfBirth;
    private Integer gender;
    private String province;
    private String city;
    private String districts;
    private String urbanVillage;
    private String neighbourhoodHamlet;
    private String address;
    private String postalCode;
    private Integer religion;
    private Integer maritalStatus;
    private Integer occupation;
    private Integer education;
    private Integer incomeLevelMonth;
    private Integer sourceOfFund;
    private Integer riskProfile;
    private Integer investmentObjective;
    private String primaryMobilePhone;
    private String email;

    private String bankName;
    private String bankAccountNumber;
    private String bankAccountName;
    private String bankBranch;

    private Integer beneficiaryOwner;
    private Integer politicallyExposedPersons;

    private String identityPicture;
    private String signatureFile;

    private Integer signMethod;
    private String status;
}
