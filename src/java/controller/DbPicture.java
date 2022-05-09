/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.DBConnection;
import entity.Picture;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class DbPicture {
    private static Statement db=DBConnection.getConnection();
    
    public static List<Picture> get_all(int project_id)throws SQLException{
        String sql="select * from pictures where project_id="+project_id;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Picture>pictures=new ArrayList<>();
        
        while(res.next()){
            Picture p=new Picture(res.getInt(Picture.PICTURE_ID), res.getInt(Picture.PROJECT_ID), res.getString(Picture.PICTURE_PATH));
            pictures.add(p);
        }
        
        return pictures;
    }
    
    
    public static void add(Picture p)throws SQLException{
            String sql=String.format("insert into pictures(project_id,picture_path)values(%d,'%s')",p.project_id,p.picture_path);
            db.execute(sql);
    }
}
