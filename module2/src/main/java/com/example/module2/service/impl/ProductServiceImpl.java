package com.example.module2.service.impl;

import com.example.module2.entity.DataEntity;
import com.example.module2.repository.ProductRepo;
import com.example.module2.service.ProductService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public DataEntity findById(int id) {
        return productRepo.findById(id);
    }
}
