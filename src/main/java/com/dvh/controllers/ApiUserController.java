/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.pojo.User;
import com.dvh.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Administrator
 */
@RestController
@RequestMapping("/api")
public class ApiUserController {
    
    @Autowired
    private UserService userService;
    
    @GetMapping("/user")
    public ResponseEntity<List<User>> list() {
        return new ResponseEntity<>(this.userService.getListUsers(null),HttpStatus.OK);
    }
    
     @DeleteMapping("/user/{userId}")
     @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delateUser(@PathVariable(value = "userId") int id){
        this.userService.deleteUser(id);
    }
}
