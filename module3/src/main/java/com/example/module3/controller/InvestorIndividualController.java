package com.example.module3.controller;

import com.example.module3.service.InvestorIndividualService;
import com.example.trainingbase.dto.InvestorIndividualDto;
import com.example.trainingbase.entity.crm.InvestorIndividual;
import com.example.trainingbase.mapper.InvestorIndividualMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/investor-individual")
@Slf4j
public class InvestorIndividualController {
    @Autowired
    private InvestorIndividualService investorIndividualService;

    @Autowired
    private InvestorIndividualMapper investorIndividualMapper;


    @GetMapping("/list")
    public ResponseEntity<List<InvestorIndividual>> saveInvestorIndividual() {
        List<InvestorIndividual> investorIndividualList = investorIndividualService.getListInvestorIndividual();
        return new ResponseEntity<>(investorIndividualList, HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<InvestorIndividualDto> getInvestorByIdAndRmId(@RequestParam String id, @RequestParam Integer rmId) {
        System.out.println(id);
        System.out.println(rmId);
        Optional<InvestorIndividual> investor = investorIndividualService.getInvestorByIdAndRmId(id, rmId);
        if (!investor.isPresent()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        InvestorIndividualDto investorDto = investorIndividualMapper.investorToDto(investor.get());
        return new ResponseEntity<>(investorDto, HttpStatus.OK);
    }

    @PostMapping("/save")
    public ResponseEntity<Object> saveInvestor(@RequestBody InvestorIndividual req) {
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

    @PutMapping("/update")
    public ResponseEntity<Object> updateInvestor(@RequestBody InvestorIndividual req) {
        try {
            log.info("start updating investor information");
            Optional<InvestorIndividual> currentInvestor = investorIndividualService.getInvestorByIdAndRmId(
                    req.getInvestorId(), req.getRmId());
            if (!currentInvestor.isPresent()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            currentInvestor.get().setAddress(req.getAddress());

            log.info("finish updating investor information");
            return new ResponseEntity<>(req.getInvestorId(), HttpStatus.OK);
        } catch (Exception e) {
            log.error(e.getMessage());
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }
}
