package com.example.demo.service;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.CrudTestRepository;

@Service
public class CrudServiceImpl implements CrudService{
	@Autowired
	CrudTestRepository crudTestRepository;
	
	@Override
	@Transactional
	public void deleteData(Long id) {
		crudTestRepository.deleteData(id);
	}
	
	@Override
	@Transactional
	public void insertData(String userName, String userId) {
		System.out.println("in insertData of CrudServiceimpl");
		crudTestRepository.insertData(userName, userId);
	}
	
	@Override
	@Transactional
	public void editData(String changedUserName, String changedUserId, Long id) {
		System.out.println("in editData of CrudServiceimpl");
		crudTestRepository.editData(changedUserName, changedUserId, id);
	}
}