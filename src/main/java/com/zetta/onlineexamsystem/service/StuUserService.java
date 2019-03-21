package com.zetta.onlineexamsystem.service;

import com.zetta.onlineexamsystem.modle.StuUser;

public interface StuUserService {

    StuUser login(StuUser user);

    Boolean registerUser(StuUser stu, String  yanzhenma);

    Boolean  resetPwd(StuUser stu, String  yanzhenma);

    Boolean  forgetPwd(StuUser stu, String  yanzhenma);

    Boolean selectByEmail(StuUser stu, String  yanzhenma);

}
