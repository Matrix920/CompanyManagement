/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.DBConnection;
import entity.Video;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
 
public class DbVideo {
    private static Statement db=DBConnection.getConnection();
    
    public static List<Video> get_all(int project_id)throws SQLException{
        String sql="select * from videos where project_id="+project_id;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Video>pictures=new ArrayList<>();
        
        while(res.next()){
            Video p=new Video(res.getInt(Video.VIDEO_ID), res.getInt(Video.PROJECT_ID), res.getString(Video.VIDEO_PATH));
            pictures.add(p);
        }
        
        return pictures;
    }
    
    
    public static void add(Video p)throws SQLException{
            String sql=String.format("insert into videos(project_id,video_path)values(%d,'%s')",p.project_id,p.video_path);
            db.execute(sql);
    }
}
