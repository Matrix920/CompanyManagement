/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.DBConnection;
import entity.Project;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DbProject {
    private static Statement db=DBConnection.getConnection();
    
    public static List<Project> get_all_projects()throws SQLException{
        String sql="select * from projects";
        
        ResultSet res=db.executeQuery(sql);
        
        List<Project>projects=new ArrayList<>();
        
        while(res.next()){
            Project p=new Project(res.getInt(Project.PROJECT_ID), res.getString(Project.PROJECT_NAME), res.getString(Project.ADDRESS), res.getLong(Project.TEL));
            projects.add(p);
        }
        
        return projects;
    }
    
    public static void add(Project p)throws SQLException{
            String sql=String.format("insert into projects(project_name,address,tel)values('%s','%s',%d)",p.project_name,p.address,p.tel);
            db.execute(sql);
    }
    
    public static Project get_project(int project_id)throws SQLException{
        String sql="select * from projects where project_id="+project_id;
        
        ResultSet res=db.executeQuery(sql);
        
        Project p=new Project(0, "", "", 0l);
        
        if(res.next()){
            p=new Project(res.getInt(Project.PROJECT_ID), res.getString(Project.PROJECT_NAME), res.getString(Project.ADDRESS), res.getLong(Project.TEL));
        }
        
        return p;
    }
}
