package com.example.demo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ResponseContainer<T>{
	private Boolean success;
	//private ResponseCode responseCode;
	T payload;
	private String errMessage;
}