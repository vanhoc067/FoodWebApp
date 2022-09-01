/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.service.CategoryService;
import com.dvh.service.FoodService;
import com.dvh.service.StoreService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author thinh
 */
@Controller
@ControllerAdvice
public class FoodController {

    @Autowired
    private FoodService foodService;
    @Autowired
    private Environment env;
    
    @GetMapping("/food-detail/{foodId}")
    public String detail(Model model, @PathVariable(value = "foodId") int foodId) {
        model.addAttribute("food", this.foodService.getFoodById(foodId));
        return "food-detail";
    }
}
