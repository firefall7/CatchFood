package com.catchfood.dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class NoticeDto {
    private int noticeNum;       
    private String noticeTitle;   
    private String noticeContent; 
    private String noticeType;    //  ENUM('긴급', '상시', '일반', '이벤트') NOT NULL,  -- 공지 유형
    private Timestamp noticeDate;   
    private Integer  noticePinned    ;
    private Integer  noticeActive    ;
    private int noticeViewCount ;
    private String noticeAdminId  ;
}