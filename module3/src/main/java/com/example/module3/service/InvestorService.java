package com.example.module3.service;

import com.example.trainingbase.dto.InvestorStatusDto;

import java.util.List;

public interface InvestorService {
    List<InvestorStatusDto> getListInvestorByRmId(int rmId, String status);

    // get list investor by rmId
    // update investor by investor id and rmId
    InvestorStatusDto updateInvestorStatus(int rmId, InvestorStatusDto investorStatusDto);

}
