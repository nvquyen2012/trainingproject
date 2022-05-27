package com.example.module2.controller;


import com.example.module2.dto.ProductDTO;
import com.example.module2.dto.ProductExcelDTO;
import com.example.module2.service.IProductService;
import com.example.module2.service.impl.ProductExcelExporter;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private IProductService iProductService;


    @GetMapping("")
    public ResponseEntity<ProductDTO> getAllProduct(
//            @RequestParam String fundType,
//                                                    @RequestParam String investmentManager,
//                                                    @RequestParam(name = "curPage", required = false , defaultValue = "1") Integer curPage,
//                                                    @RequestParam(name = "pageSize", required = false , defaultValue = "5") Integer pageSize
                                                    ){
      ProductDTO productDTO = iProductService.getAllProduct();
        return null;
    }

    @GetMapping("/export")
    public void getFile(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=users_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);

        List<ProductExcelDTO> listUsers = iProductService.findAllProduct();

        ProductExcelExporter excelExporter = new ProductExcelExporter(listUsers);

        excelExporter.export(response);
    }


}
