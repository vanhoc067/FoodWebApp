/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dvh.service;

import com.dvh.pojo.Followdetail;
import java.util.List;

/**
 *
 * @author Administrator
 */
public interface FollowDetailService {
    List<Followdetail> getListFollow();
    boolean addFolower(Followdetail f);
    boolean deleteFollow(int id);
}
