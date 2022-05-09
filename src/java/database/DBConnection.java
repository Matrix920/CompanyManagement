package database;

import java.sql.*;


public class DBConnection {
   
    private static Statement statement;
    
    public static Statement getConnection(){
        if(statement==null){
            try{
                
                 Connection conn= DriverManager.getConnection(Config.db_host); 
                statement=conn.createStatement();
                        
                }catch(Exception ex){
                    ex.printStackTrace();
                }
        }
        
        return statement;
    }
    
}
