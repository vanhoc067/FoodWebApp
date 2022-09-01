/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.dto.OrderDto;
import com.dvh.service.PaymentService;
import com.paypal.base.rest.PayPalRESTException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author thinh
 */
@Controller
public class AuthPaymentController {
    @GetMapping("/success")
    public String success() {
        return "success";
    }

    @RequestMapping(path = "/bill_detail/authorize_payment", method = RequestMethod.POST)
    public ModelAndView printHello(@RequestParam String product,
            @RequestParam String subtotal,
//            @RequestParam String shipping,
//            @RequestParam String quantity,
            @RequestParam String total) {

        OrderDto orderDetail = new OrderDto(product, subtotal, total);
        System.out.println(orderDetail);

        try {
            PaymentService paymentService = new PaymentService();
            String approvalLink = paymentService.authorizePayment(orderDetail);
            ModelAndView mav = new ModelAndView("redirect:" + approvalLink);
            return mav;
        } catch (PayPalRESTException ex) {
            ex.printStackTrace();
            ModelAndView mav = new ModelAndView("cancel");
            mav.addObject("errorMessage", "Could not execute payment");
            return mav;
        }
    }
}
