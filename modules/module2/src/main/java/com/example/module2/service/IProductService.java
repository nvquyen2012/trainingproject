package com.example.module2.service;

import com.example.module2.dto.ProductDTO;
import com.example.module2.dto.ProductExcelDTO;

import java.io.ByteArrayInputStream;
import java.util.List;


public interface IProductService {
    ProductDTO getAllProduct();


    List<ProductExcelDTO> findAllProduct();
}
