/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.formatters;

import com.dvh.pojo.Store;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Administrator
 */
public class StoreFormatter implements Formatter<Store>{

    @Override
    public String print(Store t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Store parse(String id, Locale locale) throws ParseException {
        Store s = new Store();
        s.setId(Integer.parseInt(id));
        
        return s;
    }
    
}
