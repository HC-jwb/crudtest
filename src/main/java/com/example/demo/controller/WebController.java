package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.domain.Pagination;
import com.example.demo.model.Crud;
import com.example.demo.repository.CrudTestRepository;

@Controller
@RequestMapping("/")
public class WebController{
	@Autowired
	CrudTestRepository testRepository;
	
	@RequestMapping("crud")
	public String login(Model model) {
		Pagination pnav = new Pagination();
		
		List<Crud> crudList = testRepository.findAllCrudList();
		System.out.println("crudList id -> " + crudList.get(0).getId());
		model.addAttribute("crudList", crudList);
		model.addAttribute("pnav", pnav);
		return "crud";
	}
	
}