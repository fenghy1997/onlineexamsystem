package com.zetta.onlineexamsystem.modle;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class StuScoreExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public StuScoreExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andScoreIdIsNull() {
            addCriterion("SCORE_ID is null");
            return (Criteria) this;
        }

        public Criteria andScoreIdIsNotNull() {
            addCriterion("SCORE_ID is not null");
            return (Criteria) this;
        }

        public Criteria andScoreIdEqualTo(Long value) {
            addCriterion("SCORE_ID =", value, "scoreId");
            return (Criteria) this;
        }

        public Criteria andScoreIdNotEqualTo(Long value) {
            addCriterion("SCORE_ID <>", value, "scoreId");
            return (Criteria) this;
        }

        public Criteria andScoreIdGreaterThan(Long value) {
            addCriterion("SCORE_ID >", value, "scoreId");
            return (Criteria) this;
        }

        public Criteria andScoreIdGreaterThanOrEqualTo(Long value) {
            addCriterion("SCORE_ID >=", value, "scoreId");
            return (Criteria) this;
        }

        public Criteria andScoreIdLessThan(Long value) {
            addCriterion("SCORE_ID <", value, "scoreId");
            return (Criteria) this;
        }

        public Criteria andScoreIdLessThanOrEqualTo(Long value) {
            addCriterion("SCORE_ID <=", value, "scoreId");
            return (Criteria) this;
        }

        public Criteria andScoreIdIn(List<Long> values) {
            addCriterion("SCORE_ID in", values, "scoreId");
            return (Criteria) this;
        }

        public Criteria andScoreIdNotIn(List<Long> values) {
            addCriterion("SCORE_ID not in", values, "scoreId");
            return (Criteria) this;
        }

        public Criteria andScoreIdBetween(Long value1, Long value2) {
            addCriterion("SCORE_ID between", value1, value2, "scoreId");
            return (Criteria) this;
        }

        public Criteria andScoreIdNotBetween(Long value1, Long value2) {
            addCriterion("SCORE_ID not between", value1, value2, "scoreId");
            return (Criteria) this;
        }

        public Criteria andUserNumIsNull() {
            addCriterion("USER_NUM is null");
            return (Criteria) this;
        }

        public Criteria andUserNumIsNotNull() {
            addCriterion("USER_NUM is not null");
            return (Criteria) this;
        }

        public Criteria andUserNumEqualTo(String value) {
            addCriterion("USER_NUM =", value, "userNum");
            return (Criteria) this;
        }

        public Criteria andUserNumNotEqualTo(String value) {
            addCriterion("USER_NUM <>", value, "userNum");
            return (Criteria) this;
        }

        public Criteria andUserNumGreaterThan(String value) {
            addCriterion("USER_NUM >", value, "userNum");
            return (Criteria) this;
        }

        public Criteria andUserNumGreaterThanOrEqualTo(String value) {
            addCriterion("USER_NUM >=", value, "userNum");
            return (Criteria) this;
        }

        public Criteria andUserNumLessThan(String value) {
            addCriterion("USER_NUM <", value, "userNum");
            return (Criteria) this;
        }

        public Criteria andUserNumLessThanOrEqualTo(String value) {
            addCriterion("USER_NUM <=", value, "userNum");
            return (Criteria) this;
        }

        public Criteria andUserNumLike(String value) {
            addCriterion("USER_NUM like", value, "userNum");
            return (Criteria) this;
        }

        public Criteria andUserNumNotLike(String value) {
            addCriterion("USER_NUM not like", value, "userNum");
            return (Criteria) this;
        }

        public Criteria andUserNumIn(List<String> values) {
            addCriterion("USER_NUM in", values, "userNum");
            return (Criteria) this;
        }

        public Criteria andUserNumNotIn(List<String> values) {
            addCriterion("USER_NUM not in", values, "userNum");
            return (Criteria) this;
        }

        public Criteria andUserNumBetween(String value1, String value2) {
            addCriterion("USER_NUM between", value1, value2, "userNum");
            return (Criteria) this;
        }

        public Criteria andUserNumNotBetween(String value1, String value2) {
            addCriterion("USER_NUM not between", value1, value2, "userNum");
            return (Criteria) this;
        }

        public Criteria andScoreNumIsNull() {
            addCriterion("SCORE_NUM is null");
            return (Criteria) this;
        }

        public Criteria andScoreNumIsNotNull() {
            addCriterion("SCORE_NUM is not null");
            return (Criteria) this;
        }

        public Criteria andScoreNumEqualTo(BigDecimal value) {
            addCriterion("SCORE_NUM =", value, "scoreNum");
            return (Criteria) this;
        }

        public Criteria andScoreNumNotEqualTo(BigDecimal value) {
            addCriterion("SCORE_NUM <>", value, "scoreNum");
            return (Criteria) this;
        }

        public Criteria andScoreNumGreaterThan(BigDecimal value) {
            addCriterion("SCORE_NUM >", value, "scoreNum");
            return (Criteria) this;
        }

        public Criteria andScoreNumGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("SCORE_NUM >=", value, "scoreNum");
            return (Criteria) this;
        }

        public Criteria andScoreNumLessThan(BigDecimal value) {
            addCriterion("SCORE_NUM <", value, "scoreNum");
            return (Criteria) this;
        }

        public Criteria andScoreNumLessThanOrEqualTo(BigDecimal value) {
            addCriterion("SCORE_NUM <=", value, "scoreNum");
            return (Criteria) this;
        }

        public Criteria andScoreNumIn(List<BigDecimal> values) {
            addCriterion("SCORE_NUM in", values, "scoreNum");
            return (Criteria) this;
        }

        public Criteria andScoreNumNotIn(List<BigDecimal> values) {
            addCriterion("SCORE_NUM not in", values, "scoreNum");
            return (Criteria) this;
        }

        public Criteria andScoreNumBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("SCORE_NUM between", value1, value2, "scoreNum");
            return (Criteria) this;
        }

        public Criteria andScoreNumNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("SCORE_NUM not between", value1, value2, "scoreNum");
            return (Criteria) this;
        }

        public Criteria andClassNameIsNull() {
            addCriterion("CLASS_NAME is null");
            return (Criteria) this;
        }

        public Criteria andClassNameIsNotNull() {
            addCriterion("CLASS_NAME is not null");
            return (Criteria) this;
        }

        public Criteria andClassNameEqualTo(String value) {
            addCriterion("CLASS_NAME =", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameNotEqualTo(String value) {
            addCriterion("CLASS_NAME <>", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameGreaterThan(String value) {
            addCriterion("CLASS_NAME >", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameGreaterThanOrEqualTo(String value) {
            addCriterion("CLASS_NAME >=", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameLessThan(String value) {
            addCriterion("CLASS_NAME <", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameLessThanOrEqualTo(String value) {
            addCriterion("CLASS_NAME <=", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameLike(String value) {
            addCriterion("CLASS_NAME like", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameNotLike(String value) {
            addCriterion("CLASS_NAME not like", value, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameIn(List<String> values) {
            addCriterion("CLASS_NAME in", values, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameNotIn(List<String> values) {
            addCriterion("CLASS_NAME not in", values, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameBetween(String value1, String value2) {
            addCriterion("CLASS_NAME between", value1, value2, "className");
            return (Criteria) this;
        }

        public Criteria andClassNameNotBetween(String value1, String value2) {
            addCriterion("CLASS_NAME not between", value1, value2, "className");
            return (Criteria) this;
        }

        public Criteria andScoreClassNameIsNull() {
            addCriterion("SCORE_CLASS_NAME is null");
            return (Criteria) this;
        }

        public Criteria andScoreClassNameIsNotNull() {
            addCriterion("SCORE_CLASS_NAME is not null");
            return (Criteria) this;
        }

        public Criteria andScoreClassNameEqualTo(String value) {
            addCriterion("SCORE_CLASS_NAME =", value, "scoreClassName");
            return (Criteria) this;
        }

        public Criteria andScoreClassNameNotEqualTo(String value) {
            addCriterion("SCORE_CLASS_NAME <>", value, "scoreClassName");
            return (Criteria) this;
        }

        public Criteria andScoreClassNameGreaterThan(String value) {
            addCriterion("SCORE_CLASS_NAME >", value, "scoreClassName");
            return (Criteria) this;
        }

        public Criteria andScoreClassNameGreaterThanOrEqualTo(String value) {
            addCriterion("SCORE_CLASS_NAME >=", value, "scoreClassName");
            return (Criteria) this;
        }

        public Criteria andScoreClassNameLessThan(String value) {
            addCriterion("SCORE_CLASS_NAME <", value, "scoreClassName");
            return (Criteria) this;
        }

        public Criteria andScoreClassNameLessThanOrEqualTo(String value) {
            addCriterion("SCORE_CLASS_NAME <=", value, "scoreClassName");
            return (Criteria) this;
        }

        public Criteria andScoreClassNameLike(String value) {
            addCriterion("SCORE_CLASS_NAME like", value, "scoreClassName");
            return (Criteria) this;
        }

        public Criteria andScoreClassNameNotLike(String value) {
            addCriterion("SCORE_CLASS_NAME not like", value, "scoreClassName");
            return (Criteria) this;
        }

        public Criteria andScoreClassNameIn(List<String> values) {
            addCriterion("SCORE_CLASS_NAME in", values, "scoreClassName");
            return (Criteria) this;
        }

        public Criteria andScoreClassNameNotIn(List<String> values) {
            addCriterion("SCORE_CLASS_NAME not in", values, "scoreClassName");
            return (Criteria) this;
        }

        public Criteria andScoreClassNameBetween(String value1, String value2) {
            addCriterion("SCORE_CLASS_NAME between", value1, value2, "scoreClassName");
            return (Criteria) this;
        }

        public Criteria andScoreClassNameNotBetween(String value1, String value2) {
            addCriterion("SCORE_CLASS_NAME not between", value1, value2, "scoreClassName");
            return (Criteria) this;
        }

        public Criteria andScoreAvgNumIsNull() {
            addCriterion("SCORE_AVG_NUM is null");
            return (Criteria) this;
        }

        public Criteria andScoreAvgNumIsNotNull() {
            addCriterion("SCORE_AVG_NUM is not null");
            return (Criteria) this;
        }

        public Criteria andScoreAvgNumEqualTo(BigDecimal value) {
            addCriterion("SCORE_AVG_NUM =", value, "scoreAvgNum");
            return (Criteria) this;
        }

        public Criteria andScoreAvgNumNotEqualTo(BigDecimal value) {
            addCriterion("SCORE_AVG_NUM <>", value, "scoreAvgNum");
            return (Criteria) this;
        }

        public Criteria andScoreAvgNumGreaterThan(BigDecimal value) {
            addCriterion("SCORE_AVG_NUM >", value, "scoreAvgNum");
            return (Criteria) this;
        }

        public Criteria andScoreAvgNumGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("SCORE_AVG_NUM >=", value, "scoreAvgNum");
            return (Criteria) this;
        }

        public Criteria andScoreAvgNumLessThan(BigDecimal value) {
            addCriterion("SCORE_AVG_NUM <", value, "scoreAvgNum");
            return (Criteria) this;
        }

        public Criteria andScoreAvgNumLessThanOrEqualTo(BigDecimal value) {
            addCriterion("SCORE_AVG_NUM <=", value, "scoreAvgNum");
            return (Criteria) this;
        }

        public Criteria andScoreAvgNumIn(List<BigDecimal> values) {
            addCriterion("SCORE_AVG_NUM in", values, "scoreAvgNum");
            return (Criteria) this;
        }

        public Criteria andScoreAvgNumNotIn(List<BigDecimal> values) {
            addCriterion("SCORE_AVG_NUM not in", values, "scoreAvgNum");
            return (Criteria) this;
        }

        public Criteria andScoreAvgNumBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("SCORE_AVG_NUM between", value1, value2, "scoreAvgNum");
            return (Criteria) this;
        }

        public Criteria andScoreAvgNumNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("SCORE_AVG_NUM not between", value1, value2, "scoreAvgNum");
            return (Criteria) this;
        }

        public Criteria andScoreAvgCreditIsNull() {
            addCriterion("SCORE_AVG_CREDIT is null");
            return (Criteria) this;
        }

        public Criteria andScoreAvgCreditIsNotNull() {
            addCriterion("SCORE_AVG_CREDIT is not null");
            return (Criteria) this;
        }

        public Criteria andScoreAvgCreditEqualTo(BigDecimal value) {
            addCriterion("SCORE_AVG_CREDIT =", value, "scoreAvgCredit");
            return (Criteria) this;
        }

        public Criteria andScoreAvgCreditNotEqualTo(BigDecimal value) {
            addCriterion("SCORE_AVG_CREDIT <>", value, "scoreAvgCredit");
            return (Criteria) this;
        }

        public Criteria andScoreAvgCreditGreaterThan(BigDecimal value) {
            addCriterion("SCORE_AVG_CREDIT >", value, "scoreAvgCredit");
            return (Criteria) this;
        }

        public Criteria andScoreAvgCreditGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("SCORE_AVG_CREDIT >=", value, "scoreAvgCredit");
            return (Criteria) this;
        }

        public Criteria andScoreAvgCreditLessThan(BigDecimal value) {
            addCriterion("SCORE_AVG_CREDIT <", value, "scoreAvgCredit");
            return (Criteria) this;
        }

        public Criteria andScoreAvgCreditLessThanOrEqualTo(BigDecimal value) {
            addCriterion("SCORE_AVG_CREDIT <=", value, "scoreAvgCredit");
            return (Criteria) this;
        }

        public Criteria andScoreAvgCreditIn(List<BigDecimal> values) {
            addCriterion("SCORE_AVG_CREDIT in", values, "scoreAvgCredit");
            return (Criteria) this;
        }

        public Criteria andScoreAvgCreditNotIn(List<BigDecimal> values) {
            addCriterion("SCORE_AVG_CREDIT not in", values, "scoreAvgCredit");
            return (Criteria) this;
        }

        public Criteria andScoreAvgCreditBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("SCORE_AVG_CREDIT between", value1, value2, "scoreAvgCredit");
            return (Criteria) this;
        }

        public Criteria andScoreAvgCreditNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("SCORE_AVG_CREDIT not between", value1, value2, "scoreAvgCredit");
            return (Criteria) this;
        }

        public Criteria andScoreTotalNumIsNull() {
            addCriterion("SCORE_TOTAL_NUM is null");
            return (Criteria) this;
        }

        public Criteria andScoreTotalNumIsNotNull() {
            addCriterion("SCORE_TOTAL_NUM is not null");
            return (Criteria) this;
        }

        public Criteria andScoreTotalNumEqualTo(BigDecimal value) {
            addCriterion("SCORE_TOTAL_NUM =", value, "scoreTotalNum");
            return (Criteria) this;
        }

        public Criteria andScoreTotalNumNotEqualTo(BigDecimal value) {
            addCriterion("SCORE_TOTAL_NUM <>", value, "scoreTotalNum");
            return (Criteria) this;
        }

        public Criteria andScoreTotalNumGreaterThan(BigDecimal value) {
            addCriterion("SCORE_TOTAL_NUM >", value, "scoreTotalNum");
            return (Criteria) this;
        }

        public Criteria andScoreTotalNumGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("SCORE_TOTAL_NUM >=", value, "scoreTotalNum");
            return (Criteria) this;
        }

        public Criteria andScoreTotalNumLessThan(BigDecimal value) {
            addCriterion("SCORE_TOTAL_NUM <", value, "scoreTotalNum");
            return (Criteria) this;
        }

        public Criteria andScoreTotalNumLessThanOrEqualTo(BigDecimal value) {
            addCriterion("SCORE_TOTAL_NUM <=", value, "scoreTotalNum");
            return (Criteria) this;
        }

        public Criteria andScoreTotalNumIn(List<BigDecimal> values) {
            addCriterion("SCORE_TOTAL_NUM in", values, "scoreTotalNum");
            return (Criteria) this;
        }

        public Criteria andScoreTotalNumNotIn(List<BigDecimal> values) {
            addCriterion("SCORE_TOTAL_NUM not in", values, "scoreTotalNum");
            return (Criteria) this;
        }

        public Criteria andScoreTotalNumBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("SCORE_TOTAL_NUM between", value1, value2, "scoreTotalNum");
            return (Criteria) this;
        }

        public Criteria andScoreTotalNumNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("SCORE_TOTAL_NUM not between", value1, value2, "scoreTotalNum");
            return (Criteria) this;
        }

        public Criteria andScoreGpaIsNull() {
            addCriterion("SCORE_GPA is null");
            return (Criteria) this;
        }

        public Criteria andScoreGpaIsNotNull() {
            addCriterion("SCORE_GPA is not null");
            return (Criteria) this;
        }

        public Criteria andScoreGpaEqualTo(BigDecimal value) {
            addCriterion("SCORE_GPA =", value, "scoreGpa");
            return (Criteria) this;
        }

        public Criteria andScoreGpaNotEqualTo(BigDecimal value) {
            addCriterion("SCORE_GPA <>", value, "scoreGpa");
            return (Criteria) this;
        }

        public Criteria andScoreGpaGreaterThan(BigDecimal value) {
            addCriterion("SCORE_GPA >", value, "scoreGpa");
            return (Criteria) this;
        }

        public Criteria andScoreGpaGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("SCORE_GPA >=", value, "scoreGpa");
            return (Criteria) this;
        }

        public Criteria andScoreGpaLessThan(BigDecimal value) {
            addCriterion("SCORE_GPA <", value, "scoreGpa");
            return (Criteria) this;
        }

        public Criteria andScoreGpaLessThanOrEqualTo(BigDecimal value) {
            addCriterion("SCORE_GPA <=", value, "scoreGpa");
            return (Criteria) this;
        }

        public Criteria andScoreGpaIn(List<BigDecimal> values) {
            addCriterion("SCORE_GPA in", values, "scoreGpa");
            return (Criteria) this;
        }

        public Criteria andScoreGpaNotIn(List<BigDecimal> values) {
            addCriterion("SCORE_GPA not in", values, "scoreGpa");
            return (Criteria) this;
        }

        public Criteria andScoreGpaBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("SCORE_GPA between", value1, value2, "scoreGpa");
            return (Criteria) this;
        }

        public Criteria andScoreGpaNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("SCORE_GPA not between", value1, value2, "scoreGpa");
            return (Criteria) this;
        }

        public Criteria andScoreTeamIsNull() {
            addCriterion("SCORE_TEAM is null");
            return (Criteria) this;
        }

        public Criteria andScoreTeamIsNotNull() {
            addCriterion("SCORE_TEAM is not null");
            return (Criteria) this;
        }

        public Criteria andScoreTeamEqualTo(Integer value) {
            addCriterion("SCORE_TEAM =", value, "scoreTeam");
            return (Criteria) this;
        }

        public Criteria andScoreTeamNotEqualTo(Integer value) {
            addCriterion("SCORE_TEAM <>", value, "scoreTeam");
            return (Criteria) this;
        }

        public Criteria andScoreTeamGreaterThan(Integer value) {
            addCriterion("SCORE_TEAM >", value, "scoreTeam");
            return (Criteria) this;
        }

        public Criteria andScoreTeamGreaterThanOrEqualTo(Integer value) {
            addCriterion("SCORE_TEAM >=", value, "scoreTeam");
            return (Criteria) this;
        }

        public Criteria andScoreTeamLessThan(Integer value) {
            addCriterion("SCORE_TEAM <", value, "scoreTeam");
            return (Criteria) this;
        }

        public Criteria andScoreTeamLessThanOrEqualTo(Integer value) {
            addCriterion("SCORE_TEAM <=", value, "scoreTeam");
            return (Criteria) this;
        }

        public Criteria andScoreTeamIn(List<Integer> values) {
            addCriterion("SCORE_TEAM in", values, "scoreTeam");
            return (Criteria) this;
        }

        public Criteria andScoreTeamNotIn(List<Integer> values) {
            addCriterion("SCORE_TEAM not in", values, "scoreTeam");
            return (Criteria) this;
        }

        public Criteria andScoreTeamBetween(Integer value1, Integer value2) {
            addCriterion("SCORE_TEAM between", value1, value2, "scoreTeam");
            return (Criteria) this;
        }

        public Criteria andScoreTeamNotBetween(Integer value1, Integer value2) {
            addCriterion("SCORE_TEAM not between", value1, value2, "scoreTeam");
            return (Criteria) this;
        }

        public Criteria andScoreTimeIsNull() {
            addCriterion("SCORE_TIME is null");
            return (Criteria) this;
        }

        public Criteria andScoreTimeIsNotNull() {
            addCriterion("SCORE_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andScoreTimeEqualTo(Integer value) {
            addCriterion("SCORE_TIME =", value, "scoreTime");
            return (Criteria) this;
        }

        public Criteria andScoreTimeNotEqualTo(Integer value) {
            addCriterion("SCORE_TIME <>", value, "scoreTime");
            return (Criteria) this;
        }

        public Criteria andScoreTimeGreaterThan(Integer value) {
            addCriterion("SCORE_TIME >", value, "scoreTime");
            return (Criteria) this;
        }

        public Criteria andScoreTimeGreaterThanOrEqualTo(Integer value) {
            addCriterion("SCORE_TIME >=", value, "scoreTime");
            return (Criteria) this;
        }

        public Criteria andScoreTimeLessThan(Integer value) {
            addCriterion("SCORE_TIME <", value, "scoreTime");
            return (Criteria) this;
        }

        public Criteria andScoreTimeLessThanOrEqualTo(Integer value) {
            addCriterion("SCORE_TIME <=", value, "scoreTime");
            return (Criteria) this;
        }

        public Criteria andScoreTimeIn(List<Integer> values) {
            addCriterion("SCORE_TIME in", values, "scoreTime");
            return (Criteria) this;
        }

        public Criteria andScoreTimeNotIn(List<Integer> values) {
            addCriterion("SCORE_TIME not in", values, "scoreTime");
            return (Criteria) this;
        }

        public Criteria andScoreTimeBetween(Integer value1, Integer value2) {
            addCriterion("SCORE_TIME between", value1, value2, "scoreTime");
            return (Criteria) this;
        }

        public Criteria andScoreTimeNotBetween(Integer value1, Integer value2) {
            addCriterion("SCORE_TIME not between", value1, value2, "scoreTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("CREATE_TIME is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("CREATE_TIME is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("CREATE_TIME =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("CREATE_TIME <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("CREATE_TIME >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("CREATE_TIME >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("CREATE_TIME <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("CREATE_TIME <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("CREATE_TIME in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("CREATE_TIME not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("CREATE_TIME between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("CREATE_TIME not between", value1, value2, "createTime");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}