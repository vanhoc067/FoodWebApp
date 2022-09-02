/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.service.impl;

import com.dvh.pojo.Comment;
import com.dvh.pojo.Store;
import com.dvh.pojo.StoreComment;
import com.dvh.repository.StoreRepository;
import com.dvh.service.StoreService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author thinh
 */
@Service
public class StoreServiceImpl implements StoreService {
    @Autowired
    private StoreRepository storeRepository;
    
    @Override
    public List<Store> getStores() {
        return this.storeRepository.getStores();
    }

    @Override
    public Store getStoreById(int id) {
        return this.storeRepository.getStoreById(id);
    }

    @Override
    public List<StoreComment> getStoreComments(int storeId) {
        return this.storeRepository.getStoreComments(storeId);
    }

    @Override
    public StoreComment addStoreComment(String content, int storeId) {
        return this.storeRepository.addStoreComment(content, storeId);
    }
}
