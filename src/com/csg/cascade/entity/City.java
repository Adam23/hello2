package com.csg.cascade.entity;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 城市类
 * @author Administrator
 *
 */
public class City {
	private String code;
	private String name;
	private Map countries = new LinkedHashMap();
	
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
	public Map getCountries() {
		return countries;
	}
	public void setCountries(Map countries) {
		this.countries = countries;
	}
	
}
