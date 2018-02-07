package com.dyj.service.impl;

import com.dyj.domain.Answer;
import com.dyj.domain.Question;
import com.dyj.mapper.AnswerMapper;
import com.dyj.mapper.QuestionMapper;
import com.dyj.service.AnswerService;
import org.aspectj.weaver.patterns.TypePatternQuestions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

@Service
public class AnswerServiceImpl implements AnswerService {
    @Autowired
    private AnswerMapper answerMapper;
    @Autowired
    private QuestionMapper questionMapper;
    public void addAnswer(Answer answer) {
        Question question=new Question();
        question.setId(answer.getQuestionId());
        question.setNumber(1);
        question.setLastRevise(new Date());
        questionMapper.updateQuestion(question);
        answer.setCreateTime(new Date());
        answerMapper.addAnswer(answer);
    }

    public List<Answer> findById(Integer questionId) {
        return answerMapper.findById(questionId);
    }


}
