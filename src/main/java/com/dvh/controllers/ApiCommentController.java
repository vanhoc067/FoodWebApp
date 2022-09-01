/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.pojo.Comment;
import com.dvh.service.FoodService;
import com.dvh.service.StoreService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author thinh
 */
@RestController
@RequestMapping("/api")
public class ApiCommentController {
    @Autowired
    private FoodService foodService;
    @Autowired
    private StoreService storeService;
    
    @GetMapping("/food/{foodId}/comments")
    public ResponseEntity<List<Comment>> getComments(@PathVariable(value = "foodId") int id) {
        return new ResponseEntity<>(this.foodService.getComments(id), HttpStatus.OK);
    }
    
    @PostMapping(path = "/food/{foodId}/comments", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comment> addComment(@RequestBody Map<String, String> params) {
        String content = params.get("content");
        int foodId = Integer.parseInt(params.get("foodId"));
        
        Comment c = this.foodService.addComment(content, foodId);
        
        return new ResponseEntity<>(c,HttpStatus.CREATED);
    }
    
    
    
    
}
    
    

