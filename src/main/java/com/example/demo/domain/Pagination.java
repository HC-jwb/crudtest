package com.example.demo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Pagination {
	
	int rowsPerPage = 10;
	int currPage = 0;
	
	
	
}
