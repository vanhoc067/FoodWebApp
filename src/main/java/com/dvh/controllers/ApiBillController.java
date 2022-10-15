/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.pojo.Orderdetail;
import com.dvh.service.BillService;
import com.dvh.service.StoreBillService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Administrator
 */
@RestController
@RequestMapping("/api")
public class ApiBillController {
    @Autowired
    private StoreBillService storeBillService;
    
    @GetMapping("/bill")
    public ResponseEntity<List<Orderdetail>> list() {
        return new ResponseEntity<>(this.storeBillService.getAllBill(),HttpStatus.OK);
    }
}
