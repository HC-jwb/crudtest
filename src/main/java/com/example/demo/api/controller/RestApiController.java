package com.example.demo.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.domain.ResponseContainer;
import com.example.demo.service.CrudService;

@RestController
@RequestMapping("/api/crud")
public class RestApiController{
	@Autowired
	private CrudService crudService;
	
	@RequestMapping("/delete/{crudId}")
	public ResponseContainer<Void> deleteData(@PathVariable("crudId") Long id) {
		ResponseContainer<Void> response = new ResponseContainer<>(); 
		try {
			crudService.deleteData(id);
			response.setSuccess(true);
		} catch(Exception e) {
			e.printStackTrace();
		}
				
		return response;
	}
	
	@RequestMapping("/insert/{userName}/{userId}")
	public ResponseContainer<Void> insertData(@PathVariable("userName") String userName, @PathVariable("userId") String userId) {
		ResponseContainer<Void> response = new ResponseContainer<>(); 
		try {
			System.out.println("userName=" + userName);
			System.out.println("userId=" + userId);
			
			crudService.insertData(userName, userId);
			response.setSuccess(true);
		} catch(Exception e) {
			e.printStackTrace();
		}		
		return response;
	}
	
	@RequestMapping("/edit/{changedUserName}/{changedUserId}/{crudId}") 
	public ResponseContainer<Void> editData(@PathVariable("changedUserName") String changedUserName, @PathVariable("changedUserId") String changedUserId, @PathVariable("crudId") Long id) {
		ResponseContainer<Void> response = new ResponseContainer<>();
		try {
			System.out.println("changedUserName=" + changedUserName);
			System.out.println("changedUserId=" + changedUserId);
			
			crudService.editData(changedUserName, changedUserId, id);
			response.setSuccess(true);
		} catch(Exception e) {
			e.printStackTrace();
		}		
		return response;
	}
	
	
	@RequestMapping("/p/{pageNo}/{rowsPerPage}") 
	public ResponseContainer<Void> rowsPerPageData(@PathVariable("rowsPerPage") String rowsPerPage) {
		ResponseContainer<Void> response = new ResponseContainer<>();
		try {
			System.out.println("rowsPerPage = " + rowsPerPage);
			
			response.setSuccess(true);
			
		} catch(Exception e) {
			e.printStackTrace();
		}		
		return response;
	}
	
	
}