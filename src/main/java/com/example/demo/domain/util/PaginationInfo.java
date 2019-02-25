package com.example.demo.domain.util;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaginationInfo<T> {
	private boolean first;
	private boolean last;
	private List<T> items;
	private int number;
	private long totalCount;
}
