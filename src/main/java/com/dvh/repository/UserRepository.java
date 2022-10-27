/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dvh.repository;

import com.dvh.pojo.Followdetail;
import com.dvh.pojo.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author thinh
 */
public interface UserRepository {
    User getUserById(int userId);
    boolean addUser(User user);
    List<User> getUsers(String username);
    List<User> getListUsers(Map<String, String> params);
    boolean deleteUser(int id);
    boolean updateUser(User user, int id);
    
    User getUserByUsername(String username);
}
