package com.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.CategoryDAO;
import com.dao.SupplierDAO;
import com.dao.UserDAO;
import com.modal.Product;
import com.modal.Users;

@Controller
public class HomeController 
{
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private SupplierDAO supplierDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	
	@RequestMapping("/login")
    public String login(@RequestParam(value="error",required=false) String error,
    		@RequestParam(value="logout",required=false) String logout,
    		Model model){
    	if(error!=null)
    		model.addAttribute("error","Invalid Username and Password.. Please enter valid username and password");
    	if(logout!=null)
    		model.addAttribute("logout","Loggedout successfully");
    		model.addAttribute("LoginPageClicked", true);
    	return "login";
    	
    }
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/login_session_attributes")
	public String login_session_attributes(HttpSession session,Model model) 
	{
		String email = SecurityContextHolder.getContext().getAuthentication().getName();		
		Users user = userDAO.get(email);
		session.setAttribute("userid", user.getId());
		session.setAttribute("name", user.getEmail());
		session.setAttribute("LoggedIn", "true");
		System.out.println(session.getAttribute("userid"));
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
		.getAuthentication().getAuthorities();
		String role="ROLE_USER";
		for (GrantedAuthority authority : authorities) 
		{
			session.setAttribute("user",user);
		     if (authority.getAuthority().equals(role)) 
		     {
		    	 session.setAttribute("UserLoggedIn", "true");
		    	 return "redirect:/";
		     }
		     else 
		     {
		    	 session.setAttribute("Administrator", "true");
		    	 model.addAttribute("product",  new Product());
		    	 model.addAttribute("ProductPageClicked", "true");
		    	 model.addAttribute("supplierList",supplierDAO.retrieveSupplier());
		    	 model.addAttribute("categoryList",categoryDAO.retrieveCategory());
			 return "/Admin";
		     }
	    }		
		return "/welcome";	
	}
}
