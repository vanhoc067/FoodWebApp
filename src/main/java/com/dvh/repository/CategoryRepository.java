/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dvh.repository;

import com.dvh.pojo.Category;
import java.util.List;

/**
 *
 * @author Administrator
 */
public interface CategoryRepository {
    List<Category> getCategories();
}
