package com.example.trainingbase.mapper;

import com.example.trainingbase.dto.InvestorInstitutionalDto;
import com.example.trainingbase.entity.crm.InvestorInstitutional;
import javax.annotation.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2022-06-07T13:02:32+0700",
    comments = "version: 1.4.2.Final, compiler: javac, environment: Java 1.8.0_332 (Amazon.com Inc.)"
)
@Component
public class InvestorInstitutionalMapperImpl implements InvestorInstitutionalMapper {

    @Override
    public InvestorInstitutionalDto toDto(InvestorInstitutional investor) {
        if ( investor == null ) {
            return null;
        }

        InvestorInstitutionalDto investorInstitutionalDto = new InvestorInstitutionalDto();

        investorInstitutionalDto.setInvestorId( investor.getInvestorId() );
        investorInstitutionalDto.setRmId( investor.getRmId() );
        investorInstitutionalDto.setCompanyName( investor.getCompanyName() );
        investorInstitutionalDto.setCountryOfDomicile( investor.getCountryOfDomicile() );
        investorInstitutionalDto.setPlaceOfEstablishment( investor.getPlaceOfEstablishment() );
        investorInstitutionalDto.setDateOfEstablishment( investor.getDateOfEstablishment() );
        investorInstitutionalDto.setArticlesOfAssociationNo( investor.getArticlesOfAssociationNo() );
        investorInstitutionalDto.setNpwpNo( investor.getNpwpNo() );
        investorInstitutionalDto.setNpwpRegistrationDate( investor.getNpwpRegistrationDate() );
        investorInstitutionalDto.setSiupNo( investor.getSiupNo() );
        investorInstitutionalDto.setSiupExpirationDate( investor.getSiupExpirationDate() );
        investorInstitutionalDto.setSkdNo( investor.getSkdNo() );
        investorInstitutionalDto.setSkdExpirationDate( investor.getSkdExpirationDate() );
        investorInstitutionalDto.setCompanyAddress( investor.getCompanyAddress() );
        investorInstitutionalDto.setCompanyCityCode( investor.getCompanyCityCode() );
        investorInstitutionalDto.setCompanyCityName( investor.getCompanyCityName() );
        investorInstitutionalDto.setCompanyPostalCode( investor.getCompanyPostalCode() );
        investorInstitutionalDto.setEmail( investor.getEmail() );
        investorInstitutionalDto.setOfficePhone( investor.getOfficePhone() );
        investorInstitutionalDto.setCompanyCorrespondentAddress( investor.getCompanyCorrespondentAddress() );
        investorInstitutionalDto.setCompanyCorrespondentCityCode( investor.getCompanyCorrespondentCityCode() );
        investorInstitutionalDto.setCompanyCorrespondentCityName( investor.getCompanyCorrespondentCityName() );
        investorInstitutionalDto.setCompanyCorrespondentPostalCode( investor.getCompanyCorrespondentPostalCode() );
        investorInstitutionalDto.setEmailCorrespondent( investor.getEmailCorrespondent() );
        investorInstitutionalDto.setAuthorizedPerson1FullName( investor.getAuthorizedPerson1FullName() );
        investorInstitutionalDto.setAuthorizedPerson1Position( investor.getAuthorizedPerson1Position() );
        investorInstitutionalDto.setAuthorizedPerson1MobilePhone( investor.getAuthorizedPerson1MobilePhone() );
        investorInstitutionalDto.setAuthorizedPerson1Email( investor.getAuthorizedPerson1Email() );
        investorInstitutionalDto.setAuthorizedPerson2FullName( investor.getAuthorizedPerson2FullName() );
        investorInstitutionalDto.setAuthorizedPerson2Position( investor.getAuthorizedPerson2Position() );
        investorInstitutionalDto.setAuthorizedPerson2MobilePhone( investor.getAuthorizedPerson2MobilePhone() );
        investorInstitutionalDto.setAuthorizedPerson2Email( investor.getAuthorizedPerson2Email() );
        investorInstitutionalDto.setInvestorsRiskProfile( investor.getInvestorsRiskProfile() );
        investorInstitutionalDto.setCompanyType( investor.getCompanyType() );
        investorInstitutionalDto.setCompanyCharacteristic( investor.getCompanyCharacteristic() );
        investorInstitutionalDto.setIncomeLevel( investor.getIncomeLevel() );
        investorInstitutionalDto.setInvestmentObjective( investor.getInvestmentObjective() );
        investorInstitutionalDto.setSourceOfFund( investor.getSourceOfFund() );
        investorInstitutionalDto.setBankName( investor.getBankName() );
        investorInstitutionalDto.setBankAccountNumber( investor.getBankAccountNumber() );
        investorInstitutionalDto.setBankAccountName( investor.getBankAccountName() );
        investorInstitutionalDto.setBankBranch( investor.getBankBranch() );
        investorInstitutionalDto.setFatca( investor.getFatca() );
        investorInstitutionalDto.setTinForeignTIN( investor.getTinForeignTIN() );
        investorInstitutionalDto.setTinForeignTINIssuanceCountry( investor.getTinForeignTINIssuanceCountry() );
        investorInstitutionalDto.setGiin( investor.getGiin() );
        investorInstitutionalDto.setSubstantialUSOwnerName( investor.getSubstantialUSOwnerName() );
        investorInstitutionalDto.setSubstantialUSOwnerAddress( investor.getSubstantialUSOwnerAddress() );
        investorInstitutionalDto.setSubstantialUSOwnerTIN( investor.getSubstantialUSOwnerTIN() );
        investorInstitutionalDto.setIdentityPicture( investor.getIdentityPicture() );
        investorInstitutionalDto.setSignatureFile( investor.getSignatureFile() );
        investorInstitutionalDto.setSignMethod( investor.getSignMethod() );
        investorInstitutionalDto.setStatus( investor.getStatus() );
        investorInstitutionalDto.setEngageOption( investor.getEngageOption() );

        return investorInstitutionalDto;
    }

