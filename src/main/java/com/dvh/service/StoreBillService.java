/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dvh.service;

import com.dvh.pojo.Orderdetail;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Administrator
 */
public interface StoreBillService {
    List<Orderdetail> getBill(Map<String, String> params);
}
