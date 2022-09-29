/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.repository.impl;

import com.dvh.pojo.FoodOrder;
import com.dvh.pojo.Orderdetail;
import com.dvh.pojo.User;
import com.dvh.repository.BillRepository;
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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
    public List<FoodOrder> getBill(Map<String, String> params) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<FoodOrder> q = b.createQuery(FoodOrder.class);
        Root root = q.from(FoodOrder.class);
        q.select(root);
        
//        CriteriaQuery<Object[]> q1 = b.createQuery(Object[].class);
//        Root rO = q1.from(FoodOrder.class);
//        Root rU = q1.from(User.class);
//        List<Predicate> predicates1 = new ArrayList<>();
//        predicates1.add(b.equal(rO.get("userId"), rU.get("id")));
//        predicates1.add(b.like(rU.get("username"), idd));
//        q1.where(predicates1.toArray(new Predicate[]{}));
//        q1.multiselect(rU.get("id"));
//        
        
            List<Predicate> predicates = new ArrayList<>();
//            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//            String idd = authentication.getName();
//            
//            String id = "7";
//            if (id != null) {
//                Predicate p = b.equal(root.get("userId"), Integer.parseInt(id));
//                predicates.add(p);
//            }

            q.where(predicates.toArray(new Predicate[]{}));

//        }
        q.orderBy(b.asc(root.get("id")));

        Query query = s.createQuery(q);
     return query.getResultList();
        
//        return q.getResultList();
    }

    @Override
    public Orderdetail getBillById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Orderdetail.class, id);
    }
    
}
