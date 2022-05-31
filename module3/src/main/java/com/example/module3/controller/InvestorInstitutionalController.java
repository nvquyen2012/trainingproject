package com.example.module3.controller;

import com.example.module3.service.InvestorInstitutionalService;
import com.example.trainingbase.dto.InvestorInstitutionalDto;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.entity.crm.InvestorInstitutional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/investor-institutional")
@Slf4j
public class InvestorInstitutionalController {

    @Autowired
    InvestorInstitutionalService institutionalService;

    @PostMapping("/save")
    public ResponseEntity<Object> saveInvestor(@RequestBody InvestorInstitutional req) {
        try {
            log.info("Start saving a new investor");
            InvestorInstitutionalDto result = institutionalService.createInvestorInstitutional(req);
            log.info("Finish saving a new investor");
            return new ResponseEntity<>(result, HttpStatus.OK);

        } catch (Exception e) {
            log.error(e.getMessage());
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/getAll")
    public ResponseEntity<List<InvestorInstitutional>> getAllInvestor() {
        List<InvestorInstitutional> result = institutionalService.getAllInvestors();
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Object> getInvestorById(@PathVariable String id) {
        try {
            return new ResponseEntity<>(institutionalService.findByInvestorId(id), HttpStatus.OK);
        } catch (Exception e) {
            log.error(e.getMessage());
            return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
        }
    }
}
