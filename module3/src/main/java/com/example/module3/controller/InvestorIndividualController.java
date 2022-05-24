package com.example.module3.controller;

import com.example.module3.repository.InvestorIndividualRepository;
import com.example.module3.service.InvestorIndividualService;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/investor-individual")
public class InvestorIndividualController {
    @Autowired
    private InvestorIndividualService investorIndividualService;


    @GetMapping
    public ResponseEntity<List<InvestorIndividual>> saveInvestorIndividual() {
        List<InvestorIndividual> investorIndividualList = investorIndividualService.getListInvestorIndividual();
        return new ResponseEntity<>(investorIndividualList, HttpStatus.OK);
    }

    @PostMapping("/save")
    public ResponseEntity<InvestorIndividual> saveUpdateInvestor(@RequestBody InvestorIndividual req) {
        investorIndividualService.saveInvestorIndividual(req);
        return new ResponseEntity<>(req, HttpStatus.OK);
    }
}
