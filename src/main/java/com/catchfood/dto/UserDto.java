package com.catchfood.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class UserDto {
	private int userNum;
	private String userId;
	private String userPasswd;
	private String userEmail;
	private String userName;
	private LocalDate userBirth;
	private String userGender;
	private String userPhone;
	private String userAddress;
	private String userAddrdetail;
	private LocalDateTime userJoindate ;
	private String role;
} 