    @Override
    public InvestorInstitutional toEntity(InvestorInstitutionalDto investorDto) {
        if ( investorDto == null ) {
            return null;
        }

        InvestorInstitutional investorInstitutional = new InvestorInstitutional();

        investorInstitutional.setInvestorId( investorDto.getInvestorId() );
        investorInstitutional.setRmId( investorDto.getRmId() );
        investorInstitutional.setCompanyName( investorDto.getCompanyName() );
        investorInstitutional.setCountryOfDomicile( investorDto.getCountryOfDomicile() );
        investorInstitutional.setPlaceOfEstablishment( investorDto.getPlaceOfEstablishment() );
        investorInstitutional.setDateOfEstablishment( investorDto.getDateOfEstablishment() );
        investorInstitutional.setArticlesOfAssociationNo( investorDto.getArticlesOfAssociationNo() );
        investorInstitutional.setNpwpNo( investorDto.getNpwpNo() );
        investorInstitutional.setNpwpRegistrationDate( investorDto.getNpwpRegistrationDate() );
        investorInstitutional.setSiupNo( investorDto.getSiupNo() );
        investorInstitutional.setSiupExpirationDate( investorDto.getSiupExpirationDate() );
        investorInstitutional.setSkdNo( investorDto.getSkdNo() );
        investorInstitutional.setSkdExpirationDate( investorDto.getSkdExpirationDate() );
        investorInstitutional.setCompanyAddress( investorDto.getCompanyAddress() );
        investorInstitutional.setCompanyCityCode( investorDto.getCompanyCityCode() );
        investorInstitutional.setCompanyCityName( investorDto.getCompanyCityName() );
        investorInstitutional.setCompanyPostalCode( investorDto.getCompanyPostalCode() );
        investorInstitutional.setEmail( investorDto.getEmail() );
        investorInstitutional.setOfficePhone( investorDto.getOfficePhone() );
        investorInstitutional.setCompanyCorrespondentAddress( investorDto.getCompanyCorrespondentAddress() );
        investorInstitutional.setCompanyCorrespondentCityCode( investorDto.getCompanyCorrespondentCityCode() );
        investorInstitutional.setCompanyCorrespondentCityName( investorDto.getCompanyCorrespondentCityName() );
        investorInstitutional.setCompanyCorrespondentPostalCode( investorDto.getCompanyCorrespondentPostalCode() );
        investorInstitutional.setEmailCorrespondent( investorDto.getEmailCorrespondent() );
        investorInstitutional.setAuthorizedPerson1FullName( investorDto.getAuthorizedPerson1FullName() );
        investorInstitutional.setAuthorizedPerson1Position( investorDto.getAuthorizedPerson1Position() );
        investorInstitutional.setAuthorizedPerson1MobilePhone( investorDto.getAuthorizedPerson1MobilePhone() );
        investorInstitutional.setAuthorizedPerson1Email( investorDto.getAuthorizedPerson1Email() );
        investorInstitutional.setAuthorizedPerson2FullName( investorDto.getAuthorizedPerson2FullName() );
        investorInstitutional.setAuthorizedPerson2Position( investorDto.getAuthorizedPerson2Position() );
        investorInstitutional.setAuthorizedPerson2MobilePhone( investorDto.getAuthorizedPerson2MobilePhone() );
        investorInstitutional.setAuthorizedPerson2Email( investorDto.getAuthorizedPerson2Email() );
        investorInstitutional.setInvestorsRiskProfile( investorDto.getInvestorsRiskProfile() );
        investorInstitutional.setCompanyType( investorDto.getCompanyType() );
        investorInstitutional.setCompanyCharacteristic( investorDto.getCompanyCharacteristic() );
        investorInstitutional.setIncomeLevel( investorDto.getIncomeLevel() );
        investorInstitutional.setInvestmentObjective( investorDto.getInvestmentObjective() );
        investorInstitutional.setSourceOfFund( investorDto.getSourceOfFund() );
        investorInstitutional.setBankName( investorDto.getBankName() );
        investorInstitutional.setBankAccountNumber( investorDto.getBankAccountNumber() );
        investorInstitutional.setBankAccountName( investorDto.getBankAccountName() );
        investorInstitutional.setBankBranch( investorDto.getBankBranch() );
        investorInstitutional.setFatca( investorDto.getFatca() );
        investorInstitutional.setTinForeignTIN( investorDto.getTinForeignTIN() );
        investorInstitutional.setTinForeignTINIssuanceCountry( investorDto.getTinForeignTINIssuanceCountry() );
        investorInstitutional.setGiin( investorDto.getGiin() );
        investorInstitutional.setSubstantialUSOwnerName( investorDto.getSubstantialUSOwnerName() );
        investorInstitutional.setSubstantialUSOwnerAddress( investorDto.getSubstantialUSOwnerAddress() );
        investorInstitutional.setSubstantialUSOwnerTIN( investorDto.getSubstantialUSOwnerTIN() );
        investorInstitutional.setIdentityPicture( investorDto.getIdentityPicture() );
        investorInstitutional.setSignatureFile( investorDto.getSignatureFile() );
        investorInstitutional.setSignMethod( investorDto.getSignMethod() );
        investorInstitutional.setStatus( investorDto.getStatus() );
        investorInstitutional.setEngageOption( investorDto.getEngageOption() );

        return investorInstitutional;
    }
}
