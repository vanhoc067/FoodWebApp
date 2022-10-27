/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.pojo.User;
import com.dvh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author thinh
 */
@Controller
public class UserController {
    @Autowired
    private UserService userDetailsService;
   
    
    @GetMapping("/login")
    public String login(){
        return "login";
    }
    
    @GetMapping("/register")
    public String registerView(Model model){
        model.addAttribute("user", new User());
        
        return "register";
    }
    
    @PostMapping("/register")
    public String register(Model model,@ModelAttribute(value = "user") User user){
        String errMsg = "";
        if (user.getPassword().equals(user.getConfirmPassword())){
            if(this.userDetailsService.addUser(user) == true)
                return "redirect:/login";
            else
                errMsg = "Da xay ra loi!!";
            
        }else   
            errMsg = "Mat khau sai!!";
        
        model.addAttribute("errMsg", errMsg);
        return "register";
    }

    
}
