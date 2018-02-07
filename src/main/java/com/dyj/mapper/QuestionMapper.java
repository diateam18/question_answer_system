package com.dyj.mapper;

import com.dyj.domain.Question;

import java.util.List;

public interface QuestionMapper {
    List<Question> findAll();

    Question findById(Integer id);

    void updateQuestion(Question question);

    void addQuestion(Question question);
}
