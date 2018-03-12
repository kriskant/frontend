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

import com.dao.SupplierDAO;
import com.modal.Supplier;

@Controller
public class SupplierController {
	
	@Autowired
	private SupplierDAO supplierDAO;
	@RequestMapping(value="/supplier",method=RequestMethod.GET)
	public String insertsupplier(@ModelAttribute("supplier")Supplier supplier,Model model,BindingResult result){
		model.addAttribute("supplier", new Supplier());
		List<Supplier> supplierList = supplierDAO.retrieveSupplier();
        model.addAttribute("supplierList", supplierList);
        model.addAttribute("SupplierPageClicked", "true");
		return "supplierenter";
	}	
	@RequestMapping(value="/saveSupplier", method=RequestMethod.POST)
	public String createSupplier(@ModelAttribute("suppliers") Supplier suppliers,
			Model model){
		supplierDAO.insertSupplier(suppliers);   
		String message = "Supplier " + suppliers.getSupplierid() + " was successfully added";
        model.addAttribute("message", message);
        return "redirect:/supplier";	
	}	
	/*@RequestMapping("/supplist")
	public ModelAndView supplierList(){
		ModelAndView mv=new ModelAndView();
		mv.addObject("supplierList",supplierDAO.retrieveSupplier());
		mv.setViewName("supplist");
		return mv;
	}*/
	@RequestMapping("editsupplier/{id}")
	public String editSupplier(@PathVariable("id") int id, Model model,RedirectAttributes attributes) {
		System.out.println("editCategory");
		attributes.addFlashAttribute("supplier", this.supplierDAO.getSupplierById(id));
		return "redirect:/supplier";
	}
	@RequestMapping(value = "removesupplier/{id}")
	public String removeSupplier(@PathVariable("id") int id,RedirectAttributes attributes) throws Exception {
		supplierDAO.removeSupplierById(id);
		attributes.addFlashAttribute("DeleteMessage", "supplier has been deleted Successfully");
		return "redirect:/supplier";
	}
}
