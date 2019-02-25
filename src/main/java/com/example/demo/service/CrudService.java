package com.example.demo.service;

public interface CrudService{
	public void deleteData(Long id);
	public void insertData(String userName, String userId);
	public void editData(String changedUserName, String changedUserId, Long id);
	public int getTotalRows();
}