package com.example.module3.controller;

import com.example.module3.service.InvestorService;
import com.example.trainingbase.dto.InvestorStatusDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/investor")
@Slf4j
public class InvestorController {
    @Autowired
    private InvestorService investorService;

    @GetMapping("/{rm_id}/{status}")
    public ResponseEntity<List<InvestorStatusDto>> getInvestorStatusByRmId(@PathVariable("rm_id") int rmId, @PathVariable("status")String status) {
        List<InvestorStatusDto> objectList = investorService.getListInvestorByRmId(rmId, status);
        return new ResponseEntity<>(objectList, HttpStatus.OK);
    }
}
