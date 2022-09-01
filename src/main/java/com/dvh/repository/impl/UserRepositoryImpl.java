/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.repository.impl;

import com.dvh.pojo.User;
import com.dvh.repository.UserRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
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
public class UserRepositoryImpl implements UserRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public User getUserById(int userId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        return session.get(User.class,userId);
    }
    
    @Override
    public boolean addUser(User user) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try{
            s.save(user);
        } catch (HibernateException ex){
            System.err.println(ex.getMessage());
            return false;
        }
        return true;
    }

    @Override
    public List<User> getUsers(String username) {
         Session s = this.sessionFactory.getObject().getCurrentSession();
         CriteriaBuilder builder = s.getCriteriaBuilder();
         CriteriaQuery<User> query = builder.createQuery(User.class);
         Root root = query.from(User.class);
         query = query.select(root);
         
        if(!username.isEmpty()){
            Predicate p = builder.equal(root.get("username").as(String.class), username.trim());
            query = query.where(p);
        }
         
         Query q = s.createQuery(query);
         return q.getResultList();
                 
    }

    @Override
    public List<User> getListUsers(Map<String, String> params) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
         CriteriaBuilder builder = s.getCriteriaBuilder();
         CriteriaQuery<User> query = builder.createQuery(User.class);
         Root root = query.from(User.class);
         query = query.select(root);
         
        if(params != null){
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = builder.like(root.get("username").as(String.class),
                        String.format("%%%s%%", kw));
                predicates.add(p);
            }
        }
         
         Query q = s.createQuery(query);
         return q.getResultList();
    }

    @Override
    public User getUserByUsername(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<User> q = b.createQuery(User.class);
        Root root = q.from(User.class);
        q.select(root);
        
        q.where(b.equal(root.get("username"), username));
        
        Query query = session.createQuery(q);
        return (User) query.getSingleResult();
    }

    @Override
    public boolean deleteUser(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        
        try{
            User user = session.get(User.class, id);
            session.delete(user);
            return true;
        }catch (Exception ex){
            ex.printStackTrace();
            return false;
        }
    }

    
    
}
