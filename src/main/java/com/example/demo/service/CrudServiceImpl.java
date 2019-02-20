package com.example.demo.service;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.ResponseContainer;
import com.example.demo.repository.CrudTestRepository;

@Service
public class CrudServiceImpl implements CrudService{
	@Autowired
	CrudTestRepository crudTestRepository;
	
	@Override
	@Transactional
	public void deleteData(Long id) {
		System.out.println("impl test!");
		crudTestRepository.deleteData(id);
	}
	
}