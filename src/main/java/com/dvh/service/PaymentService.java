/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.service;

import com.dvh.dto.OrderDto;
import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author thinh
 */
public class PaymentService {
    private static final String CLIENT_ID = "AZHwP4KlM5lIRS0gq1214lB7oNDinemhZZMzKLUXYSi2VRObbhS8uCsYlCISljDaKbNV6XGrUmaVhlG5";
    private static final String CLIENT_SECRET = "EAVyBnkfKGRyzJgedmIxfj7M231zMZl4fud6LrcTZdZyjfGvbDkeNRoC8Lb6mape8CBERdkDiG3UT7ye";
    private static final String MODE = "sandbox";

    public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
		PaymentExecution paymentExecution = new PaymentExecution();
		paymentExecution.setPayerId(payerId);
		Payment payment = new Payment().setId(paymentId);
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		return payment.execute(apiContext, paymentExecution);
	}
	
	public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		return Payment.get(apiContext, paymentId);
	}
	
	public String authorizePayment(OrderDto orderDetail) throws PayPalRESTException {
		
		Payer payer = getPayerInformation();
		RedirectUrls redirectUrls = getRedirectUrls();
		List<Transaction> transactionList = getTransactionInformation(orderDetail);
		
		Payment requestPayment = new Payment();
		requestPayment.setTransactions(transactionList);
		requestPayment.setRedirectUrls(redirectUrls);
		requestPayment.setPayer(payer);
		requestPayment.setIntent("authorize");
		
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		Payment approvedPayment = requestPayment.create(apiContext);
		
		System.out.println(approvedPayment);
		
		return getApprovalLink(approvedPayment);
	}
	
	private String getApprovalLink(Payment approvedPayment) {
		List<Links> links = approvedPayment.getLinks();
		String approvalLink = null;
		
		for (Links link : links) {
			if (link.getRel().equalsIgnoreCase("approval_url")) {
				approvalLink = link.getHref();
			}
		}
		
		return approvalLink;
	}
	
	private String convertNumberFromGermanToUsFormat(String germanNumber) {
		String usNumber = germanNumber.replace(",", ".");
		return usNumber;
	}
	
	private List<Transaction> getTransactionInformation(OrderDto orderDetail) {
		Details details = new Details();
//		details.setShipping(convertNumberFromGermanToUsFormat(orderDetail.getShipping()));
//                details.setShipping(convertNumberFromGermanToUsFormat(orderDetail.getQuantity()));
		details.setSubtotal(convertNumberFromGermanToUsFormat(orderDetail.getSubtotal()));
                
		Amount amount = new Amount();
		amount.setCurrency("USD");
		amount.setTotal(convertNumberFromGermanToUsFormat(orderDetail.getTotal()));
		amount.setDetails(details);
		System.out.println(amount);
		
		Item item = new Item();
		item.setCurrency("USD");
		item.setName(orderDetail.getProductName());
		item.setPrice(convertNumberFromGermanToUsFormat(orderDetail.getSubtotal()));
		item.setQuantity("1");

		List<Item> items = new ArrayList<Item>();
		items.add(item);
		
		ItemList itemList = new ItemList();
		itemList.setItems(items);
		
		Transaction transaction = new Transaction();
		transaction.setAmount(amount);
		transaction.setDescription(orderDetail.getProductName());
		transaction.setItemList(itemList);
		
		List<Transaction> transactionList = new ArrayList<Transaction>();
		transactionList.add(transaction);
		
		return transactionList;
	}

	private RedirectUrls getRedirectUrls() {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl("http://localhost:8080/FoodWebApp/cancel");
		redirectUrls.setReturnUrl("http://localhost:8080/FoodWebApp/success");
		return redirectUrls;
	}

	private Payer getPayerInformation() {
		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName("van");
		payerInfo.setLastName("hoc");
		payerInfo.setLastName("vanhoc@gmail.com");
		
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");
		payer.setPayerInfo(payerInfo);
		
		return payer;
	}
}
