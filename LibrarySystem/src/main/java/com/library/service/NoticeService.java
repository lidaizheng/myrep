package com.itheima.mapper;

import com.itheima.pojo.Notice;

import java.util.ArrayList;

public interface NoticeMapper {
    ArrayList<Notice> getAll();
    int insert(Notice notice);
    int del(int noticeId);
    //    int update(Notice notice);
    Notice selectByNoticeId(int id);
    ArrayList<Notice> selectByNoticeType(int noticeType);

    ArrayList<Notice> selectAll();
}
