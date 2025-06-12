package com.catchfood.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import com.catchfood.dto.MenuDto;
@Mapper
public interface MenuDao {
	List<MenuDto> getMenusByCategory(int categoryNum); 
	public MenuDto menudetail(@RequestParam("menuNum") int menuNnum);
    public int insertmenu(MenuDto menudto);
    public int updatemenu(MenuDto menudto);
    public void deletemenu(@RequestParam("menuNum") int menuNnum);
    List<MenuDto> recommendmenu();
} 