/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.pojo.Food;
import com.dvh.pojo.FoodOrder;
import com.dvh.service.BillService;
import static com.google.common.io.Files.map;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String bill(Model model, @RequestParam Map<String, String> params, HttpSession session) {
        Boolean check = false;
        String p = params.toString();
        p = p.replaceAll("[={}]", "");
        model.addAttribute("bill", this.billService.getBill(params));
        model.addAttribute("foodOrder", new FoodOrder());
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        model.addAttribute("check", check);
        model.addAttribute("testID", p);
        
        return "bill";
    }
    
    @GetMapping("/bill_detail/{billId}")
    public String detail(Model model,@PathVariable(value = "billId") int billId){
        model.addAttribute("bill", this.billService.getBillById(billId));
        return "bill_detail";
    }
    
    @PostMapping("/success/{testID}")
    public String add(Model model, @RequestParam Map<String, String> params, @ModelAttribute(value = "foodOrder") @Valid FoodOrder f, @PathVariable(value = "testID") int testID, BindingResult r) {
        if (r.hasErrors()){
            return "success";
        } 
        
        if (this.billService.checkPay(f, testID) == true){
            return "redirect:/bill";
            }
        
        
        return "success";
    }
}
