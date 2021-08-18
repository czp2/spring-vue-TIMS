package com.xxxy.mapper;


import com.xxxy.pojo.Admin;
import com.xxxy.pojo.Comment;
import com.xxxy.pojo.User;
import com.xxxy.pojo.Views;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface AdminMapper {

    //查询全部管理员,返回list集合
    List<Admin> queryAllAdmin();


    //增加一个用户
    int addUser(User user);
    //根据id删除一个用户
    int deleteUserById(int id);
    //修改用户
    int updateUser(User user);
    //根据id查询,返回一个用户
    User queryUserById(int id);
    //查询全部用户,返回list集合
    List<User> queryAllUser(Map<String,Object> data);
    //返回用户数量
    int queryUserCounts();

    User queryUserByEmail(String email);

    //增加一个景点
    int addViews(Views views);
    //根据id删除一个景点
    int deleteViewsById(int id);
    //修改景点
    int updateViews(Views views);
    //根据id查询,返回一个景点
    Views queryViewsById(int id);
    //查询全部景点,返回list集合
    List<Views> queryAllViews(Map<String,Object> data);
    //返回景点数量
    int queryViewsCounts();

    //增加一个评价
    int addComment(Comment comment);
    //根据id删除一个评价
    int deleteCommentById(int id);
    //修改评价
    int updateComment(Comment comment);
    //根据id查询,返回一个评价
    Comment queryCommentById(int id);
    //查询全部评价,返回list集合
    List<Comment> queryAllComment(Map<String,Object> data);
    //返回评价数量
    int queryCommentCounts();
    //根据景点vid返回所有评价
    List<Comment> queryVidComment(int vid);

}
