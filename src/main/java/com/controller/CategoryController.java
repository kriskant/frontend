package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.CategoryDAO;
import com.modal.Category;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	
	@RequestMapping(value="/category",method=RequestMethod.GET)
	public String insertCategory(@ModelAttribute("category") Category category,Model model,BindingResult result){
		model.addAttribute("category",new Category());
		List<Category> categoryList = categoryDAO.retrieveCategory();
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("CategoryPageClicked", "true");
		return "categoryenter";	
	}
	@RequestMapping(value="/saveCategory",method=RequestMethod.POST)
	public String createCategory(@ModelAttribute("category") Category category, Model model,BindingResult result,
			RedirectAttributes redirectAttrs){
		categoryDAO.insertCategory(category);
		String message = "Category " + category.getCategoryid() + " was successfully added";
        model.addAttribute("message", message);
        return "redirect:/category";
		
	}   
	/*@RequestMapping("/catlist")
	public ModelAndView categoryList(){
		ModelAndView mv=new ModelAndView();
		mv.addObject("categoryList",categoryDAO.retrieveCategory());
		mv.setViewName("catlist");
		return mv;
	}*/
	@RequestMapping("editcategory/{id}")
	public String editCategory(@PathVariable("id") int id, Model model,RedirectAttributes attributes) {
		System.out.println("editCategory");
		attributes.addFlashAttribute("category", this.categoryDAO.getCategoryById(id));
		return "redirect:/category";
	}
	@RequestMapping(value ="removecategory/{id}")
	public String removeCategory(@PathVariable("id") int id,RedirectAttributes attributes) throws Exception {
		categoryDAO.removeCategoryById(id);
		attributes.addFlashAttribute("DeleteMessage", "Category has been deleted Successfully");
		return "redirect:/category";
	}
	
}
