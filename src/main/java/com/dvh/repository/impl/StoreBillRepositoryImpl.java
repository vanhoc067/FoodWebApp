/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.repository.impl;

import com.dvh.pojo.FoodOrder;
import com.dvh.pojo.Orderdetail;
import com.dvh.repository.StoreBillRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
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
public class StoreBillRepositoryImpl implements StoreBillRepository{
    
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<Orderdetail> getBill(Map<String, String> params) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Orderdetail> q = b.createQuery(Orderdetail.class);
        Root root = q.from(Orderdetail.class);
        q.select(root);
        
            List<Predicate> predicates = new ArrayList<>();


            q.where(predicates.toArray(new Predicate[]{}));

        q.orderBy(b.asc(root.get("id")));

        Query query = s.createQuery(q);
     return query.getResultList();
    }
    
}
