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
    @Mapping(target = "name", source = "name")
    @Mapping(target = "status", source = "status")
    InvestorIndividual toIndividualEntity(InvestorStatusDto investorStatusDto);

    @Mapping(target = "name", source = "name")
    @Mapping(target = "status", source = "status")
    InvestorStatusDto toIndividualDto(InvestorIndividual investorIndividual);

    @Mapping(target = "companyName", source = "name")
    @Mapping(target = "status", source = "status")
    InvestorInstitutional toInstitutionalEntity(InvestorStatusDto investorStatusDto);

    @Mapping(target = "name", source = "companyName")
    @Mapping(target = "status", source = "status")
    InvestorStatusDto toInstitutionalDto(InvestorInstitutional investorIndividual);
}
