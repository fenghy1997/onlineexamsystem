package com.zetta.onlineexamsystem.controller;

import com.zetta.onlineexamsystem.commons.RestResponse;
import com.zetta.onlineexamsystem.commons.StatusCode;
import com.zetta.onlineexamsystem.modle.Mail;
import com.zetta.onlineexamsystem.modle.StuUser;
import com.zetta.onlineexamsystem.util.MailUtil;
import com.zetta.onlineexamsystem.util.RandomUtil;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@RestController
@RequestMapping("v1/api/mail")
public class MailController {

    @Resource
    private  MailUtil mailUtil;

    /**
     * 验证码
     * @param email
     * @param request
     * @throws IOException
     */
    @RequestMapping("/sendYZM")
    public RestResponse<Object> sendyzm3(@RequestParam("email") String email, HttpServletRequest request) throws Exception {
        RestResponse<Object> response=new RestResponse<>();
        String yzm = RandomUtil.getyzm(6);
        mailUtil.sendSimpleMail(email, "信息工程系",
                "<h2>您的验证码为：</h2><font color='blue'>" + yzm + "</font>");
        request.getSession().getServletContext().setAttribute(email, yzm);
        response.setResultCode(StatusCode.OK.code());
        response.setResultMsg(StatusCode.OK.message());
        return response;
    }

    /**
     * 清除验证码
     * @param request
     * @return
     */
    @GetMapping("/checkoutyzm")
    public  RestResponse<Object> checkOutYZM(HttpServletRequest request){
        RestResponse<Object> response=new RestResponse<>();
        String email = request.getParameter("email");
        String uemail = email.trim();
        request.getSession().getServletContext().removeAttribute(uemail);
        response.setResultCode(StatusCode.OK.code());
        response.setResultMsg(StatusCode.OK.message());
        return response;
    }

    /**
     * 验证码
     * @param request
     * @throws IOException
     */
    @GetMapping("/sendYZMpwd")
    public RestResponse<Object> sendyzmPwd(@RequestParam("oldpwd") String oldpwd, HttpServletRequest request) throws Exception {
        RestResponse<Object> response=new RestResponse<>();
        //学生改密码的时候输的密码
        StuUser stuUser1=(StuUser)request.getSession().getAttribute("userinfo");
//        学生登陆的密码
        String pwd=stuUser1.getUserPass();
        String email =stuUser1.getUserEmail();
         if(pwd.equals(oldpwd)){
            String yzm = RandomUtil.getyzm(6);
            mailUtil.sendSimpleMail(email, "信息工程系",
                    "<h2>您的验证码为：</h2><font color='blue'>" + yzm + "</font>");
            request.getSession().getServletContext().setAttribute(email, yzm);
            response.setResultCode(StatusCode.OK.code());
            response.setResultMsg(StatusCode.OK.message());
        }else{
            response.setResultCode(StatusCode.INVALID_MODEL_FIELDS.code());
            response.setResultMsg(StatusCode.INVALID_MODEL_FIELDS.message());
        }

        return response;
    }


    /**
     * 清除验证码
     * @param request
     * @return
     */
    @GetMapping("/checkOutYZMpwd")
    public  RestResponse<Object> checkOutYZMpwd(HttpServletRequest request){
        RestResponse<Object> response=new RestResponse<>();
        StuUser stuUser1=new StuUser();
        stuUser1=(StuUser)request.getSession().getAttribute("userinfo");
        String email =stuUser1.getUserEmail();
        String uemail = email.trim();
        request.getSession().getServletContext().removeAttribute(uemail);
        response.setResultCode(StatusCode.OK.code());
        response.setResultMsg(StatusCode.OK.message());
        return response;
    }





}
