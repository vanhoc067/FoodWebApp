/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.service.impl;

import com.dvh.pojo.Orderdetail;
import com.dvh.repository.StoreBillRepository;
import com.dvh.service.StoreBillService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */

@Service
public class StoreBillServiceImpl implements StoreBillService{
    
    @Autowired
    private StoreBillRepository storeBillRepository;

    @Override
    public List<Orderdetail> getBill(Map<String, String> params) {
        return this.storeBillRepository.getBill(params);
    }

    @Override
    public List<Orderdetail> getAllBill() {
        return this.storeBillRepository.getAllBill();
    }

    @Override
    public boolean deleteBill(int id) {
        return this.storeBillRepository.deleteBill(id);
    }
    
}
