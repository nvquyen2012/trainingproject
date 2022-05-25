package com.example.module3.controller;

import com.example.module3.service.InvestorIndividualService;
import com.example.module3.service.InvestorService;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/investor")
@Slf4j
public class InvestorController {
    @Autowired
    private InvestorService investorService;


    @GetMapping("/{rm_id}/{status}")
    public ResponseEntity<List<Object>> getInvestorStatusByRmId(@PathVariable("rm_id") int rmId, @PathVariable("status")String status) {
        List<Object> objectList = investorService.getListInvestorByRmId(rmId, status);
        return new ResponseEntity<>(objectList, HttpStatus.OK);
    }
}
