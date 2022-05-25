package com.example.module3.controller;

import com.example.module3.repository.InvestorIndividualRepository;
import com.example.module3.service.InvestorIndividualService;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.exceptions.BusinessException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/investor-individual")
@Slf4j
public class InvestorIndividualController {
    @Autowired
    private InvestorIndividualService investorIndividualService;


    @GetMapping
    public ResponseEntity<List<InvestorIndividual>> saveInvestorIndividual() {
        List<InvestorIndividual> investorIndividualList = investorIndividualService.getListInvestorIndividual();
        return new ResponseEntity<>(investorIndividualList, HttpStatus.OK);
    }

    @PostMapping("/save")
    public ResponseEntity<Object> saveUpdateInvestor(@RequestBody InvestorIndividual req) {
        try {
            log.info("Start saving a new investor");
            investorIndividualService.saveInvestorIndividual(req);
            log.info("Finish saving a new investor");
            return new ResponseEntity<>(req, HttpStatus.OK);

        } catch (Exception e) {
            log.error(e.getMessage());
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }
}
