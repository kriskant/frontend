package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.CartDAO;
import com.dao.ProductDAO;
import com.modal.Cart;
import com.modal.Product;

@Controller
public class CartController {

	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping(value="addToCart/{id}")
    public String addProductToCart(@PathVariable("id") int id, HttpSession session,Model model,RedirectAttributes attributes)
    {
    	int userId = (Integer) session.getAttribute("userid");
    	System.out.println("HELLO:"+userId);
    	int q=1;
    	if (cartDAO.getitem(id, userId) != null) {
			Cart item = cartDAO.getitem(id, userId);			
			item.setQuantity(item.getQuantity() + q);			
			Product p = productDAO.getProductById(id);			
			System.out.println(item);
			item.setPrice(p.getPrice());
			item.setSubTotal(item.getQuantity() *p.getPrice());
			cartDAO.saveProductToCart(item);
			attributes.addFlashAttribute("ExistingMessage",  p.getName() +"is already exist");
	
			return "redirect:/";
		} else {
			Cart item = new Cart();
			Product p = productDAO.getProductById(id);
			item.setProductid(p.getProductid());
			item.setName(p.getName());
			item.setUserId(userId);
			item.setQuantity(q);
			item.setStatus("C");
			item.setSubTotal(q * p.getPrice());
			item.setPrice(p.getPrice());
			cartDAO.saveProductToCart(item);
			attributes.addFlashAttribute("SuccessMessage", "Item"+p.getName()+" has been deleted Successfully");
			return "redirect:/";
		}
    	
    }
    @RequestMapping("/cart")
	public String viewCart(Model model, HttpSession session) {
    	
		model.addAttribute("CartList", cartDAO.listCart());
		 if(cartDAO.cartsize((Integer) session.getAttribute("userid"))!=0){
			
			model.addAttribute("CartPrice", cartDAO.CartPrice((Integer) session.getAttribute("userid")));
		} else {
			model.addAttribute("EmptyCart", "true");
		}
		model.addAttribute("IfViewCartClicked", "true");
		return "Cart";
	}
	@RequestMapping("editCart/{cartid}")
	public String editorder(@PathVariable("cartid") int cartid, @RequestParam("quantity") int q, HttpSession session) {
	
		int userId = (Integer) session.getAttribute("userid");
		Cart cart = cartDAO.editCartById(cartid);
		Product p = productDAO.getProductById(cart.getProductid());
		cart.setQuantity(q);
		cart.setPrice(q * p.getPrice());
		cart.setSubTotal(q * p.getPrice());
		cartDAO.saveProductToCart(cart);
		session.setAttribute("cartsize", cartDAO.cartsize((Integer) session.getAttribute("userid")));
		return "redirect:/cart";
	}   
@RequestMapping(value="removeCart/{id}")
public String deleteorder(@PathVariable("id") int id, HttpSession session) {
	cartDAO.removeCartById(id);
	session.setAttribute("cartsize", cartDAO.cartsize((Integer) session.getAttribute("userid")));
	return "redirect:/cart";
}
@RequestMapping("continue_shopping")
public String continueshopping()
{
return "redirect:/";	
}
}
