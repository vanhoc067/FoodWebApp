/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.service.impl;

import com.dvh.pojo.Bill;
import com.dvh.pojo.Orderdetail;
import com.dvh.repository.BillRepository;
import com.dvh.service.BillService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class BillServiceImpl implements BillService{

    @Autowired
    private BillRepository billRepository;
    
    @Override
    public List<Orderdetail> getBill() {
        return this.billRepository.getBill();
    }

    @Override
    public Orderdetail getBillById(int id) {
        return this.billRepository.getBillById(id);
    }
    
}