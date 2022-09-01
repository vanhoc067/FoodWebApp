/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dvh.repository;

import com.dvh.pojo.Cart;
import java.util.Map;

/**
 *
 * @author Administrator
 */
public interface OrderRepository {
     boolean addOrder(Map<Integer,Cart> cart);
}
