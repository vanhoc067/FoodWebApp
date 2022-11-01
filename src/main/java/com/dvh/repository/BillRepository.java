/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dvh.repository;

import com.dvh.pojo.FoodOrder;
import com.dvh.pojo.Orderdetail;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Administrator
 */
public interface BillRepository {
    List<FoodOrder> getBill(Map<String, String> params);
    FoodOrder getBillById(int id);
    Orderdetail getOrderById(int id);
    boolean checkPay(FoodOrder  f, int id);
    boolean billDetail(Orderdetail  o, int id);
}
