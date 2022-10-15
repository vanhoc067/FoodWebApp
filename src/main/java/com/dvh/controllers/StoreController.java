/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.pojo.Followdetail;
import com.dvh.service.FollowDetailService;
import com.dvh.service.FoodService;
import com.dvh.service.StoreService;
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
 * @author thinh
 */
@Controller
@ControllerAdvice
public class StoreController {
    @Autowired
    private StoreService storeService;
    
    @Autowired
    private FollowDetailService followDetailService;
    
    @GetMapping("/store-detail/{storeId}")
    public String detail(Model model, @PathVariable(value = "storeId") int storeId, HttpSession session) {
        model.addAttribute("store", this.storeService.getStoreById(storeId));
        model.addAttribute("followdetail", new Followdetail());
        model.addAttribute("follow", this.followDetailService.getListFollow());
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        return "store-detail";
    }
    
    @PostMapping("/store-detail/{storeId}")
    public String addFollow(Model model, @ModelAttribute(value = "followdetail") @Valid Followdetail f, BindingResult r) {
         
        
        if (this.followDetailService.addFolower(f) == true){
            return "redirect:/";
            }
        
        
        return "store-detail";
    }
}
