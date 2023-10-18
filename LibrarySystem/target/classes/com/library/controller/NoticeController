package com.itheima.Servlet;

import com.alibaba.fastjson.JSON;
import com.itheima.mapper.NoticeMapper;
import com.itheima.pojo.Notice;
import com.itheima.util.SqlSessionFactoryUtils;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.io.BufferedReader;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@WebServlet("/NoticeServlet")
public class NoticeServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "get":
                get(request, response);
                break;
            case "del":
                del(request, response);
                break;
            case "insert":
                insertnotice(request, response);
                break;
            case "getById":
                getById(request, response);
                break;
            case "getByType":
                getByType(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        this.doGet(request, response);
    }

    protected static void get(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //BufferedReader reader = request.getReader();
        response.setContentType("text/html;charset=UTF-8");
        SqlSessionFactory sqlSessionFactory = SqlSessionFactoryUtils.getSqlSessionFactory();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
        ArrayList<Notice> notice1 = mapper.getAll();
        String s = com.alibaba.fastjson2.JSON.toJSONString(notice1);
        //System.out.println(s);
        response.getWriter().write(s);
        sqlSession.close();
    }

    protected static void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        SqlSessionFactory sqlSessionFactory = SqlSessionFactoryUtils.getSqlSessionFactory();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
        int count = mapper.del(id);
        response.setContentType("text/html;charset=UTF-8");
        if (count != 0) {
            response.getWriter().write("1");
        } else response.getWriter().write("0");
        sqlSession.commit();
        sqlSession.close();
    }

    protected static void insertnotice(HttpServletRequest request, HttpServletResponse response) throws IOException {
        BufferedReader reader = request.getReader();
        String s = reader.readLine();
        //System.out.println(s);
        //JSON转化pojo类对象
        Notice notice = JSON.parseObject(s, Notice.class);
        //test
        //System.out.println(user.toString());
        notice.setNoticeDate(LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));

        //获取SqlSessionFactory对象 执行mybatis
        SqlSessionFactory sqlSessionFactory = SqlSessionFactoryUtils.getSqlSessionFactory();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);

        //执行sql语句
        int Update = mapper.insert(notice);

        response.setContentType("text/html;charset=UTF-8");
        //返回数据
        if (Update == 1) {
            response.getWriter().write("1");
        } else response.getWriter().write("0");

        //提交事务
        sqlSession.commit();
        sqlSession.close();

    }

    protected static void getById(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //System.out.println("getbyid");
        SqlSessionFactory sqlSessionFactory = SqlSessionFactoryUtils.getSqlSessionFactory();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);
        int id = Integer.parseInt(request.getParameter("id"));
        Notice notice = mapper.selectByNoticeId(id);
        String s = com.alibaba.fastjson2.JSON.toJSONString(notice);
        //System.out.println(s);
        response.getWriter().write(s);
        sqlSession.close();
    }

    protected static void getByType(HttpServletRequest request, HttpServletResponse response) throws IOException {
        SqlSessionFactory sqlSessionFactory = SqlSessionFactoryUtils.getSqlSessionFactory();
        SqlSession sqlSession = sqlSessionFactory.openSession();
        NoticeMapper mapper = sqlSession.getMapper(NoticeMapper.class);

        int noticeType = Integer.parseInt(request.getParameter("noticeType"));
        ArrayList<Notice> notices;
        if (noticeType==0)notices = mapper.selectAll();
        else notices = mapper.selectByNoticeType(noticeType);
        String s = JSON.toJSONString(notices);
        //System.out.println(s);
        response.getWriter().write(s);
        sqlSession.close();
    }

}