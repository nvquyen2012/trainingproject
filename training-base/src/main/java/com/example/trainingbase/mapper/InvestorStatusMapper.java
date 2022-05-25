package com.example.trainingbase.mapper;

import com.example.trainingbase.entity.crm.InvestorIndividual;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.NullValuePropertyMappingStrategy;

@Mapper(componentModel = "spring",
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE,
        uses = {InvestorStatusMapper.class})
public interface InvestorStatusMapper {
//    @Mapping(target = "erpId", source = "organizationErpId")
//    @Mapping(target = "name", source = "organizationName")
//    @Mapping(target = "status", source = "status", qualifiedByName = "status.toEntity")
//    InvestorIndividual toEntity(OrganizationDto organization);
//
//    @Mapping(target = "organizationErpId", source = "erpId")
//    @Mapping(target = "organizationName", source = "name")
//    @Mapping(target = "status", source = "status", qualifiedByName = "status.toDto")
//    OrganizationDto toDto(Organization organizationCreated);
}
