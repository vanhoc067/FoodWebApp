/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.pojo.Comment;
import com.dvh.pojo.Followdetail;
import com.dvh.service.FollowDetailService;
import com.dvh.utils.Utils;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Administrator
 */
@RestController
@RequestMapping("/api")
public class ApiFollowDetailController {
    
    @Autowired
    private FollowDetailService followDetailService;
    
    @GetMapping("/follow")
    public ResponseEntity<List<Followdetail>> list() {
        return new ResponseEntity<>(this.followDetailService.getListFollow(),HttpStatus.OK);
    }
    
    @DeleteMapping("/follow/{followId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "followId") int id) {
        this.followDetailService.deleteFollow(id);
        
    }
    
//    @PostMapping("/follow")
//    public ResponseEntity<Followdetail> addFollow(@RequestBody Map<String, String> params) {
//        int followId = Integer.parseInt(params.get("followId"));
//        
//        Followdetail f = this.followDetailService.addFollow(followId);
//        
//        return new ResponseEntity<>(f,HttpStatus.CREATED);
//    }
}
