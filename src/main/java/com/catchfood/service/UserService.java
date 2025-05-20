package com.catchfood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.catchfood.dao.UserDao;
import com.catchfood.dto.UserDto;

@Service
public class UserService {
	
    @Autowired
    UserDao userDao;
    
    //암호화 선언
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    
    //암호화
    public boolean register(UserDto user) {
        String rawPassword = user.getUserPasswd();
        String encryptedPassword = passwordEncoder.encode(rawPassword);
        user.setUserPasswd(encryptedPassword);

        return userDao.registerProcess(user) > 0;
    }
    
    //저장된 정보랑 비교해서 검증
    public UserDto login(String userId, String rawPassword) {
        UserDto user = userDao.findByUserId(userId);
        if (user != null && passwordEncoder.matches(rawPassword, user.getUserPasswd())) {
            return user;
        }
        return null;
    }
    
    //로그인할떄, db랑 비교
    public void updatePassword(int userNum, String newRawPassword) {
        String encrypted = passwordEncoder.encode(newRawPassword);
        userDao.userPasswordChange(userNum, encrypted);
    }
    
    //아이디 중복검사(내부애 아이디 존재하는지 확인)
    public boolean isUserIdAvailable(String userId) {
        UserDto user = userDao.findByUserId(userId);
        return user == null;
    }
    
    //아이디 찾기
    public String findUserIdByEmail(String userEmail) {
        return userDao.findUserIdByEmail(userEmail);
    }
    
    //비밀번호 찾기
    public String findUserPasswdById(String userId) {
        return userDao.findUserPasswdById(userId);
    }

}
