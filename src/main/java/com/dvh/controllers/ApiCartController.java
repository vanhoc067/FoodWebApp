/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.pojo.Cart;
import com.dvh.service.OrderService;
import com.dvh.utils.Utils;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author thinh
 */
@RestController
public class ApiCartController {
    
    @Autowired
    private OrderService orderService;
    
    @PostMapping("/api/cart")
    public int addToCart(@RequestBody Cart params, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if(cart == null)
            cart = new HashMap<>();
        
        int foodId = params.getFoodId();
        if(cart.containsKey(foodId) == true ) {
            Cart c = cart.get(foodId);
            c.setQuantity(c.getQuantity() + 1);
        } else {
            cart.put(foodId,params);
        }
        session.setAttribute("cart",cart);
        
        return Utils.countCart(cart);
    }
    
    @PutMapping("/api/cart")
    public ResponseEntity<Map<String, String>> updateCartItem(@RequestBody Cart params, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if(cart == null)
            cart = new HashMap<>();
        
        int foodId = params.getFoodId();
        if(cart.containsKey(foodId) == true ) {
            Cart c = cart.get(foodId);
            c.setQuantity(params.getQuantity());
        } else {
            cart.put(foodId,params);
        }
        session.setAttribute("cart",cart);
        
        return new ResponseEntity<>(Utils.cartStats(cart),HttpStatus.OK);
    }
    
    @DeleteMapping("/api/cart/{foodId}")
    public ResponseEntity<Map<String, String>> deleteCartItem(@PathVariable(value = "foodId") int foodId, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if(cart != null && cart.containsKey(foodId)) {
            cart.remove(foodId);
             
            session.setAttribute("cart", cart);
        }
        return new ResponseEntity<>(Utils.cartStats(cart),HttpStatus.OK);
    }
    
    @PostMapping("/api/order")
    public HttpStatus order(HttpSession session) {
        if(this.orderService.addOrder((Map<Integer,Cart>)session.getAttribute("cart")) == true) {
            session.removeAttribute("cart");
            return HttpStatus.OK;
        }
        return HttpStatus.BAD_REQUEST;         
    }
        
}
 