package com.example.module2.service.impl;

import com.example.module2.dto.ProductDTO;
import com.example.module2.dto.ProductExcelDTO;
import com.example.module2.entity.Data;
import com.example.module2.repository.IProductRepository;
import com.example.module2.service.IProductService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;

@Service
public class ProductServiceImpl implements IProductService {

    @Autowired
    private IProductRepository productRepository;

    @Override
    public ProductDTO getAllProduct() {
        List<Data> data = productRepository.findAll();
        ProductDTO productDTO = new ProductDTO();
        productDTO.setData(data);
        return productDTO;
    }

    @Override
    public List<ProductExcelDTO> findAllProduct() {
        return productRepository.findAllProductExcelDTO();
    }

}
