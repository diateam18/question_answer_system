package com.dyj.domain;

import java.util.Date;

public class Question {
    private Integer id;
    private String issue;
    private Integer number;
    private Date lastRevise;
    private String detail;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIssue() {
        return issue;
    }

    public void setIssue(String issue) {
        this.issue = issue;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Date getLastRevise() {
        return lastRevise;
    }

    public void setLastRevise(Date lastRevise) {
        this.lastRevise = lastRevise;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
