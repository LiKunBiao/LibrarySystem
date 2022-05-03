package com.library.controller;

import com.library.bean.Admin;
import com.library.bean.Read;
import com.library.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class LoginController {

    //配置对象属性，根据属性类型进行自动装配
    @Autowired
    private LoginService loginService;

    @RequestMapping("/loginCheck")
    @ResponseBody
    public Object loginCheck(Admin admin, String remember, HttpSession session, HttpServletResponse response)
    {
        String username = admin.getUsername();
        String password = admin.getPassword();
        Admin a = loginService.loginCheck(username, password);
        HashMap<String, Object> res = new HashMap<>();
        if(a != null)
        {
            session.setAttribute("login", 1);//判断是否登录成功
            session.setMaxInactiveInterval(1000*60*60*24);//有效登录时间为1天
            System.out.println(remember);
            if(remember != null) {
                Cookie[] cookies = new Cookie[] {
                        new Cookie("cusername", username),
                        new Cookie("cpassword", password),
                };
                response.addCookie(cookies[0]);
                response.addCookie(cookies[1]);
            }
        }
        res.put("admin", a);
        return res;
    }

    //管理员主页面
    @RequestMapping("/admin_main")
    public String toAdminMain(String username, String password, Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(1000*60*60*24);//一天
        session.setAttribute("username", username);
        session.setAttribute("password", password);
        return "redirect:/seleteBooks";
    }
    //管理员导航栏
    @RequestMapping("/admin_header")
    public String toAdminHeader(){
        return "admin_header";
    }

    //读者主页面
    @RequestMapping("/reader_main")
    public String toReaderMain(String username, String password, HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(1000*60*60*24);//一天
        session.setAttribute("readId", username);
        session.setAttribute("readPassword", password);
        return "redirect:/reader_seleteBooks";
    }
    //读者导航栏
    @RequestMapping("/reader_header")
    public String toReaderHeader(){
        return "reader_header";
    }

    //读者注册页面
    @RequestMapping("/reader_add")
    public String addReader() {
        return "reader_add";
    }

    //注册验证
    @RequestMapping("/registerCheck")
    @ResponseBody
    public Object registerCheck(Read read) {
        int stateCode = loginService.registerCheck(read);//是否有此用户，无则添加
        HashMap<String, Object> res = new HashMap<>();
        res.put("stateCode", stateCode+"");
        return res;
    }

    @RequestMapping("/logout")
    public String Logout(HttpSession session) {
        session.removeAttribute("login");
        return "index";
    }

}
