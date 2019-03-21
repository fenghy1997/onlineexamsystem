package com.zetta.onlineexamsystem.controller;

import com.zetta.onlineexamsystem.commons.RestResponse;
import com.zetta.onlineexamsystem.commons.StatusCode;
import com.zetta.onlineexamsystem.modle.Mail;
import com.zetta.onlineexamsystem.modle.StuUser;
import com.zetta.onlineexamsystem.service.StuUserService;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

@RestController
@RequestMapping("v1/api/user")
public class StuUserController {

    @Resource
    private StuUserService userService;

    @Resource
    private HttpServletRequest request;


    /**
     * 用户登录
     * @param user
     * @param request
     * @return
     */
    @PostMapping("/login")
    public RestResponse<Object> login(StuUser user, HttpServletRequest request){
        RestResponse<Object> response=new RestResponse<>();
        StuUser stuUser=userService.login(user);
        if(stuUser!=null){
            HttpSession session = request.getSession();
            session.setAttribute("userinfo",stuUser);
            response.setResult(stuUser);
            response.setResultCode(StatusCode.OK.code());
            response.setResultMsg(StatusCode.OK.message());
        }else {
            response.setResult(new StuUser());
            response.setResultCode(StatusCode.INVALID_PARAMS_CONVERSION.code());
            response.setResultMsg(StatusCode.INVALID_PARAMS_CONVERSION.message());
        }
        return response;
    }

    /**
     * 用户注册
     * @param stu
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public RestResponse<Object> reset(@Valid StuUser stu)throws Exception {
        RestResponse<Object> response=new RestResponse<>();
        //邮箱得到的验证码
        String  yanzhenma=String.valueOf(request.getSession().getServletContext().getAttribute(stu.getUserEmail()));
        Boolean flag= userService.registerUser(stu,yanzhenma);
        if(flag){
            response.setResultCode(StatusCode.OK.code());
            response.setResultMsg(StatusCode.OK.message());
        }else {
            response.setResultCode(StatusCode.INVALID_PARAMS_CONVERSION.code());
            response.setResultMsg(StatusCode.INVALID_PARAMS_CONVERSION.message());
        }
        //清除验证码
        request.getSession().getServletContext().removeAttribute(stu.getUserEmail());
        return response;
    }

    /**
     * 用户修改密码
     * @param
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/resetPwd",method = RequestMethod.POST)
    public RestResponse<Object> registerUser(@Valid StuUser stu)throws Exception {
        RestResponse<Object> response=new RestResponse<>();
        StuUser stuUser1=(StuUser)request.getSession().getAttribute("userinfo");
        //邮箱得到的验证码
        String  yanzhenma=String.valueOf(request.getSession().getServletContext().getAttribute(stuUser1.getUserEmail()));
        Boolean flag= userService.resetPwd(stu,yanzhenma);
        if(flag){
            response.setResultCode(StatusCode.OK.code());
            response.setResultMsg(StatusCode.OK.message());
        }else {
            response.setResultCode(StatusCode.INVALID_PARAMS_CONVERSION.code());
            response.setResultMsg(StatusCode.INVALID_PARAMS_CONVERSION.message());
        }
        //清除验证码
        request.getSession().getServletContext().removeAttribute(stuUser1.getUserEmail());
        return response;
    }


    /**
     * 用户修改密码
     * @param
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/forgetPwd",method = RequestMethod.POST)
    public RestResponse<Object> forgetPwd(@Valid StuUser stu)throws Exception {
        RestResponse<Object> response=new RestResponse<>();
        //邮箱得到的验证码
        String  yanzhenma=String.valueOf(request.getSession().getServletContext().getAttribute(stu.getUserEmail()));
        Boolean flag= userService.selectByEmail(stu,yanzhenma);
        if(flag){
            response.setResultCode(StatusCode.OK.code());
            response.setResultMsg(StatusCode.OK.message());
        }else {
            response.setResultCode(StatusCode.INVALID_PARAMS_CONVERSION.code());
            response.setResultMsg(StatusCode.INVALID_PARAMS_CONVERSION.message());
        }
        //清除验证码
        request.getSession().getServletContext().removeAttribute(stu.getUserEmail());
        return response;
    }





        /**
         * 退出系统
         * @param request
         * @return
         */
    @RequestMapping("/logout")
    public RestResponse<Object> logout2(HttpServletRequest request) {
        RestResponse<Object> response=new RestResponse<>();
        request.getSession().invalidate();
        response.setResultCode(StatusCode.OK.code());
        response.setResultMsg(StatusCode.OK.message());
        return response;
    }
}
