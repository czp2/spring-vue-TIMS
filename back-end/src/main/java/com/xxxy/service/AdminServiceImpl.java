package com.xxxy.service;


import com.xxxy.mapper.AdminMapper;
import com.xxxy.pojo.Admin;
import com.xxxy.pojo.Comment;
import com.xxxy.pojo.User;
import com.xxxy.pojo.Views;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminMapper adminMapper;

    //管理员
    public List<Admin> queryAllAdmin() {
        return adminMapper.queryAllAdmin();
    }

    //用户
    public int addUser(User user) { return adminMapper.addUser(user); }
    public int deleteUserById(int id) {
        return adminMapper.deleteUserById(id);
    }
    public int updateUser(User user) { return adminMapper.updateUser(user); }
    public User queryUserById(int id) {
        return adminMapper.queryUserById(id);
    }
    public List<User> queryAllUser(Map<String,Object> data) {
        return adminMapper.queryAllUser(data);
    }

    public int queryUserCounts() {
        return adminMapper.queryUserCounts();
    }

    @Override
    public User queryUserByEmail(String email) {
        return adminMapper.queryUserByEmail(email);
    }

    //景点
    public int addViews(Views views) { return adminMapper.addViews(views); }
    public int deleteViewsById(int id) {
        return adminMapper.deleteViewsById(id);
    }
    public int updateViews(Views views) {
        return adminMapper.updateViews(views);
    }
    public Views queryViewsById(int id) {
        return adminMapper.queryViewsById(id);
    }
    public List<Views> queryAllViews(Map<String,Object> data) {
        return adminMapper.queryAllViews(data);
    }

    public int queryViewsCounts() {
        return adminMapper.queryViewsCounts();
    }

    //评价
    public int addComment(Comment comment) { return adminMapper.addComment(comment); }
    public int deleteCommentById(int id) {
        return adminMapper.deleteCommentById(id);
    }
    public int updateComment(Comment comment) {
        return adminMapper.updateComment(comment);
    }
    public Comment queryCommentById(int id) {
        return adminMapper.queryCommentById(id);
    }
    public List<Comment> queryAllComment(Map<String,Object> data) {
        return adminMapper.queryAllComment(data);
    }

    public int queryCommentCounts() {
        return adminMapper.queryCommentCounts();
    }

    public List<Comment> queryVidComment(int vid) {
        return adminMapper.queryVidComment(vid);
    }


}



