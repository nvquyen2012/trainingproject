package com.example.trainingbase.mapper;

import com.example.trainingbase.dto.InvestorIndividualDto;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface InvestorIndividualMapper {
    InvestorIndividualDto investorToDto(InvestorIndividual investor);
}
