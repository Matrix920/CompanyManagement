/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import database.*;
import entity.Client;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbClient {
    
     private static Statement db=DBConnection.getConnection();
    
    public static Client login(String username,String password)throws SQLException{
        String sql=String.format("select * from clients where username='%s' AND password='%s'", username,password);
        
        ResultSet r=db.executeQuery(sql);
        Client client=new Client(0,"","");
        if(r.next()){
            client=new Client(r.getInt(1), r.getString(2), r.getString(3));
        }
        
        return client;
    }
    
     public static Client get(int client_id)throws SQLException{
        String sql=String.format("select * from clients where client_id=%d", client_id);
        
        ResultSet r=db.executeQuery(sql);
        Client client=new Client(0,"","");
        if(r.next()){
            client=new Client(r.getInt(1), r.getString(2), r.getString(3));
        }
        
        return client;
    }
    
    public static void add(Client c)throws SQLException{
        String sql=String.format("insert into clients(username,password) values('%s','%s')",c.username,c.password);
        
        db.execute(sql);
    }
    
    public static boolean check_login(String username,String password)throws SQLException{
        Client client=login(username, password);
        if(client.client_id==0)
            return false;
        return true;
    }
    
}
   