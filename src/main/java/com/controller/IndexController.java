package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.ProductDAO;
import com.dao.UserDAO;
import com.modal.Users;

@Controller
public class IndexController {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping(value ="/",method=RequestMethod.GET)
	public String index(Model m){
		
	    m.addAttribute("productList",productDAO.list());
		return "welcome";
	}	
	
	
	@RequestMapping(value ="/home",method=RequestMethod.GET)
	public String Home()
	{
		return "redirect:/";
	}
	@RequestMapping(value ="/my-page",method=RequestMethod.GET)
	public String MainPage(){
			   
		return "MainPage";
	}	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String  toregister(Model  m)
	{
		m.addAttribute("users",new Users()) ;
		 return "registration";
	}
	@RequestMapping(value="saveUser", method=RequestMethod.POST)
	public String createUser(@ModelAttribute("users") Users users){
		users.setEnabled(true);
		users.setRole("ROLE_USER");
		userDAO.saveUser(users);                
		return "redirect:/";
	}
	@RequestMapping("/logout")
	public String logout(){
		return "home";
	}
	@RequestMapping("/welcome")
	public String welcome(){
		return "home";
	}
}
