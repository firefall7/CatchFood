package com.catchfood.dto;

import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;
@Data
public class ReservationDto {
	private int reservationNum; 
	private String reservationDate; 
	private Integer reservationNumber;
	private String reservationRequest;
	private LocalDateTime reservationNow; 
	private Integer userNum; 
	
	private List<String> menuName;
	private List<Integer> menuPrice;
	private List<Integer> menuCount;
	
	private List<Integer> menuNum;
    private List<Integer> menuTotal;
}
