package com.example.module2.service;


import com.example.module2.dto.DataDTO;
import com.example.module2.entity.DataEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface DataService {
    DataEntity findById(int id);

    DataDTO saveData(DataDTO dataDTO);

    List<DataDTO> findAllData();

}
