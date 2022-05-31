package com.example.trainingbase.mapper;

import com.example.trainingbase.dto.InvestorInstitutionalDto;
import com.example.trainingbase.entity.crm.InvestorInstitutional;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface InvestorInstitutionalMapper {

    InvestorInstitutionalDto toDto(InvestorInstitutional investor);

    InvestorInstitutional toEntity(InvestorInstitutionalDto investorDto);

}
