package com.itheima.pojo;

public class Notice {
    private int noticeId;
    private int noticeType;
    private String noticeDetail;
    private String noticeDate;

    private String noticeName;

    public int getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(int noticeId) {
        this.noticeId = noticeId;
    }

    public int getNoticeType() {
        return noticeType;
    }

    public void setNoticeType(int noticeType) {
        this.noticeType = noticeType;
    }

    public String getNoticeDetail() {
        return noticeDetail;
    }

    public void setNoticeDetail(String noticeDetail) {
        this.noticeDetail = noticeDetail;
    }

    public String getNoticeDate() {
        return noticeDate;
    }

    public void setNoticeDate(String noticeDate) {
        this.noticeDate = noticeDate;
    }

    public String getNoticeName() {
        return noticeName;
    }

    public void setNoticeName(String noticeName) {
        this.noticeName = noticeName;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "noticeId=" + noticeId +
                ", noticeType=" + noticeType +
                ", noticeDetail='" + noticeDetail + '\'' +
                ", noticeDate='" + noticeDate + '\'' +
                ", noticeName='" + noticeName + '\'' +
                '}';
    }
}
