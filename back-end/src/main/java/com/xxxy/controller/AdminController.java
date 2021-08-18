package com.xxxy.controller;


import com.xxxy.pojo.Admin;
import com.xxxy.pojo.Comment;
import com.xxxy.pojo.User;
import com.xxxy.pojo.Views;
import com.xxxy.service.AdminServiceImpl;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import sun.misc.IOUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
public class AdminController {
    @Autowired
    private AdminServiceImpl adminService;

    //管理员登录
    @PostMapping("/login")
    public int login(@RequestBody Admin admin) {
        List<Admin> admins = adminService.queryAllAdmin();
        for (Admin admin1 : admins) {
            if (admin1.getAname().equals(admin.getAname()) && admin1.getApwd().equals(admin.getApwd())) {
                return 1;//登录成功
            }
        }
        return 0;//登录失败
    }


    //用户
    @PostMapping("/addUser")
    public int addUser(@RequestBody User user) {
        return adminService.addUser(user);
    }

    @RequestMapping("/deleteUserById/{id}")
    public int deleteUserById(@PathVariable("id") int id) {
        return adminService.deleteUserById(id);
    }

    @PostMapping("/updateUser")
    public int updateUser(@RequestBody User user) {
        return adminService.updateUser(user);
    }

    @RequestMapping("/queryUserById/{id}")
    public User queryUserById(@PathVariable("id") int id) {
        return adminService.queryUserById(id);
    }

    @RequestMapping("/queryAllUser/{index}/{size}")
    public List<User> queryAllUser(@PathVariable("index") Integer index, @PathVariable("size") Integer size) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("currIndex", index);
        map.put("pageSize", size);
        return adminService.queryAllUser(map);
    }

    @RequestMapping("/queryUserCounts")
    public int queryUserCounts() {
        return adminService.queryUserCounts();
    }


    //景点
    @PostMapping("/addViews")
    public int addViews(@RequestBody Views views) {
        return adminService.addViews(views);
    }

    @RequestMapping("/deleteViewsById/{id}")
    public int deleteViewsById(@PathVariable("id") int id) {
        return adminService.deleteViewsById(id);
    }

    @PostMapping("/updateViews")
    public int updateViews(@RequestBody Views views) {
        return adminService.updateViews(views);
    }

    @RequestMapping("/queryViewsById/{id}")
    public Views queryViewsById(@PathVariable("id") int id) {
        return adminService.queryViewsById(id);
    }

    @RequestMapping("/queryAllViews/{index}/{size}")
    public List<Views> queryAllViews(@PathVariable("index") Integer index, @PathVariable("size") Integer size) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("currIndex", index);
        map.put("pageSize", size);
        return adminService.queryAllViews(map);
    }

    @RequestMapping("/queryViewsCounts")
    public int queryViewsCounts() {
        return adminService.queryViewsCounts();
    }

    //评价
    @PostMapping("/addComment")
    public int addComment(@RequestBody Comment comment) {
        return adminService.addComment(comment);
    }

    @RequestMapping("/deleteCommentById/{id}")
    public int deleteCommentById(@PathVariable("id") int id) {
        return adminService.deleteCommentById(id);
    }

    @PostMapping("/updateComment")
    public int v(@RequestBody Comment comment) {
        return adminService.updateComment(comment);
    }

    @RequestMapping("/queryCommentById/{id}")
    public Comment queryCommentById(@PathVariable("id") int id) {
        return adminService.queryCommentById(id);
    }

    @RequestMapping("/queryAllComment/{index}/{size}")
    public List<Comment> queryAllComment(@PathVariable("index") Integer index, @PathVariable("size") Integer size) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("currIndex", index);
        map.put("pageSize", size);
        return adminService.queryAllComment(map);
    }

    @RequestMapping("/queryCommentCounts")
    public int queryCommentCounts() {
        return adminService.queryCommentCounts();
    }

    @RequestMapping("/queryVidComment/{id}")
    public List<Comment> queryVidComment(@PathVariable("id") int id) {
        return adminService.queryVidComment(id);
    }

    //数据统计
    @RequestMapping("/dataStatistics")
    public List<HashMap<String, Object>> dataStatistics() {
        List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("currIndex", 0);
        map.put("pageSize", adminService.queryViewsCounts());
        List<Views> views = adminService.queryAllViews(map);
        List<Comment> comments;
        for (Views views1 : views) {
            int[] a = {0, 0, 0, 0, 0};
            int sum = 0;
            double avg = 0.0;
            int i = 0;
            HashMap<String, Object> map2 = new HashMap<String, Object>();
            map2.clear();
            comments = adminService.queryVidComment(views1.getVid());
            for (Comment comment : comments) {
                a[comment.getStar() - 1]++;
                sum += comment.getStar();
                i++;
            }
            avg = sum * 1.0 / i;
            map2.put("vid", views1.getVid());
            map2.put("vname", views1.getVname());
            map2.put("one", a[0]);
            map2.put("two", a[1]);
            map2.put("three", a[2]);
            map2.put("four", a[3]);
            map2.put("five", a[4]);
            map2.put("avg", avg);
            list.add(map2);
        }
        System.out.println(list);
        return list;
    }


    //上传图片
    @ResponseBody
    @RequestMapping(value = "/saveImg")
    public String handlerForUpload(@RequestParam("fileList") MultipartFile multipartFile, HttpServletRequest request) {
        //判断所上传文件是否存在
        if (multipartFile.isEmpty()) {
            return "上传错误";
        }
        //获取上传文件的原始名称
        String originalFilename = multipartFile.getOriginalFilename();

        //设置上传文件的保存地址目录

        String dirPath = request.getSession().
                getServletContext().getRealPath("/");
        String deploying = dirPath + "/WEB-INF/img/";
        int i = dirPath.indexOf("out");
        String root = dirPath.substring(0, i);
        dirPath = root + "/web/WEB-INF/img/";

        File filePath = new File(dirPath);
        File deployingFile = new File(deploying);
        //如果保存的地址不存在,就先创建目录
        if (!filePath.exists()) {
            filePath.mkdirs();
        }
        if(!deployingFile.exists()){
            deployingFile.mkdirs();
        }
        //获取当前文件名
        String newFileName = multipartFile.getOriginalFilename();

        File copyFile = new File(deploying + newFileName);


        try {
            FileUtils.copyInputStreamToFile(multipartFile.getInputStream(), copyFile);
            //创建可能会有错误,强制添加异常
            multipartFile.transferTo(new File(dirPath + newFileName));
        } catch (IOException e) {
            e.printStackTrace();
            return "上传错误";
        }
        System.out.println(dirPath + newFileName);
        System.out.println(deploying + newFileName);
        return originalFilename;
    }


}
