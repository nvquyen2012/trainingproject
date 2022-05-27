package com.example.module2.controller;

import com.example.module2.dto.*;
import com.example.module2.entity.DataEntity;
import com.example.module2.repository.DataRepo;
import com.example.module2.service.*;
import com.sipios.springsearch.anotation.SearchSpec;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private DataService dataService;
    @Autowired
    private InstitutionService institutionService;
    @Autowired
    private AssetAllocationService assetAllocationService;
    @Autowired
    private InstrumentService instrumentService;
    @Autowired
    private InvestmentManagerService investmentManagerService;
    @Autowired
    private NavService navService;
    @Autowired
    private ReturnInfoService returnInfoService;
    @Autowired
    private DataRepo dataRepo;


    @GetMapping(value = "/showProduct")
    public List<DataDTO> showData() {
        return dataService.findAllData();
    }

//    @GetMapping("/searchProduct")
//    public ResponseEntity<List<DataEntity>> searchForStudent(@SearchSpec Specification<DataEntity> specs) {
//        return new ResponseEntity(dataRepo.findAll(Specification.where(specs)), HttpStatus.OK);
//    }

    @GetMapping("/getProduct/{id}")
    public ResponseEntity<DataEntity> getProduct(@PathVariable(name = "id") int id) {
        return new ResponseEntity(dataService.findById(id), HttpStatus.OK);
    }

    @PostMapping(value = "/data")
    public DataDTO addData(@RequestBody DataDTO dataDTO) {
        DataDTO result = dataService.saveData(dataDTO);
        return result;
    }

    @PostMapping(value = "/institution")
    public InstitutionDTO addInstitution(@RequestBody InstitutionDTO institutionDTO) {
        InstitutionDTO result = institutionService.saveInstitution(institutionDTO);
        return result;
    }

    @PostMapping(value = "/assetAllocation")
    public AssetAllocationDTO addAssetAllocation(@RequestBody AssetAllocationDTO assetAllocationDTO) {
        AssetAllocationDTO result = assetAllocationService.saveAssetAllocation(assetAllocationDTO);
        return result;
    }

    @PostMapping(value = "/Instrument")
    public InstrumentDTO addInstrument(@RequestBody InstrumentDTO instrumentDTO) {
        InstrumentDTO result = instrumentService.saveInstrument(instrumentDTO);
        return result;
    }

    @PostMapping(value = "/InvestmentManager")
    public InvestmentManagerDTO addInvestmentManager(@RequestBody InvestmentManagerDTO investmentManagerDTO) {
        InvestmentManagerDTO result = investmentManagerService.saveInvestment(investmentManagerDTO);
        return result;
    }

    @PostMapping(value = "/Nav")
    public NavDTO addData(@RequestBody NavDTO navDTO) {
        NavDTO result = navService.saveNav(navDTO);
        return result;
    }

    @PostMapping(value = "/ReturnInfo")
    public ReturnInfoDTO addReturnInfo(@RequestBody ReturnInfoDTO returnInfoDTO) {
        ReturnInfoDTO result = returnInfoService.saveReturnInfo(returnInfoDTO);
        return result;
    }
}
