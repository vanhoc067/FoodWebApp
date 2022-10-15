/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.repository.impl;

import com.dvh.pojo.Followdetail;
import com.dvh.repository.FollowDetailRepository;
import com.dvh.repository.UserRepository;
import com.dvh.service.UserService;
import java.util.List;
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
public class FollowDetailRepositoryImpl implements FollowDetailRepository{
    
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private UserRepository userRepository;

    @Override
    public List<Followdetail> getListFollow() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Followdetail");
        return q.getResultList();
    }

    @Override
    public boolean addFolower(Followdetail f) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(f);
            return true;
        } catch (Exception ex){
            ex.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteFollow(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            Followdetail f = session.get(Followdetail.class, id);
            session.delete(f);

            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;

        }
    }
    
}
