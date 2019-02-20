package com.example.demo.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.ResponseContainer;
import com.example.demo.model.crud;

@Repository
public interface CrudTestRepository extends JpaRepository<crud, Long>{
	@Query(value="select c from crud c")
	List<crud> findAllCrudList();
	
	@Modifying
	@Transactional
	@Query(value="insert into crud_test (userName, userId) VALUES ('눈사람', 'snowman')", nativeQuery=true)
	void insertData();
	
	@Modifying
//	@Transactional
	@Query(value="delete from crud_test where id=:deleteId", nativeQuery=true)
	public void deleteData(@Param("deleteId") Long id);
	
}