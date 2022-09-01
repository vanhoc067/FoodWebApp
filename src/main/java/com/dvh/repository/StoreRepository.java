/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dvh.repository;

import com.dvh.pojo.Comment;
import com.dvh.pojo.Store;
import java.util.List;

/**
 *
 * @author thinh
 */
public interface StoreRepository {
    List<Store> getStores();
    Store getStoreById(int id);
}
