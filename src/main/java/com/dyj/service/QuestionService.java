package com.dyj.service;

import com.dyj.domain.Question;

import java.util.List;

public interface QuestionService {
    List<Question> findAll();

    Question findById(Integer id);

    void updateQuestion(Question question);

    void addQuestion(Question question);
}
