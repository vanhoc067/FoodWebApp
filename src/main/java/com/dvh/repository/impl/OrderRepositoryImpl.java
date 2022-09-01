/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.repository.impl;

import com.dvh.pojo.Cart;
import com.dvh.pojo.FoodOrder;
import com.dvh.pojo.Orderdetail;
import com.dvh.repository.FoodRepository;
import com.dvh.repository.OrderRepository;
import com.dvh.repository.UserRepository;
import com.dvh.utils.Utils;
import java.util.Date;
import java.util.Map;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Administrator
 */
@Repository
public class OrderRepositoryImpl implements OrderRepository{

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private FoodRepository foodRepository;
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public boolean addOrder(Map<Integer, Cart> cart) {
        try {
            Session session = this.sessionFactory.getObject().getCurrentSession();
            FoodOrder order = new FoodOrder();
             Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            order.setUserId(this.userRepository.getUserByUsername(authentication.getName()));
            order.setCreatedDate(new Date());

            Map<String, String> stats = Utils.cartStats(cart);
            order.setAmount(Long.parseLong(stats.get("amount")));
            session.save(order);
            for (Cart c : cart.values()) {
                Orderdetail d = new Orderdetail();

                d.setOrderId(order);
                d.setFoodId(this.foodRepository.getFoodById(c.getFoodId()));
                d.setUnitPrice(c.getPrice());
                d.setFoodQuantity(c.getQuantity());

                session.save(d);
            }
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }
}
