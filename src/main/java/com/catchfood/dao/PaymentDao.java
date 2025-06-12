package com.catchfood.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.catchfood.dto.PaymentDto;
@Mapper
public interface PaymentDao {

	public int insertPayment(PaymentDto paymentdto);
	
	String findImpUidByReservationNum(@Param("reservationNum") int reservationNum);
	
	void deleteByReservationNum(@Param("reservationNum") int reservationNum);
} 