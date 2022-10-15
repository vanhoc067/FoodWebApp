/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.formatters;

import com.dvh.pojo.Follow;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Administrator
 */
public class FollowFormatters implements Formatter<Follow>{

    @Override
    public String print(Follow t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Follow parse(String id, Locale locale) throws ParseException {
        Follow f = new Follow();
        f.setId(Integer.parseInt(id));
        
        return f;
    }
    
}
