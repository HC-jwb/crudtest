package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.domain.util.Pagination;
import com.example.demo.model.Crud;
import com.example.demo.repository.CrudTestRepository;
import com.example.demo.service.CrudService;

@Controller
@RequestMapping("crud")
public class WebController{
	@Autowired
	CrudTestRepository testRepository;
	
	@Autowired
	CrudService crudService;
	
	@RequestMapping("")
	public String login(Model model) {
//		List<Crud> crudList = testRepository.findAllCrudList();
		List<Crud> crudList = testRepository.findAll();
		System.out.println("crudList id -> " + crudList.get(0).getId());
		model.addAttribute("crudList", crudList);
		model.addAttribute("pnav", new Pagination(10, 0, (int) testRepository.count()));
		return "crud";
	}
	
	@GetMapping("/p/{pageNo}/{rowsPerPage}") 
	public String pageNoAndrowsPerPageAData(Model model, @PathVariable("pageNo") int pageNo, @PathVariable("rowsPerPage") int rowsPerPage) {
		System.out.print("in WebController");
		Pageable pageInfo = PageRequest.of(pageNo, rowsPerPage);
		Page<Crud> page = testRepository.findAll(pageInfo);
		List<Crud> crudListInPage = page.getContent();
//		ResponseContainer<Void> response = new ResponseContainer<>();
		try {
			System.out.println("rowsPerPage = " + rowsPerPage);
			Pagination pnav = new Pagination(rowsPerPage, pageNo,(int) testRepository.count() );
			model.addAttribute("crudList", crudListInPage);
			model.addAttribute("pnav", pnav);
		} catch(Exception e) {
			e.printStackTrace();
		}		
		return "crud";
	}
}

