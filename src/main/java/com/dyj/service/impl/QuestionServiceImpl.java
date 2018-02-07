package com.dyj.service.impl;

import com.dyj.domain.Question;
import com.dyj.mapper.QuestionMapper;
import com.dyj.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class QuestionServiceImpl implements QuestionService{
    @Autowired
    private QuestionMapper questionMapper;
    public List<Question> findAll() {
        return questionMapper.findAll();
    }

    public Question findById(Integer id) {
        return questionMapper.findById(id);
    }
    public void updateQuestion(Question question) {
        questionMapper.updateQuestion(question);
    }

    public void addQuestion(Question question) {
        Question question1=new Question();
        //question1.setLastRevise(new Date());
        questionMapper.addQuestion(question);
    }
}
