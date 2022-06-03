package com.example.module3.controller;

import com.example.module3.service.InvestorIndividualService;
import com.example.module3.service.InvestorInstitutionalService;
import com.example.module3.service.InvestorService;
import com.example.trainingbase.dto.InvestorStatusDto;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.entity.crm.InvestorInstitutional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/investor")
@Slf4j
public class InvestorController {
    @Autowired
    private InvestorService investorService;

    @Autowired
    private InvestorIndividualService investorIndividualService;

    @Autowired
    InvestorInstitutionalService institutionalService;

    @GetMapping("/getStatus")
    @ResponseBody
    public ResponseEntity<List<InvestorStatusDto>> getInvestorStatusByRmId(@RequestParam Integer rmId, @RequestParam Optional<String> status) {
        List<InvestorStatusDto> objectList = investorService.getListInvestorByRmId(rmId, status.orElseGet(() -> ""));
        return new ResponseEntity<>(objectList, HttpStatus.OK);
    }

    @PutMapping("/updateInvestorStatus")
    public ResponseEntity<Object> updateStudent(@RequestParam Integer rmId,@RequestBody InvestorStatusDto req) {
        try {
            Optional<InvestorIndividual> currentInvestorIndividual = investorIndividualService.getInvestorById(req.getInvestorId());
            Optional<InvestorInstitutional> currentInvestorInstitutional = institutionalService.getInstituInvestorById(req.getInvestorId());
            if (!currentInvestorIndividual.isPresent() && !currentInvestorInstitutional.isPresent()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            InvestorStatusDto updated = investorService.updateInvestorStatus(rmId,req);
            return new ResponseEntity<>(updated, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }
}
