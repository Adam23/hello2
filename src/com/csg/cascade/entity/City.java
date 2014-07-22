package com.csg.cascade.entity;

import java.util.HashMap;
import java.util.Map;

/**
 * 城市类
 * @author Administrator
 *
 */
public class City {
	private String code;
	private String name;
	private Map<String , Country> countries = new HashMap();
	
	public City(String code,String name){
		this.code = code;
		this.name = name;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Map<String, Country> getCountries() {
		return countries;
	}
	public void setCountries(Map<String, Country> countries) {
		this.countries = countries;
	} 
	

}
