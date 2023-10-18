<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.itheima.mapper.NoticeMapper">

    <resultMap id="GoodsResultMap" type="Notice">
        <!--    property：类id  column：数据库id   -->
    </resultMap>
    <delete id="del">
        delete
        from tb_notice
        where noticeId = #{noticeId};
    </delete>

    <select id="get" resultType="com.itheima.pojo.Notice">
        select *
        from tb_notice;
    </select>

    <select id="getAll" resultType="com.itheima.pojo.Notice">
        select *
        from tb_notice;
    </select>
    <select id="selectByNoticeId" resultType="com.itheima.pojo.Notice">
        select *
        from tb_notice
        where noticeId = #{noticeId};
    </select>
    <select id="selectByNoticeType" resultType="com.itheima.pojo.Notice">
        select *
        from tb_notice
        where noticeType = #{noticeType};
    </select>
    <select id="selectAll" resultType="com.itheima.pojo.Notice">
        select *
        from tb_notice
    </select>

    <insert id="insert">
        insert into tb_notice ()
        values (#{noticeId}, #{noticeType}, #{noticeDetail}, #{noticeDate},#{noticeName});
    </insert>

</mapper>