package com.example.module3.controller;

import com.example.module3.service.InvestorInstitutionalService;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.entity.crm.InvestorInstitutional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/investor-institutional")
@Slf4j
public class InvestorInstitutionalController {

    @Autowired
    InvestorInstitutionalService institutionalService;

    @PostMapping("/save")
    public ResponseEntity<Object> saveUpdateInvestor(@RequestBody InvestorInstitutional req) {
        try {
            log.info("Start saving a new investor");
            institutionalService.createInvestorInstitutional(req);
            log.info("Finish saving a new investor");
            return new ResponseEntity<>(req, HttpStatus.OK);

        } catch (Exception e) {
            log.error(e.getMessage());
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }
}
