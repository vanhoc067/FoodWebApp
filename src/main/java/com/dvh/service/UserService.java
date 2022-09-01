/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dvh.service;

import com.dvh.pojo.User;
import java.util.List;
import java.util.Map;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author thinh
 */
public interface UserService extends UserDetailsService {
    User getUserById(int id);
    boolean addUser(User user);
    List<User> getUsers(String username);
    List<User> getListUsers(Map<String, String> params);
    
    boolean deleteUser(int id);
}
