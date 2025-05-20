package com.catchfood.dto;

import lombok.Data;

@Data
public class MenuDto {
    private int menuNum;
    private String menuName;
    private int menuPrice;
    private String menuDescription;
    private String menuImage;
    private Integer menuRecommend;  
    private int categoryNum;
    private int menuCount;
    private int menuPTotal;
}