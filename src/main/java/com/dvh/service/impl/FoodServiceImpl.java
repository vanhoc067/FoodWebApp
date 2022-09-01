  /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.service.impl;

import com.dvh.pojo.Comment;
import com.dvh.pojo.Food;
import com.dvh.repository.FoodRepository;
import com.dvh.service.FoodService;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author thinh
 */
@Service
public class FoodServiceImpl implements FoodService {
    @Autowired
    private FoodRepository foodRepository;

    @Override
    public List<Food> getFoods(Map<String, String> params, int page) {
        return this.foodRepository.getFoods(params, page);
    }

    @Override
    public int countFood() {
        return this.foodRepository.countFood();
    }

    @Override
    public boolean deleteFood(int id) {
        return this.foodRepository.deleteFood(id);
    }

    @Override
    public boolean addFood(Food f) {
        return this.foodRepository.addFood(f);
    }

    @Override
    public Food getFoodById(int id) {
        return this.foodRepository.getFoodById(id);
    }

    @Override
    public List<Object[]> countFoodByCate() {
        return this.foodRepository.countFoodByCate();
    }

    @Override
    public List<Object[]> revenueStats(String kw , Date fromDate, Date toDate) {
        return this.foodRepository.revenueStats(kw, fromDate, toDate);
    }

    @Override
    public List<Comment> getComments(int foodId) {
        return this.foodRepository.getComments(foodId);
    }

    @Override
    public Comment addComment(String content, int foodId) {
        return this.foodRepository.addComment(content, foodId);
    }

    @Override
    public List<Object[]> revenueMonthStats(String kw, Date fromDate, Date toDate) {
        return this.foodRepository.revenueMonthStats(kw, fromDate, toDate);
    }
}
