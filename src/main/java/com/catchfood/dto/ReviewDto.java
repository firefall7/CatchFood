package com.catchfood.dto;

import java.time.LocalDateTime;

import lombok.Data;
@Data
public class ReviewDto {
	private int reviewNum;
	private int reviewStars;
	private String reviewContent;
	private LocalDateTime reviewDay;
	private String reviewImage;
	private int userNum;
	private String userId;
} 
