/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.service.PaymentService;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author thinh
 */
@Controller
public class ReviewPaymentController {
    @RequestMapping(path = "/review_payment", method = RequestMethod.GET)
    public ModelAndView printHello(@RequestParam(name = "paymentId") String paymentId,
            @RequestParam(name = "PayerID") String payerId) {

        try {
            ModelAndView mav = new ModelAndView("review");

            PaymentService paymentService = new PaymentService();
            Payment payment = paymentService.getPaymentDetails(paymentId);

            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();

            mav.addObject("payer", payerInfo);
            mav.addObject("transaction", transaction);
            mav.addObject("shippingAddress", shippingAddress);
            return mav;

        } catch (PayPalRESTException ex) {
            ex.printStackTrace();
            ModelAndView mav = new ModelAndView("cancel");
            mav.addObject("errorMessage", "Could not get payment details");
            return mav;
        }
    }
}
