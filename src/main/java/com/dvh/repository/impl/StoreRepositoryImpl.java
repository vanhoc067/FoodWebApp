/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.repository.impl;

import com.dvh.pojo.Comment;
import com.dvh.pojo.Food;
import com.dvh.pojo.Store;
import com.dvh.pojo.User;
import com.dvh.repository.StoreRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author thinh
 */
@Repository
@Transactional
public class StoreRepositoryImpl implements StoreRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Store> getStores() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Store");
        
        return q.getResultList();
    }

    @Override
    public Store getStoreById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Store.class,id);
    }
}
