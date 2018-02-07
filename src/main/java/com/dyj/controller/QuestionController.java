package com.dyj.controller;

import com.dyj.domain.Answer;
import com.dyj.domain.Question;
import com.dyj.service.AnswerService;
import com.dyj.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("question")
public class QuestionController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private AnswerService answerService;
    @RequestMapping("list")
    public String list(Model model){
        List<Question> questions=questionService.findAll();
        model.addAttribute("questions",questions);
        return "listInformation";
    }
    @RequestMapping("findById")
    public String findById(Integer id,Model model){
        Question question=questionService.findById(id);
        List<Answer> answerList=answerService.findById(id);
        model.addAttribute("answerList",answerList);
        model.addAttribute("question",question);
        return "showInformation";
    }
    @RequestMapping("addQu")
    public String addQu(Question question){
        questionService.addQuestion(question);
        return "redirect:list.do";
    }
    @RequestMapping("add")
    @ResponseBody
    public Map<String,Object> add(Answer answer) {
        try {
            if (answer == null) {
                throw new Exception("请填写回复内容");
            }
            if (answer.getQuestionId()==null) {
                throw new Exception("请选择要回复的资讯");
            }
            if (answer.getContent() == null || answer.getContent().trim().length() == 0) {
                throw new Exception("请填写回复内容");
            }
            answerService.addAnswer(answer);
            Map<String, Object> result = new HashMap<String, Object>();
            result.put("status", true);
            result.put("msg", "回复成功");
            result.put("reply", answer);
            return result;

        } catch (Exception e) {
            Map<String, Object> result = new HashMap<String, Object>();
            result.put("status", false);
            result.put("msg", e.getMessage());
            return result;
        }
    }

}
