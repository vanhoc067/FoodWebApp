/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.pojo.Followdetail;
import com.dvh.pojo.Food;
import com.dvh.pojo.FoodOrder;
import com.dvh.pojo.Orderdetail;
import com.dvh.pojo.User;
import com.dvh.service.BillService;
import com.dvh.service.FollowDetailService;
import com.dvh.service.FoodService;
import com.dvh.service.StoreBillService;
import com.dvh.service.StoreService;
import com.dvh.service.UserService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
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
 * @author thinh
 */
@Controller
@RequestMapping("/store")
public class FoodManageController {
    
    @Autowired
    private FoodService foodService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    MailSender mailSender;
    
    @Autowired
    private StoreService storeService;
    
    @Autowired
    private StoreBillService storeBillService;
    
    @Autowired
    private FollowDetailService followDetailService;
    
    @Autowired
    private BillService billService;
    
    @GetMapping("/store_bill")
    public String listbill(Model model,@RequestParam Map<String, String> params, HttpSession session) {
        Boolean check = false;
        model.addAttribute("bill", this.storeBillService.getBill(params));
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        
        return "store_bill";
    }
    
    @GetMapping("/followdetail")
    public String listfollow(Model model, HttpSession session) {
        Boolean check = false;
        model.addAttribute("stores", this.storeService.getStores());
        model.addAttribute("follow", this.followDetailService.getListFollow());
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        model.addAttribute("check", check);
        
        return "followdetail";
    }
    
    
    @GetMapping("/food")
    public String list(Model model, HttpSession session) {
        Boolean check = false;
        
        model.addAttribute("foodList", this.foodService.getFoodstore());
        model.addAttribute("food", new Food());
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        model.addAttribute("check", check);
        
        return "food";
    }
    @PostMapping(value = "/food", produces="application/x-www-form-urlencoded;charset=UTF-8")
    public String add(Model model, @RequestParam Map<String, String> params, @ModelAttribute(value = "food") @Valid Food f, BindingResult r) {
        if (r.hasErrors()){
            return "food";
        } 
        
        if (this.foodService.addFood(f) == true){
            List<Followdetail> folow = followDetailService.getListFollow();
            for(int i = 0; i<folow.size(); i++){
                String email = folow.get(i).getEmail();
                String content = folow.get(i).getFollowId().getContent();
                senEmail("healthyfood047@gmail.com", email, content, "Chung toi vua co 1 mon an moi, co the ban se thich.");
            }
            return "redirect:/";
            }
        
        
        return "food";
    }
    
    @GetMapping("/fooddetail")
    public String foodDetail(Model model, @RequestParam Map<String, String> params, HttpSession session) {
        String id = params.toString();
        id = id.replaceAll("[={}]", "");
        Integer intId = Integer.parseInt(id);
        model.addAttribute("foodDetail", this.foodService.getFoodById(intId));
        model.addAttribute("updateFood", new Food());
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        model.addAttribute("foodID", intId);
        return "fooddetail";
    }
    
    @PostMapping("/fooddetail/{foodID}")
    public String updateFood(Model model, @RequestParam Map<String, String> params, @ModelAttribute(value = "updateFood") @Valid Food food, @PathVariable(value = "foodID") int foodID, BindingResult r) {
        if (r.hasErrors()){
            return "fooddetail";
        } 
        if (this.foodService.updateUser(food, foodID) == true){
            return "redirect:/store/food";
            }
        
        
        return "fooddetail";
    }
    
    @GetMapping("/billstoredetail")
    public String billdetail(Model model, @RequestParam Map<String, String> params, HttpSession session) {
        String id = params.toString();
        id = id.replaceAll("[={}]", "");
        Integer intId = Integer.parseInt(id);
        model.addAttribute("billDetail", this.billService.getOrderById(intId));
        model.addAttribute("updateBill", new Orderdetail());
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        model.addAttribute("billID", intId);
        return "billstoredetail";
    }
    
    @PostMapping("/billstoredetail/{billID}")
    public String updateBill(Model model, @RequestParam Map<String, String> params, @ModelAttribute(value = "updateBill") @Valid Orderdetail o, @PathVariable(value = "billID") int billID, BindingResult r) {
        if (r.hasErrors()){
            return "billstoredetail";
        } 
        if (this.billService.billDetail(o, billID) == true){
            return "redirect:/store/store_bill";
            }
        
        
        return "billstoredetail";
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
 
        return "stats";
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
    
    public void senEmail(String from, String to, String subject, String content) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(from);
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);

        mailSender.send(mailMessage);
    }
    
    
}

