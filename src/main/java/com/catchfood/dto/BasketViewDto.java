package com.catchfood.dto;

import lombok.Data;

@Data
public class BasketViewDto {
		private int reservationNum;
	    private String reservationDate;
	    private int reservationNumber;
	    private String reservationRequest;

	    private String menuName;
	    private int basketCount;
	    private int basketPTotal;
} 
