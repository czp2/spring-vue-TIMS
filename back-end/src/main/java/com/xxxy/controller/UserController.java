package com.xxxy.controller;


import com.xxxy.pojo.Comment;
import com.xxxy.pojo.Pageable;
import com.xxxy.pojo.User;
import com.xxxy.pojo.Views;
import com.xxxy.service.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

/**
 * @ClassName: MainController
 * @Description: TODO
 **/
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
    @Autowired
    private AdminServiceImpl adminService;

    @GetMapping("/index")
    public String index(ModelMap modelMap) {
        // 获取分页参数，如果有就进行分页，无参数就代表第一页，如果比1小就赋值为1
        String page = request.getParameter("page");
        int pid = 1;
        if (page != null && !page.equals("")) {
            pid = Math.max(Integer.valueOf(page), 1);
            System.out.println(pid);
        }
        int count = adminService.queryViewsCounts();
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("currIndex", 0);
        map.put("pageSize", count);
        List<Views> list = adminService.queryAllViews(map);
        Pageable<Views> pageable = new Pageable<>(list, 6);
        modelMap.addAttribute("pageable", pageable);
        modelMap.addAttribute("views", pageable.pageable(pid));
        modelMap.addAttribute("pid", pid);
        return "user/index";
    }


    @GetMapping("/detail/{vid}")
    public String detail(@PathVariable("vid") Integer vid, ModelMap modelMap) {
        List<Comment> comments = adminService.queryVidComment(vid);
        /**
         * 计算平均星值
         */
        double sum = 0;
        for (Comment comment : comments) {
            sum += comment.getStar();
        }
        int star = (int) (sum / comments.size());
        /**
         * 给每个评价赋值user
         */
        for (int i = 0; i < comments.size(); i++) {
            int uid = comments.get(i).getUid();
            comments.get(i).setUser(adminService.queryUserById(uid));
        }
        /**
         * 推荐景点
         */
        int count = adminService.queryViewsCounts();
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("currIndex", 0);
        map.put("pageSize", count);
        List<Views> list = adminService.queryAllViews(map);
        modelMap.addAttribute("view", adminService.queryViewsById(vid));
        modelMap.addAttribute("recommends", list.subList(0, 3));
        modelMap.addAttribute("comments", comments);
        modelMap.addAttribute("star", star);
        return "user/detail";
    }
    @PostMapping("/detail/{vid}")
    public String createComment(@PathVariable("vid") Integer vid, Comment comment) {
        comment.setVid(vid);
        User user = (User) session.getAttribute("user");
        comment.setUid(user.getUid());
        System.out.println(comment);
        adminService.addComment(comment);
        return "redirect:/user/detail/" + vid;
    }

    @GetMapping("/login")
    public String login(ModelMap modelMap) {
        modelMap.addAttribute("login", true);
        return "user/login";
    }

    @GetMapping("/mine")
    public String mine() {
        return "user/mine";
    }

    @PostMapping("/doLogin")
    public String doLogin(@RequestParam String upwd, @RequestParam String email, ModelMap modelMap) {
        System.out.println(upwd);
        System.out.println(email);

        User user = adminService.queryUserByEmail(email);
        if (user != null && user.getUpwd().equals(upwd)) {
            session.setAttribute("user", user);
            return "redirect:/user/index";
        }
        modelMap.addAttribute("login", true);
        modelMap.addAttribute("login_message", "登录失败，邮箱或密码错误");
        return "user/login";
    }

    @PostMapping("/doRegister")
    public String doRegister(User user, ModelMap modelMap) {
        System.out.println(user);
        User one = adminService.queryUserByEmail(user.getEmail());
        if (one == null) {
            adminService.addUser(user);
            return "redirect:/user/login";
        }
        modelMap.addAttribute("login", false);
        modelMap.addAttribute("register_message", "注册失败，邮箱已存在");
        return "user/login";
    }

    @PostMapping("/doUpdate")
    public String doUpdate(User user) {
        User one = (User) session.getAttribute("user");

        one.setEmail(user.getEmail());
        one.setUname(user.getUname());
        System.out.println(one);
        System.out.println(user);
        adminService.updateUser(one);
        return "redirect:/user/mine";
    }



    @GetMapping("/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/user/index";
    }
}
