/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.service.BillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 *
 * @author Administrator
 */
@Controller
@ControllerAdvice
public class BillController {
    @Autowired
    private BillService billService;
    
    @GetMapping("/bill")
    public String bill(Model model) {
        model.addAttribute("bill", this.billService.getBill());
        return "bill";
    }
    
    @GetMapping("/bill_detail/{billId}")
    public String detail(Model model,@PathVariable(value = "billId") int billId){
        model.addAttribute("bill", this.billService.getBillById(billId));
        return "bill_detail";
    }
}
