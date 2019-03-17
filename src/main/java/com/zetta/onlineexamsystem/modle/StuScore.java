package com.zetta.onlineexamsystem.modle;

import java.math.BigDecimal;
import java.util.Date;

public class StuScore {
    private Long scoreId;

    private String userNum;

    private BigDecimal scoreNum;

    private String className;

    private String scoreClassName;

    private BigDecimal scoreAvgNum;

    private BigDecimal scoreAvgCredit;

    private BigDecimal scoreTotalNum;

    private BigDecimal scoreGpa;

    private Integer scoreTeam;

    private Integer scoreTime;

    private Date createTime;

    public Long getScoreId() {
        return scoreId;
    }

    public void setScoreId(Long scoreId) {
        this.scoreId = scoreId;
    }

    public String getUserNum() {
        return userNum;
    }

    public void setUserNum(String userNum) {
        this.userNum = userNum == null ? null : userNum.trim();
    }

    public BigDecimal getScoreNum() {
        return scoreNum;
    }

    public void setScoreNum(BigDecimal scoreNum) {
        this.scoreNum = scoreNum;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }

    public String getScoreClassName() {
        return scoreClassName;
    }

    public void setScoreClassName(String scoreClassName) {
        this.scoreClassName = scoreClassName == null ? null : scoreClassName.trim();
    }

    public BigDecimal getScoreAvgNum() {
        return scoreAvgNum;
    }

    public void setScoreAvgNum(BigDecimal scoreAvgNum) {
        this.scoreAvgNum = scoreAvgNum;
    }

    public BigDecimal getScoreAvgCredit() {
        return scoreAvgCredit;
    }

    public void setScoreAvgCredit(BigDecimal scoreAvgCredit) {
        this.scoreAvgCredit = scoreAvgCredit;
    }

    public BigDecimal getScoreTotalNum() {
        return scoreTotalNum;
    }

    public void setScoreTotalNum(BigDecimal scoreTotalNum) {
        this.scoreTotalNum = scoreTotalNum;
    }

    public BigDecimal getScoreGpa() {
        return scoreGpa;
    }

    public void setScoreGpa(BigDecimal scoreGpa) {
        this.scoreGpa = scoreGpa;
    }

    public Integer getScoreTeam() {
        return scoreTeam;
    }

    public void setScoreTeam(Integer scoreTeam) {
        this.scoreTeam = scoreTeam;
    }

    public Integer getScoreTime() {
        return scoreTime;
    }

    public void setScoreTime(Integer scoreTime) {
        this.scoreTime = scoreTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}