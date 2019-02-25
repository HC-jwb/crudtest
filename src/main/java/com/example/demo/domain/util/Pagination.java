package com.example.demo.domain.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Pagination {
	int rowsPerPage = 10;
	int currPage = 0;
	int pageCount = 0;
	int totalRowsCount = 0;
	int startPage = 0;
	int endPage = 0;
	int startRec = 0;
	int endRec = 0;
	
	public Pagination(int rowsPerPage, int currPage, int total) {
		this.rowsPerPage = rowsPerPage;
		this.currPage = currPage;
		this.totalRowsCount = total;
		
		calculate();
	}
	
	private void calculate() {
			pageCount = totalRowsCount/rowsPerPage;
		if(totalRowsCount % rowsPerPage != 0) {
			pageCount++;
		}
		
		startRec = currPage * rowsPerPage + 1;
		endRec = Math.min(totalRowsCount, startRec + rowsPerPage - 1);
		
		System.out.println(totalRowsCount);
	}
	
}
