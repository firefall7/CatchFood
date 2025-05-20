package com.catchfood.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.catchfood.dto.UserDto;

@Mapper
public interface UserDao {
	//예약 + 비밀번호 찾기(아이디)
	public UserDto findByUserId(String userId); 
	
	// 회원가입
	public int registerProcess(UserDto user); 
	
    //login
    UserDto login(@Param("userId") String userId, @Param("userPasswd") String userPasswd);
    
    //회원 정보 수정(num으로 가져오기)
    UserDto userInformationUpdate(@Param("userNum") int userNum); 
    
    //회원 비밀번호 수정
    int userPasswordChange(@Param("userNum") int userNum, @Param("userPasswd") String userPasswd);
    
    //회원 리스트
    List<UserDto> userList();
    
    //아이디 찾기(이메일)
    public String findUserIdByEmail(String userEmail);
    
   
  
}
