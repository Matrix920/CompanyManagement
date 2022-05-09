/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.DBConnection;
import entity.Property;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DbProperty {
    private static Statement db=DBConnection.getConnection();
    
    public static List<Property> get_all_properties()throws SQLException{
        String sql="select * from properties";
        
        ResultSet res=db.executeQuery(sql);
        
        List<Property>properties=new ArrayList<>();
        
        while(res.next()){
            Property p=new Property(res.getInt(Property.PROPERTY_ID), res.getInt(Property.PROJECT_ID), res.getInt(Property.PRICE), res.getString(Property.ADDRESS), res.getInt(Property.AREA), res.getString(Property.KIND), res.getInt(Property.ROOM));
            properties.add(p);
        }
        
        return properties;
    }
    
    public static List<Property> get_all_properties(int project_id)throws SQLException{
        String sql="select * from properties where project_id="+project_id;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Property>properties=new ArrayList<>();
        
        while(res.next()){
            Property p=new Property(res.getInt(Property.PROPERTY_ID), res.getInt(Property.PROJECT_ID), res.getInt(Property.PRICE), res.getString(Property.ADDRESS), res.getInt(Property.AREA), res.getString(Property.KIND), res.getInt(Property.ROOM));
            properties.add(p);
        }
        
        return properties;
    }
    
    public static void add(Property p)throws SQLException{
            String sql=String.format("insert into properties(project_id,price,address,area,kind,room) values(%d,%d,'%s',%d,'%s',%d)",
                                    p.project_id,p.price,p.address,p.area,p.kind,p.room);
            db.execute(sql);
    }
    
    public static Property get_property(int property_id)throws SQLException{
        String sql="select * from properties where property_id="+property_id;
        
        ResultSet res=db.executeQuery(sql);
        
        Property p=new Property(0, 0, 0, "", 0, "", 0);
        
        if(res.next()){
            p=new Property(res.getInt(Property.PROPERTY_ID), res.getInt(Property.PROJECT_ID), res.getInt(Property.PRICE), res.getString(Property.ADDRESS), res.getInt(Property.AREA), res.getString(Property.KIND), res.getInt(Property.ROOM));
        }
        
        return p;
    }
    
    public static List<Property> get_properties_by_price(int price)throws SQLException{
        String sql="select * from properties where price="+price;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Property>properties=new ArrayList<>();
        
        while(res.next()){
            Property p=new Property(res.getInt(Property.PROPERTY_ID), res.getInt(Property.PROJECT_ID), res.getInt(Property.PRICE), res.getString(Property.ADDRESS), res.getInt(Property.AREA), res.getString(Property.KIND), res.getInt(Property.ROOM));
            properties.add(p);
        }
        
        return properties;
    }
    
    
    public static List<Property> get_properties_by_address(String address)throws SQLException{
        String sql="select * from properties where address like '%"+address+"%'";
        
        ResultSet res=db.executeQuery(sql);
        
        List<Property>properties=new ArrayList<>();
        
        while(res.next()){
            Property p=new Property(res.getInt(Property.PROPERTY_ID), res.getInt(Property.PROJECT_ID), res.getInt(Property.PRICE), res.getString(Property.ADDRESS), res.getInt(Property.AREA), res.getString(Property.KIND), res.getInt(Property.ROOM));
            properties.add(p);
        }
        
        return properties;
    }
    
    public static List<Property> get_properties_by_kind(String kind)throws SQLException{
        String sql="select * from properties where kind like '%"+kind+"%'";
        
        ResultSet res=db.executeQuery(sql);
        
        List<Property>properties=new ArrayList<>();
        
        while(res.next()){
            Property p=new Property(res.getInt(Property.PROPERTY_ID), res.getInt(Property.PROJECT_ID), res.getInt(Property.PRICE), res.getString(Property.ADDRESS), res.getInt(Property.AREA), res.getString(Property.KIND), res.getInt(Property.ROOM));
            properties.add(p);
        }
        
        return properties;
    }
    
    public static List<Property> get_properties_by_area(int area)throws SQLException{
        String sql="select * from properties where area="+area;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Property>properties=new ArrayList<>();
        
        while(res.next()){
            Property p=new Property(res.getInt(Property.PROPERTY_ID), res.getInt(Property.PROJECT_ID), res.getInt(Property.PRICE), res.getString(Property.ADDRESS), res.getInt(Property.AREA), res.getString(Property.KIND), res.getInt(Property.ROOM));
            properties.add(p);
        }
        
        return properties;
    }
    
    public static List<Property> get_properties_by_room(int room)throws SQLException{
        String sql="select * from properties where room="+room;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Property>properties=new ArrayList<>();
        
        while(res.next()){
            Property p=new Property(res.getInt(Property.PROPERTY_ID), res.getInt(Property.PROJECT_ID), res.getInt(Property.PRICE), res.getString(Property.ADDRESS), res.getInt(Property.AREA), res.getString(Property.KIND), res.getInt(Property.ROOM));
            properties.add(p);
        }
        
        return properties;
    }
}
