/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.pojo.Food;
import com.dvh.pojo.FoodOrder;
import com.dvh.pojo.User;
import com.dvh.service.FoodService;
import com.dvh.service.UserService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Administrator
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private FoodService foodService;
    
    @Autowired
    private UserService userService;
    
    @GetMapping("/food_admin")
    public String list(Model model, HttpSession session) {
        model.addAttribute("food", new Food());
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        return "food_admin";
    }
    
    @GetMapping("/user")
    public String user(){
        return "user";
    }
    
    @GetMapping("/user_detail/{id}")
    public String user_detail(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("updateUser", new User());
        model.addAttribute("userById", this.userService.getUserById(id));
        model.addAttribute("id", id);
        return "user_detail";
    }
    
    @PostMapping("/user_detail/{id}")
    public String updateUser(Model model, @ModelAttribute(value = "updateUser") @Valid User user, @PathVariable(value = "id") int id, BindingResult r) {
        if (!r.hasErrors()){
            if (this.userService.updateUser(user, id) == true){
            return "redirect:/admin/user";
            }
        } 
//        return "redirect:/admin/user";
        return "user_detail/{id}";
    }
    
    
    @GetMapping("/stats")
    public String stats(Model model,@RequestParam(required = false) Map<String, String> params ) throws ParseException{
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String kw = params.getOrDefault("kw", null);
        
        Date fromDate = null;
        Date toDate = null;
        
        try {
            String from = params.getOrDefault("fromDate", null);
            if (from != null) {
                fromDate = f.parse(from);
            }

            String to = params.getOrDefault("toDate", null);
            if (to != null)
                toDate = f.parse(to);
        } catch(ParseException ex) {
            ex.printStackTrace();
        }
        
              
        
        model.addAttribute("catStats", this.foodService.countFoodByCate());
        model.addAttribute("revenueStats", this.foodService.revenueStats(kw,fromDate,toDate));
 
        return "admin_stats";
    }
    @GetMapping("/month-stats")
    public String monthStats(Model model,@RequestParam(required = false) Map<String, String> params) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String kw = params.getOrDefault("kw", null);
        
        Date fromDate = null;
        Date toDate = null;
        
        try {
            String from = params.getOrDefault("fromDate", null);
            if (from != null) {
                fromDate = f.parse(from);
            }

            String to = params.getOrDefault("toDate", null);
            if (to != null)
                toDate = f.parse(to);
        } catch(ParseException ex) {
            ex.printStackTrace();
        }
        
        model.addAttribute("revenueMonthStats", this.foodService.revenueMonthStats(kw,fromDate,toDate)); 
        
        return "month-stats";
    }
}
