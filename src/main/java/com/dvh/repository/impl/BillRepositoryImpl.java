/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.repository.impl;

import com.dvh.pojo.Bill;
import com.dvh.pojo.Orderdetail;
import com.dvh.repository.BillRepository;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Administrator
 */
@Repository
@Transactional
public class BillRepositoryImpl implements BillRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<Orderdetail> getBill() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Orderdetail");
        
        return q.getResultList();
    }

    @Override
    public Orderdetail getBillById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Orderdetail.class, id);
    }
    
}
