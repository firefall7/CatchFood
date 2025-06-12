package com.catchfood.dto;

import lombok.Data;

@Data
public class PaymentDto {
	private int paymentNum;
	private String paymentStatus;
	private int reservationNum;
	private String impUid;

} 
