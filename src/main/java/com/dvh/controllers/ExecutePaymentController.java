/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.service.PaymentService;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author thinh
 */
@Controller
public class ExecutePaymentController {
    
//     @GetMapping("/success/{billId}")
//    public String success(@PathVariable(value = "billId") int billId) {
//        return "success";
//    }
//    
    @RequestMapping(path = "/execute_payment", method = RequestMethod.POST)
//    public ModelAndView printHello(@RequestParam(name = "paymentId") String paymentId,
//            @RequestParam(name = "PayerID") String payerId) {
//
//        try {
//            PaymentService paymentService = new PaymentService();
//            Payment payment = paymentService.executePayment(paymentId, payerId);
//            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
//            Transaction transaction = payment.getTransactions().get(0);
////            String transaction = "helloooooo";
//            
//            ModelAndView mav = new ModelAndView("bill");
//            mav.addObject("payer", payerInfo);
//            mav.addObject("transaction", transaction);
//            mav.addObject("testtt", "hello!!!");
//            return mav;
//
//        } catch (PayPalRESTException ex) {
//            ex.printStackTrace();
//            ModelAndView mav = new ModelAndView("cancel");
//            mav.addObject("errorMessage", "Could not execute payment");
//            return mav;
//        }
//    }
    
    public ModelAndView printHello() {

//            String transaction = "helloooooo";
            
            ModelAndView mav = new ModelAndView("bill");
            mav.addObject("checkPay", "true");
            return mav;

    }
    
//    @GetMapping("/success")
//    public String test(Model model) {
//        Boolean check = true;
//        model.addAttribute("check", check);
//        
//        return "success";
//    }
}
