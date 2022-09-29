/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dvh.service;

import com.dvh.pojo.Comment;
import com.dvh.pojo.Food;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 *
 * @author thinh
 */
public interface FoodService {
    List<Food> getFoods(Map<String, String> params, int page);
    Food getFoodById(int id);
    int countFood();
    boolean deleteFood(int id);
    boolean addFood(Food f);
    List<Object[]> countFoodByCate();
    List<Object[]> revenueStats(String kw, Date fromDate, Date toDate);
    List<Object[]> revenueMonthStats(String kw, Date fromDate, Date toDate);
    List<Comment> getComments(int foodId);
    Comment addComment(String content, int foodId);
    List<Food> getFoodstore();
}
