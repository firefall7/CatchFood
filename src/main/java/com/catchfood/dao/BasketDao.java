package com.catchfood.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.catchfood.dto.BasketDto;
import com.catchfood.dto.BasketViewDto;
@Mapper
public interface BasketDao {
	public int BasketInsert(BasketDto basketdto);
	List<BasketDto> BasketList(int reservationNum);
	List<BasketViewDto> MyBasket(@RequestParam("userNum") int userNum);
} 
