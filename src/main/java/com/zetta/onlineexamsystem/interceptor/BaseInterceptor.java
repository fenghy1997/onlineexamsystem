package com.zetta.onlineexamsystem.interceptor;


import com.zetta.onlineexamsystem.modle.StuUser;
import com.zetta.onlineexamsystem.util.MapCache;
import com.zetta.onlineexamsystem.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 自定义拦截器
 */
@Component
public class BaseInterceptor implements HandlerInterceptor {
    private static final Logger LOGGE = LoggerFactory.getLogger(BaseInterceptor.class);
    private static final String USER_AGENT = "user-agent";


    private MapCache cache = MapCache.single();


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        String uri = request.getRequestURI();

        HttpSession session = request.getSession();

        StuUser userinfo = (StuUser) session.getAttribute("userinfo");



        if(uri.toCharArray().length==1 || uri.indexOf("login")>0 || uri.indexOf("sendYZM")>0 || uri.indexOf("checkoutyzm")>0 || uri.indexOf("register")>0||uri.indexOf("sendYZMpwd")>0||uri.indexOf("checkOutYZMpwd")>0||uri.indexOf("resetPwd")>0){
            return true;
        }

        if(userinfo==null){
            response.sendRedirect(request.getContextPath() + "/");
            return true;
        }




        LOGGE.info("UserAgent: {}", request.getHeader(USER_AGENT));
//        LOGGE.info("用户访问地址: {}, 来路地址: {}", uri, IPKit.getIpAddrByRequest(request));


//        //请求拦截处理
//        UserDomain user = TaleUtils.getLoginUser(request);
//        if (null == user) {
//            Integer uid = TaleUtils.getCookieUid(request);
//            if (null != uid) {
//                //这里还是有安全隐患,cookie是可以伪造的
//                user = userService.getUserInfoById(uid);
//                request.getSession().setAttribute(WebConst.LOGIN_SESSION_KEY, user);
//            }
//        }
//        if (uri.startsWith("/admin") && !uri.startsWith("/admin/login") && null == user
//                && !uri.startsWith("/admin/css") && !uri.startsWith("/admin/images")
//                && !uri.startsWith("/admin/js") && !uri.startsWith("/admin/plugins")
//                && !uri.startsWith("/admin/editormd")) {
//            response.sendRedirect(request.getContextPath() + "/admin/login");
//            return false;
//        }
        //设置get请求的token
        if (request.getMethod().equals("GET")) {
            String csrf_token = UUID.UU64();
            // 默认存储30分钟
          //  cache.hset(Types.CSRF_TOKEN.getType(), csrf_token, uri, 30 * 60);
            request.setAttribute("_csrf_token", csrf_token);
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
//        OptionsDomain ov = optionService.getOptionByName("site_record");
//        httpServletRequest.setAttribute("commons", commons);//一些工具类和公共方法
//        httpServletRequest.setAttribute("option", ov);
//        httpServletRequest.setAttribute("adminCommons", adminCommons);
//        initSiteConfig(httpServletRequest);

    }

//    private void initSiteConfig(HttpServletRequest request) {
//        if (WebConst.initConfig.isEmpty()){
//            List<OptionsDomain> options = optionService.getOptions();
//            Map<String, String> querys = new HashMap<>();
//            options.forEach(option -> {
//                querys.put(option.getName(), option.getValue());
//            });
//            WebConst.initConfig = querys;
//        }
//    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
