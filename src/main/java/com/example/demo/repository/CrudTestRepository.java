package com.example.demo.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Crud;

@Repository
public interface CrudTestRepository extends JpaRepository<Crud, Long>{
	@Query(value="select c from Crud c")
	List<Crud> findAllCrudList();
	
	@Modifying
//	@Transactional
	@Query(value="insert into crud_test (user_name, user_id) VALUES (:userName, :userId)", nativeQuery=true)
	public void insertData(@Param("userName") String userName, @Param("userId") String userId);
	
	@Modifying
//	@Transactional
	@Query(value="delete from crud_test where id=:deleteId", nativeQuery=true)
	public void deleteData(@Param("deleteId") Long id);
	
	
	@Modifying
//	@Transactional
	@Query(value="update crud_test set user_name=:changedUserName, user_id=:changedUserId where id = :editId", nativeQuery=true)
	public void editData(@Param("changedUserName") String changedUserName, @Param("changedUserId") String changedUserId, @Param("editId") Long id);
	
	
	
}