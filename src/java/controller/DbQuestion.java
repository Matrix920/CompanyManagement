/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.*;
import entity.Question;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DbQuestion {
    private static Statement db=DBConnection.getConnection();
    
    public static List<Question> get_client_questions(int client_id)throws SQLException{
        String sql="select * from questions where client_id="+client_id;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Question>questions=new ArrayList<>();
        
        while(res.next()){
            Question q=new Question(res.getInt(Question.QUESTION_ID), res.getString(Question.QUESTION_TITLE), res.getString(Question.ANSWER_TITLE), res.getBoolean(Question.IS_ANSWERED), res.getInt(Question.CLIENT_ID));
            questions.add(q);
        }
        
        return questions;
    }
    
    public static List<Question> get_all_questions()throws SQLException{
         String sql="select * from questions where is_answered="+false;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Question>questions=new ArrayList<>();
        
        while(res.next()){
            Question q=new Question(res.getInt(Question.QUESTION_ID), res.getString(Question.QUESTION_TITLE), res.getString(Question.ANSWER_TITLE), res.getBoolean(Question.IS_ANSWERED), res.getInt(Question.CLIENT_ID));
            questions.add(q);
        }
        
        return questions;
    }
    
    public static void add(Question q)throws SQLException{
            String sql=String.format("insert into questions(question_title,client_id,is_answered)values('%s',%d,%b)",q.question_title,q.client_id,false);
            db.execute(sql);
    }
    
    public static void update(Question q)throws SQLException{
         String sql=String.format("update questions set answer_title='%s',is_answered=%b where question_id=%d",q.question_title,true,q.question_id);
         db.execute(sql);
     }
    
    public static Question get(int question_id)throws SQLException{
        String sql="select * from questions where question_id="+question_id;
        
        ResultSet res=db.executeQuery(sql);
        
        Question q=new Question(0, "", "", false, 0);
        
        if(res.next()){
             q=new Question(res.getInt(Question.QUESTION_ID), res.getString(Question.QUESTION_TITLE), res.getString(Question.ANSWER_TITLE), res.getBoolean(Question.IS_ANSWERED), res.getInt(Question.CLIENT_ID));
        }
        
        return q;
    }
}
