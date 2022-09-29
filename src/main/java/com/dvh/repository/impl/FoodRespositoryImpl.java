/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.repository.impl;

import com.dvh.pojo.Category;
import com.dvh.pojo.Comment;
import com.dvh.pojo.Food;
import com.dvh.pojo.FoodOrder;
import com.dvh.pojo.Orderdetail;
import com.dvh.pojo.User;
import com.dvh.repository.FoodRepository;
import com.dvh.repository.UserRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
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
@PropertySource("classpath:messages.properties")
public class FoodRespositoryImpl implements FoodRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;
    
    @Autowired
    private UserRepository userRepository;

    @Override
    public List<Food> getFoods(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Food> q = b.createQuery(Food.class);
        Root root = q.from(Food.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("name").as(String.class),
                        String.format("%%%s%%", kw));
                predicates.add(p);
            }

            String fp = params.get("fromPrice");
            if (fp != null) {
                Predicate p = b.greaterThanOrEqualTo(root.get("price").as(Long.class),
                        Long.parseLong(fp));
                predicates.add(p);
            }

            String tp = params.get("toPrice");
            if (tp != null) {
                Predicate p = b.lessThanOrEqualTo(root.get("price").as(Long.class),
                        Long.parseLong(tp));
                predicates.add(p);
            }

            String cateId = params.get("cateId");
            if (cateId != null) {
                Predicate p = b.equal(root.get("categoryId"), Integer.parseInt(cateId));
                predicates.add(p);
            }
            String storeId = params.get("storeId");
            if (storeId != null) {
                Predicate p = b.equal(root.get("storeId"), Integer.parseInt(storeId));
                predicates.add(p);
            }

            q.where(predicates.toArray(new Predicate[]{}));

        }

        q.orderBy(b.desc(root.get("id")), b.desc(root.get("name")));

        Query query = session.createQuery(q);

        if (page > 0) {
            int size = Integer.parseInt(env.getProperty("page.size").toString());
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);
        }

        return query.getResultList();
    }

    @Override
    public int countFood() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT Count(*) FROM Food");

        return Integer.parseInt(q.getSingleResult().toString());
    }

    @Override
    public boolean deleteFood(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        try {
            Food f = session.get(Food.class, id);
            session.delete(f);

            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;

        }

    }

    @Override
    public boolean addFood(Food f) {
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
    public Food getFoodById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Food.class, id);
    }

    @Override
    public List<Object[]> countFoodByCate() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rF = q.from(Food.class);
        Root rC = q.from(Category.class);

        q.where(b.equal(rF.get("categoryId"), rC.get("id")));
        q.multiselect(rC.get("id"), rC.get("name"), b.count(rF.get("id")));
        q.groupBy(rC.get("id"));

        Query query = session.createQuery(q);
        return query.getResultList();

    }

    @Override
    public List<Object[]> revenueStats(String kw, Date fromDate, Date toDate) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rF = q.from(Food.class);
        Root rD = q.from(Orderdetail.class);
        Root rO = q.from(FoodOrder.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(b.equal(rF.get("id"), rD.get("foodId")));
        predicates.add(b.equal(rO.get("id"), rD.get("orderId")));

        q.multiselect(rF.get("id"), rF.get("name"),
                b.sum(b.prod(rD.get("foodQuantity"), rD.get("unitPrice"))));

        if (kw != null && !kw.isEmpty()) {
            predicates.add(b.like(rF.get("name"), String.format("%%%s%%", kw)));
        }

        if (fromDate != null) {
            predicates.add(b.greaterThanOrEqualTo(rO.get("createdDate"), fromDate));
        }

        if (toDate != null) {
            predicates.add(b.lessThanOrEqualTo(rO.get("createdDate"), toDate));
        }

        q.where(predicates.toArray(new Predicate[]{}));
        q.groupBy(rF.get("id"));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Comment> getComments(int foodId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Comment> q = b.createQuery(Comment.class);
        Root root = q.from(Comment.class);
        q.select(root);

        q.where(b.equal(root.get("foodId"), foodId));

        Query query = session.createQuery(q);

        return query.getResultList();

    }

    @Override
    public Comment addComment(String content, int foodId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();

        Comment c = new Comment();
        c.setContent(content);
        c.setFoodId(this.getFoodById(foodId));
//        c.setUserId(session.get(User.class,1));

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        c.setUserId(this.userRepository.getUserByUsername(authentication.getName()));

        session.save(c);

        return c;

    }

    @Override
    public List<Object[]> revenueMonthStats(String kw, Date fromDate, Date toDate) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rF = q.from(Food.class);
        Root rD = q.from(Orderdetail.class);
        Root rO = q.from(FoodOrder.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(b.equal(rF.get("id"), rD.get("foodId")));
        predicates.add(b.equal(rO.get("id"), rD.get("orderId")));

        q.multiselect(b.function("MONTH", Integer.class, rO.get("createdDate")),
                b.function("YEAR", Integer.class, rO.get("createdDate")),
                b.function("QUARTER", Integer.class, rO.get("createdDate")),
                b.sum(b.prod(rD.get("foodQuantity"), rD.get("unitPrice"))));

        if (kw != null && !kw.isEmpty()) {
            predicates.add(b.like(rF.get("name"), String.format("%%%s%%", kw)));
        }

        if (fromDate != null) {
            predicates.add(b.greaterThanOrEqualTo(rO.get("createdDate"), fromDate));
        }

        if (toDate != null) {
            predicates.add(b.lessThanOrEqualTo(rO.get("createdDate"), toDate));
        }

        q.where(predicates.toArray(new Predicate[]{}));
        q.groupBy(b.function("MONTH", Integer.class, rO.get("createdDate")),
                b.function("YEAR", Integer.class, rO.get("createdDate")),
                b.function("QUARTER", Integer.class, rO.get("createdDate")));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Food> getFoodstore() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Food");
        
        return q.getResultList();
    }
}
