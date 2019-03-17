package com.zetta.onlineexamsystem.exception;

import com.zetta.onlineexamsystem.commons.RestResponse;
import com.zetta.onlineexamsystem.commons.StatusCode;
import com.zetta.onlineexamsystem.util.APIResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.MessageFormat;

/**
 * 统一异常类
 * Created by Donghua.Chen on 2018/4/20.
 */
public class BusinessException extends RuntimeException {

    private static final Logger logger = LoggerFactory.getLogger(BusinessException.class);
    private Integer code;
    private String msg;



    public BusinessException(String message, Integer code) {
        this.code=StatusCode.INVALID_PARAMS_CONVERSION.code();
        this.msg=StatusCode.INVALID_PARAMS_CONVERSION.message();
    }

    public BusinessException(String message, Throwable cause,Integer code) {
        super(message, cause);
        this.code=code;
    }


    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }





}
