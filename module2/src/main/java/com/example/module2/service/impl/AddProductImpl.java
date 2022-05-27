package com.example.module2.service.impl;

import com.example.module2.dto.*;
import com.example.module2.entity.*;
import com.example.module2.repository.*;
import com.example.module2.service.*;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class AddProductImpl implements DataService, AssetAllocationService, InstitutionService, InstrumentService, InvestmentManagerService, NavService, ReturnInfoService {

    @Autowired
    private DataRepo productRepo;

    @Autowired
    private AssetAllocationRepo assetAllocationRepo;

    @Autowired
    private InstitutionRepo institutionRepo;

    @Autowired
    private InstrumentRepo instrumentRepo;

    @Autowired
    private InvestmentManagerRepo investmentManagerRepo;

    @Autowired
    private NavRepo navRepo;

    @Autowired
    private ReturnInfoRepo returnInfoRepo;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public DataEntity findById(int id) {
        return productRepo.findById(id).orElse(null);
    }

    @Override
    public List<DataDTO> findAllData() {
        List<DataEntity> dataEntities = productRepo.findAll();
        List<DataDTO> dataList = dataEntities.stream().map(data -> modelMapper.map(data, DataDTO.class))
                .collect(Collectors.toList());
        return dataList;
    }

    @Override
    public DataDTO saveData(DataDTO dataDTO) {
        DataEntity dataEntity = modelMapper.map(dataDTO, DataEntity.class);
        DataEntity model = productRepo.save(dataEntity);
        return modelMapper.map(model, DataDTO.class);
    }

    @Override
    public AssetAllocationDTO saveAssetAllocation(AssetAllocationDTO assetAllocationDTO) {
        AssetAllocationEntity assetAllocationEntity = modelMapper.map(assetAllocationDTO, AssetAllocationEntity.class);
        AssetAllocationEntity model = assetAllocationRepo.save(assetAllocationEntity);
        return modelMapper.map(model, AssetAllocationDTO.class);
    }

    @Override
    public InstitutionDTO saveInstitution(InstitutionDTO institutionDTO) {
        InstitutionEntity institutionEntity = modelMapper.map(institutionDTO, InstitutionEntity.class);
        InstitutionEntity model = institutionRepo.save(institutionEntity);
        return modelMapper.map(model, InstitutionDTO.class);
    }

    @Override
    public InstrumentDTO saveInstrument(InstrumentDTO instrumentDTO) {
        InstrumentEntity instrumentEntity = modelMapper.map(instrumentDTO, InstrumentEntity.class);
        InstrumentEntity model = instrumentRepo.save(instrumentEntity);
        return modelMapper.map(model, InstrumentDTO.class);
    }

    @Override
    public InvestmentManagerDTO saveInvestment(InvestmentManagerDTO investmentManagerDTO) {
        InvestmentManagerEntity investmentManagerEntity = modelMapper.map(investmentManagerDTO, InvestmentManagerEntity.class);
        InvestmentManagerEntity model = investmentManagerRepo.save(investmentManagerEntity);
        return modelMapper.map(model, InvestmentManagerDTO.class);
    }

    @Override
    public NavDTO saveNav(NavDTO navDTO) {
        NavEntity navEntity = modelMapper.map(navDTO, NavEntity.class);
        NavEntity model = navRepo.save(navEntity);
        return modelMapper.map(model, NavDTO.class);
    }

    @Override
    public ReturnInfoDTO saveReturnInfo(ReturnInfoDTO returnInfoDTO) {
        ReturnInfoEntity returnInfoEntity = modelMapper.map(returnInfoDTO, ReturnInfoEntity.class);
        ReturnInfoEntity model = returnInfoRepo.save(returnInfoEntity);
        return modelMapper.map(model, ReturnInfoDTO.class);
    }
}
