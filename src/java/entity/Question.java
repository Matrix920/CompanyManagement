/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

public class Question {
    public int question_id;
    public String question_title;
    public String answer_title;
    public boolean is_answered;
    public int client_id;
    
    public static final String QUESTION_ID="question_id";
    public static final String QUESTION_TITLE="question_title";
    public static final String ANSWER_TITLE="answer_title";
    public static final String IS_ANSWERED="is_answered";
    public static final String CLIENT_ID="client_id";

    public Question(int question_id, String question_title, String answer_title, boolean is_answered, int client_id) {
        this.question_id = question_id;
        this.question_title = question_title;
        this.answer_title = answer_title;
        this.is_answered = is_answered;
        this.client_id = client_id;
    }
    
    
}
