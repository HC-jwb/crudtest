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

}