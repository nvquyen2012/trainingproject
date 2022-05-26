package com.example.trainingbase.mapper;

import com.example.trainingbase.dto.InvestorStatusDto;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.entity.crm.InvestorInstitutional;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.NullValuePropertyMappingStrategy;

@Mapper(componentModel = "spring",
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
public interface InvestorStatusMapper {
    InvestorIndividual toIndividualEntity(InvestorStatusDto investorStatusDto);

    InvestorStatusDto toIndividualDto(InvestorIndividual investorIndividual);

    @Mapping(target = "companyName", source = "name")
    InvestorInstitutional toInstitutionalEntity(InvestorStatusDto investorStatusDto);

    @Mapping(target = "name", source = "companyName")
    InvestorStatusDto toInstitutionalDto(InvestorInstitutional investorIndividual);
}
