package com.example.trainingbase.entity.crm;

import com.example.trainingbase.entity.AbstractEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "investor_individual", schema = "crm_bib")
public class InvestorIndividual extends AbstractEntity{

    @Id
    @Column(name = "investor_id", unique = true, nullable = false, length = 36)
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid")
    private String investorId;

    private Integer rmId;

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

    // BIB sync
    private String sid;
    private String ifua;

//    private LocalDateTime createdAt;
//    private LocalDateTime updatedAt;



    private Integer engageOption;
}
