package com.xxxy.test;


import com.xxxy.service.AdminServiceImpl;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.util.Date;

public class MyTest {
    ApplicationContext applicationContext=new ClassPathXmlApplicationContext("applicationContext.xml");
    AdminServiceImpl adminService=(AdminServiceImpl) applicationContext.getBean("adminServiceImpl");

    @Test
    public void test() throws IOException {
       // User user=new User(2017211777,"2","1","1");
        //System.out.println(adminService.queryAllUser());
       //Views views=new Views(2,"3","2","2",2,2,"2");
       // adminService.addViews(views);
        //System.out.println(adminService.queryViewsById(1));
        //adminService.updateViews(views);
       // adminService.deleteViewsById(2);
        //System.out.println(adminService.queryAllAdmin());
       // Comment comment=new Comment(4,3,3,"1",1,new Date());
        //adminService.updateComment(comment);
       // System.out.println(adminService.queryAllComment());
      //  System.out.println(adminService.queryCommentById(4));
        adminService.deleteCommentById(4);
    }
}
