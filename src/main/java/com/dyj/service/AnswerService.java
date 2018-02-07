package com.dyj.service;

import com.dyj.domain.Answer;

import java.util.List;

public interface AnswerService {
    void addAnswer(Answer answer);

    List<Answer> findById(Integer questionId);

}
