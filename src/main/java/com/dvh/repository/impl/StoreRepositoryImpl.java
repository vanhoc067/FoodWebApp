/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.repository.impl;

import com.dvh.pojo.Comment;
import com.dvh.pojo.Food;
import com.dvh.pojo.Store;
import com.dvh.pojo.StoreComment;
import com.dvh.pojo.User;
import com.dvh.repository.StoreRepository;
import com.dvh.repository.UserRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
    
    @Autowired
    private UserRepository userRepository;

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

    @Override
    public List<StoreComment> getStoreComments(int storeId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<StoreComment> q = b.createQuery(StoreComment.class);
        Root root = q.from(StoreComment.class);
        q.select(root);
        
        q.where(b.equal(root.get("storeId"), storeId));
        
        org.hibernate.query.Query query = session.createQuery(q);
        
        return query.getResultList();
    }

    @Override
    public StoreComment addStoreComment(String content, int storeId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
         
        StoreComment store = new StoreComment();
        store.setContent(content);
        store.setStoreId(this.getStoreById(storeId));
//        c.setUserId(session.get(User.class,1));
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        store.setUserId(this.userRepository.getUserByUsername(authentication.getName()));
        
        session.save(store);
        return store;
    }
}
