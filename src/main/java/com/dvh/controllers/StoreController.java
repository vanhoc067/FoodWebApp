/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.service.FoodService;
import com.dvh.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 *
 * @author thinh
 */
@Controller
@ControllerAdvice
public class StoreController {
    @Autowired
    private StoreService storeService;
    
    @GetMapping("/store-detail/{storeId}")
    public String detail(Model model, @PathVariable(value = "storeId") int storeId) {
        model.addAttribute("store", this.storeService.getStoreById(storeId));
        return "store-detail";
    }
}
