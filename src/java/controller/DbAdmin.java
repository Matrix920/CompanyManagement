/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import database.*;
import entity.Admin;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbAdmin {
    
     private static Statement db=DBConnection.getConnection();
    
    public static Admin login(String username,String password)throws SQLException{
        String sql=String.format("select * from admins where username='%s' AND password='%s'", username,password);
        
        ResultSet r=db.executeQuery(sql);
        Admin admin=new Admin(0,"","");
        if(r.next()){
            admin=new Admin(r.getInt(1), r.getString(2), r.getString(3));
        }
        
        return admin;
    }
    
    public static boolean check_login(String username,String password)throws SQLException{
        Admin admin=login(username, password);
        if(admin.admin_id==0)
            return false;
        return true;
    }
}
