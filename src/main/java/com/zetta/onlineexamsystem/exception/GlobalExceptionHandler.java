package com.zetta.onlineexamsystem.exception;

import com.zetta.onlineexamsystem.commons.RestResponse;
import com.zetta.onlineexamsystem.util.APIResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 统一异常处理
 * Created by Donghua.Chen on 2018/4/20.
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger logger = LoggerFactory.getLogger(Exception.class);

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public RestResponse businessException(Exception e){
        Integer code=HttpStatus.INTERNAL_SERVER_ERROR.value();
        String msg=e.getMessage();

        if (e instanceof BusinessException){
            msg = ((BusinessException) e).getMsg();
            code=((BusinessException) e).getCode();
        }

        logger.error("find exception:e={}",e.getMessage());
        e.printStackTrace();
        return new RestResponse(code,msg);
    }


}
