package com.example.module3.controller;

import com.example.module3.service.InvestorService;
import com.example.trainingbase.dto.InvestorStatusDto;
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
}
