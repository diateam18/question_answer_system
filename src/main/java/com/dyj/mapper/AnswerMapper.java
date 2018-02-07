package com.dyj.mapper;

import com.dyj.domain.Answer;

import java.util.List;

public interface AnswerMapper {
    void addAnswer(Answer answer);

    List<Answer> findById(Integer questionId);
}
