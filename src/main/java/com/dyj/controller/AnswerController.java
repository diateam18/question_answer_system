package com.dyj.controller;

import com.dyj.domain.Answer;
import com.dyj.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("answer")
public class AnswerController {
    @Autowired
    private AnswerService answerService;
    @RequestMapping("add")
    public String add(Model model, Answer answer){
        answerService.addAnswer(answer);
        return "listInformation";

    }
    @RequestMapping("findById")
    public List<Answer> findById(Model model ,Integer questionId){
        List<Answer> answers=answerService.findById(questionId);
        return answers;
    }

}
