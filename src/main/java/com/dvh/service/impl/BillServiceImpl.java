/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.service.impl;

import com.dvh.pojo.FoodOrder;
import com.dvh.pojo.Orderdetail;
import com.dvh.repository.BillRepository;
import com.dvh.service.BillService;
import java.util.List;
import java.util.Map;
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
    public List<FoodOrder> getBill(Map<String, String> params) {
        return this.billRepository.getBill(params);
    }

    @Override
    public FoodOrder getBillById(int id) {
        return this.billRepository.getBillById(id);
    }

    @Override
    public boolean checkPay(FoodOrder f, int id) {
        return this.billRepository.checkPay(f,id);
    }
    
}
