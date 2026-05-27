package com.yangt.demo.controller;

import com.yangt.demo.entity.User;
import com.yangt.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    // 通过@Autowired自动装配UserService的Bean
    @Autowired
    private UserService userService;

    // 首页
    @GetMapping("/")
    public String index() {
        return "index";
    }

    // 跳转注册页
    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    // 处理注册表单提交
    @PostMapping("/register")
    public String register(@RequestParam String username,
                           @RequestParam String password,
                           Model model) {
        boolean success = userService.register(username, password);
        if (success) {
            model.addAttribute("msg", "注册成功！请登录");
            return "login";
        } else {
            model.addAttribute("error", "用户名已存在，请换一个");
            return "register";
        }
    }

    // 跳转登录页
    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    // 处理登录表单提交
    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        User user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("loginUser", user);
            return "redirect:/list";
        } else {
            model.addAttribute("error", "用户名或密码错误");
            return "login";
        }
    }

    // 查询所有用户
    @GetMapping("/list")
    public String list(HttpSession session, Model model) {
        if (session.getAttribute("loginUser") == null) {
            return "redirect:/login";
        }
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        return "list";
    }

    // 删除用户
    @PostMapping("/delete")
    public String delete(@RequestParam String username,
                         HttpSession session,
                         Model model) {
        if (session.getAttribute("loginUser") == null) {
            return "redirect:/login";
        }
        boolean success = userService.deleteByUsername(username);
        if (!success) {
            model.addAttribute("error", "删除失败");
        }
        return "redirect:/list";
    }

    // 退出登录
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
