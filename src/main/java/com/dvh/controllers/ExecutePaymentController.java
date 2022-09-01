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
public class ExecutePaymentController {
    @RequestMapping(path = "/execute_payment", method = RequestMethod.POST)
    public ModelAndView printHello(@RequestParam(name = "paymentId") String paymentId,
            @RequestParam(name = "PayerID") String payerId) {

        try {
            ModelAndView mav = new ModelAndView("receipt");

            PaymentService paymentService = new PaymentService();
            Payment payment = paymentService.executePayment(paymentId, payerId);
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);

            mav.addObject("payer", payerInfo);
            mav.addObject("transaction", transaction);
            return mav;

        } catch (PayPalRESTException ex) {
            ex.printStackTrace();
            ModelAndView mav = new ModelAndView("success");
            mav.addObject("errorMessage", "Could not execute payment");
            return mav;
        }
    }
}
