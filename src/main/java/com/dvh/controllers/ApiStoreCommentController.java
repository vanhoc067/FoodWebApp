/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.controllers;

import com.dvh.pojo.StoreComment;
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
 * @author Administrator
 */
@RestController
@RequestMapping("/api")
public class ApiStoreCommentController {
    @Autowired
    private StoreService storeService;
    
    
    @GetMapping("/store-detail/{storeId}/comments")
    public ResponseEntity<List<StoreComment>> getComments(@PathVariable(value = "storeId") int id) {
        return new ResponseEntity<>(this.storeService.getStoreComments(id), HttpStatus.OK);
    }
    
    @PostMapping(path = "/store-detail/{storeId}/comments", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<StoreComment> addComment(@RequestBody Map<String, String> params ) {
        String content = params.get("content");
        int storeId = Integer.parseInt(params.get("storeId"));
        
        StoreComment c = this.storeService.addStoreComment(content, storeId);
        
        return new ResponseEntity<>(c,HttpStatus.CREATED);
    }
}
