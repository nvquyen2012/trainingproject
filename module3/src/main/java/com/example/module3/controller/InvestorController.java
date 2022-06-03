package com.example.module3.controller;

import com.example.module3.service.InvestorService;
import com.example.trainingbase.dto.InvestorIndividualDto;
import com.example.trainingbase.dto.InvestorInstitutionalDto;
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




    @GetMapping("/getStatus")
    @ResponseBody
    public ResponseEntity<List<InvestorStatusDto>> getInvestorStatusByRmId(@RequestParam Integer rmId, @RequestParam Optional<String> status) {
        List<InvestorStatusDto> objectList = investorService.getListInvestorByRmId(rmId, status.orElseGet(() -> ""));
        return new ResponseEntity<>(objectList, HttpStatus.OK);
    }

    @PutMapping("/updateInvestorStatus")
    public ResponseEntity<Object> updateStudent(@RequestParam Integer rmId, @RequestBody InvestorStatusDto req) {
        try {
            InvestorIndividualDto currentInvestorIndividual = investorService.getIndividualInvestorById(req.getInvestorId());
            InvestorInstitutionalDto currentInvestorInstitutional = investorService.findInstitutionalInvestorById(req.getInvestorId());
            if (currentInvestorIndividual != null && currentInvestorInstitutional !=null) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            InvestorStatusDto updated = investorService.updateInvestorStatus(rmId, req);
            return new ResponseEntity<>(updated, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/listIndividual")
    public ResponseEntity<List<InvestorIndividual>> saveInvestorIndividual() {
        List<InvestorIndividual> investorIndividualList = investorService.getListIndividualInvestor();
        return new ResponseEntity<>(investorIndividualList, HttpStatus.OK);
    }

    @GetMapping("/getInvestorByIdAndRmId")
    public ResponseEntity<InvestorIndividualDto> getInvestorByIdAndRmId(@RequestParam String id, @RequestParam Integer rmId) {
        InvestorIndividualDto investor = investorService.getIndividualInvestorByIdAndRmId(id, rmId);
        if (investor == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(investor, HttpStatus.OK);
    }

    @PostMapping("/createIndividual")
    public ResponseEntity<Object> saveInvestor(@RequestBody InvestorIndividual req) {
        try {
            log.info("Start saving a new investor");
            investorService.createIndividualInvestor(req);
            log.info("Finish saving a new investor");
            return new ResponseEntity<>(req, HttpStatus.OK);

        } catch (Exception e) {
            log.error(e.getMessage());
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @PutMapping("/updateIndividual")
    public ResponseEntity<Object> updateInvestor(@RequestParam String investorId, @RequestParam Integer rmId,
                                                 @RequestBody InvestorIndividualDto req) {
        try {
            log.info("start updating investor information");
            InvestorIndividualDto currentInvestor = investorService.getIndividualInvestorByIdAndRmId(
                    investorId, rmId);
            if (currentInvestor == null) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
//            InvestorIndividual newInvestor = investorIndividualMapper.dtoToInvestor(req);
//            newInvestor.setInvestorId(investorId);
//            newInvestor.setRmId(rmId);
//            newInvestor.setCreatedAt(currentInvestor.get().getCreatedAt());
//            newInvestor.setCreatedBy(currentInvestor.get().getCreatedBy());
//            newInvestor.setSid(currentInvestor.get().getSid());
//            newInvestor.setIfua(currentInvestor.get().getIfua());
//            newInvestor.setEngageOption(currentInvestor.get().getEngageOption());
//            investorService.createIndividualInvestor(newInvestor);
            InvestorIndividualDto updated = investorService.updateIndividualInvestor(investorId, rmId, req);
            log.info("finish updating investor information");
            return new ResponseEntity<>(investorId, HttpStatus.OK);
        } catch (Exception e) {
            log.error(e.getMessage());
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping("/saveInstitutional")
    public ResponseEntity<Object> saveInvestor(@RequestBody InvestorInstitutional req) {
        try {
            log.info("Start saving a new investor");
            investorService.createInstitutionalInvestor(req);
            log.info("Finish saving a new investor");
            return new ResponseEntity<>(req, HttpStatus.OK);

        } catch (Exception e) {
            log.error(e.getMessage());
            return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/getAllInstitutional")
    public ResponseEntity<List<InvestorInstitutional>> getAllInvestor() {
        List<InvestorInstitutional> result = investorService.getListInstitutionalInvestors();
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/getInstitutionalById/{id}")
    public ResponseEntity<Object> getInvestorById(@PathVariable String id) {
        try {
            return new ResponseEntity<>(investorService.findInstitutionalInvestorById(id), HttpStatus.OK);
        } catch (Exception e) {
            log.error(e.getMessage());
            return new ResponseEntity<>(e.getMessage(), HttpStatus.NOT_FOUND);
        }
    }
}
