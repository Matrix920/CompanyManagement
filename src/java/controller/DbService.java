/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.*;
import entity.Service;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
 
public class DbService {
    private static Statement db=DBConnection.getConnection();
    
    public static List<Service> get_project_services(int project_id)throws SQLException{
        String sql="select * from services where project_id="+project_id;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Service>services=new ArrayList<>();
        
        while(res.next()){
           Service s=new Service(res.getInt(Service.SERVICE_ID), res.getInt(Service.PROJCET_ID), res.getString(Service.SERVICE_TITLE));
            services.add(s);
        }
        
        return services;
    }
    
    public static void add(Service s)throws SQLException{
            String sql=String.format("insert into services(service_title,project_id)values('%s',%d)",s.service_title,s.project_id);
            db.execute(sql);
    }
  
}
