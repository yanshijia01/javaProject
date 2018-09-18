package org.backstage.controller;

import org.backstage.entity.User;
import org.backstage.service.UserService;
import org.backstage.util.CodeUtil;
import org.backstage.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.logging.Logger;

@Controller
@RequestMapping("/user")
@SessionAttributes("user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 正常访问登录页面
     * @return
     */
    @RequestMapping("/login")
    public String Login()
    {
        return "login";
    }

    /**
     * 表单提交过来的路径
     */
    @RequestMapping("/checkLogin")
    public String checkLogin(User user,Model model,String verification,HttpSession session){
        String verifyCode= (String) session.getAttribute("verifyCode");
        //判断当前输入的验证码是否正确
        if(verification.equals(verifyCode))
        {
            return "fail";
        }
        String password = "";
        try {
            password = MD5Util.md5Encode(user.getPassword());
        } catch (Exception e) {
            e.printStackTrace();
        }
        user = userService.checkLogin(user.getUsername(),password);
        if(user!=null)
        {
            model.addAttribute("user",user);
            return "index";
        }
        return "fail";
    }

    /**
     * 测试超链接跳转到另一个页面是否可以取到session值
     * @return
     */
    @RequestMapping("/anotherpage")
    public String hrefpage()
    {
        return "main";
    }

    /**
     * 获取验证码
     *
     * @param response
     * @param session
     */
    @RequestMapping("/getVerifyCode")
    public void generate(HttpServletResponse response, HttpSession session) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        CodeUtil codeUtil = new CodeUtil();
        String verifyCodeValue = codeUtil.drawImg(output);
//        System.out.println(verifyCodeValue);
        session.setAttribute("verifyCode", verifyCodeValue);
        try {
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 注销
     * @return
     */
    @RequestMapping("/outLogin")
    public String OutLogin(HttpSession session)
    {
        //通过Session.invalidate()方法注销当前的session
        session.invalidate();
        return "login";
    }

    @RequestMapping("/main")
    public String main()
    {
        return "main";
    }

    @RequestMapping("/register")
    public String register()
    {
        return "register";
    }

    @RequestMapping("/doRegister")
    public String doRegister(User user,Model model)
    {
        System.out.println(user.getUsername());
        userService.Register(user);
        return "index";
    }
}
