/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.pojo.Cart;
import com.dvh.pojo.Followdetail;
import com.dvh.service.CategoryService;
import com.dvh.service.FollowDetailService;
import com.dvh.service.FoodService;
import com.dvh.service.StoreService;
import com.dvh.utils.Utils;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Administrator
 */
@Controller
@ControllerAdvice
@PropertySource("classpath:messages.properties")
public class IndexController {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private FoodService foodService;
    @Autowired
    private StoreService storeService;
    @Autowired
    private Environment env;
    

    @ModelAttribute
    public void commonAttr(Model model, HttpSession session) {
        model.addAttribute("categories", this.categoryService.getCategories());
        model.addAttribute("stores", this.storeService.getStores());
        model.addAttribute("cartCounter", Utils.countCart((Map<Integer, Cart>) session.getAttribute("cart")));
    }

    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params, HttpSession session) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));

        model.addAttribute("stores", this.storeService.getStores());
        model.addAttribute("foods", this.foodService.getFoods(params, page));
        model.addAttribute("foodCounter", this.foodService.countFood());
        model.addAttribute("pageSize", Integer.parseInt(env.getProperty("page.size")));
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        
        model.addAttribute("api", env.getProperty("firebaseConfig.apiKey"));
        model.addAttribute("aut", env.getProperty("firebaseConfig.authDomain"));
        model.addAttribute("data", env.getProperty("firebaseConfig.databaseURL"));
        model.addAttribute("pro", env.getProperty("firebaseConfig.projectId"));
        model.addAttribute("sto", env.getProperty("firebaseConfig.storageBucket"));
        model.addAttribute("mes", env.getProperty("firebaseConfig.messagingSenderId"));
        model.addAttribute("app", env.getProperty("firebaseConfig.appId"));


        return "index";
    }

    
    
}
