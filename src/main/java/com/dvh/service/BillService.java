/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dvh.service;

import com.dvh.pojo.Bill;
import com.dvh.pojo.Orderdetail;
import java.util.List;

/**
 *
 * @author Administrator
 */
public interface BillService {
    List<Orderdetail> getBill();
    Orderdetail getBillById(int id);
}