/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.service.impl;

import com.dvh.pojo.Followdetail;
import com.dvh.repository.FollowDetailRepository;
import com.dvh.service.FollowDetailService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class FollowDetailServiceImpl implements FollowDetailService{
    
    @Autowired
    private FollowDetailRepository followDetailRepository;
    
    @Override
    public List<Followdetail> getListFollow() {
        return this.followDetailRepository.getListFollow();
    }

    @Override
    public boolean addFolower(Followdetail f) {
        return this.followDetailRepository.addFolower(f);
    }

    @Override
    public boolean deleteFollow(int id) {
        return this.followDetailRepository.deleteFollow(id);
    }
    
}
