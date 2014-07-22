package com.csg.cascade.entity;

import java.util.HashMap;
import java.util.Map;

/**
 * 省份类
 * @author Administrator
 *
 */
public class Province {
	private String code;
	private String name;
	private Map<String, City> cities = new HashMap();
	
	public Province(String code,String name){
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
	public Map<String, City> getCities() {
		return cities;
	}
	public void setCities(Map<String, City> cities) {
		this.cities = cities;
	}
	
}
