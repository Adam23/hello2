package com.csg.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.csg.cascade.entity.City;
import com.csg.cascade.entity.Country;
import com.csg.cascade.entity.Province;

public class CascadeServlet extends HttpServlet {
	Map provinces = new HashMap();
	public void init(){
		//三级数据
		Country c1 = new Country("HN_PY_NL", "南乐县");
		Country c2 = new Country("HN_PY_QF", "清丰县");
		Country c3 = new Country("HN_PY_FX", "范县");
		Country c4 = new Country("LN_SY_HNX", "浑南新区");
		Country c5 = new Country("LN_YK_ZQ", "站前区");
		
		City ci1 = new City("HN_PY", "濮阳");
		City ci2 = new City("LN_SY", "沈阳");
		City ci3 = new City("LN_YK", "营口");
		
		ci1.getCountries().put(c1.getCode(), c1);
		ci1.getCountries().put(c2.getCode(), c2);
		ci1.getCountries().put(c3.getCode(), c3);
		ci2.getCountries().put(c4.getCode(), c4);
		ci3.getCountries().put(c5.getCode(), c5);
		
		Province p1 = new Province("HN", "河南");
		Province p2 = new Province("LN", "辽宁");
		
		p1.getCities().put(ci1.getCode(), ci1);
		p2.getCities().put(ci2.getCode(), ci2);
		p2.getCities().put(ci3.getCode(), ci3);
		
		//二级数据
		City ci4 = new City("BJ_HD", "海淀区");
		City ci5 = new City("BJ_CY", "朝阳区");
		
		Province p3 = new Province("BJ", "北京");
		p3.getCities().put(ci4.getCode(), ci4);
		p3.getCities().put(ci5.getCode(), ci5);
		
		provinces.put(p1.getCode(), p1);
		provinces.put(p2.getCode(), p2);
		provinces.put(p3.getCode(), p3);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String outstr = null;
		String method = request.getParameter("method");
		if(method == null||method.equals("findProvince")){
			outstr = findProvince();
		}else if(method.equals("findCityByProvinceId")){
			String provinceId = request.getParameter("provinceId");
			outstr = findCityByProvinceId(provinceId);
			
		}else if(method.equals("findCounByCityId")){
			String provinceId = request.getParameter("provinceId");
			String cityId = request.getParameter("cityId");
			outstr = findCounByCityId(provinceId,cityId);
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("type/plain,charset=utf-8");
		response.getWriter().println(outstr);
	}
	
	/**
	 * 根据城市编码查询对应县区
	 * @param provinceId 省份编码
	 * @param cityId 城市编码
	 * @return 要返回的县区数据，格式： code1:name1,code2:name2
	 */
	private String findCounByCityId(String provinceId, String cityId) {
		StringBuffer str = new StringBuffer();
		System.out.println("provinceId="+provinceId);
		System.out.println("cityId="+cityId);
		Map<String, City> cities = ((Province)provinces.get(provinceId)).getCities();
		Map<String, Country> countries = ((City)cities.get(cityId)).getCountries();
		Iterator itr = countries.entrySet().iterator();
		while (itr.hasNext()){
			Map.Entry<String, Country> me = (Map.Entry)itr.next();
			str.append(","+me.getKey()+":"+me.getValue().getName());
		}
		if(countries.size() > 0){
			str = new StringBuffer(str.substring(1));
		}else{
			str = new StringBuffer("");
		}
		return str.toString();
	}

	/**
	 * 根据省份编码查询对应城市
	 * @param provinceId 省份编码
	 * @return 要返回的城市数据，格式： code1:name1,code2:name2
	 */
	private String findCityByProvinceId(String provinceId) {
		StringBuffer str = new StringBuffer();
		System.out.println("provinceId="+provinceId);
		Map<String, City> cities = ((Province)provinces.get(provinceId)).getCities();
		Iterator itr = cities.entrySet().iterator();
		while (itr.hasNext()) {
			Map.Entry<String, City> me = (Map.Entry)itr.next();
			str.append(","+me.getKey()+":"+me.getValue().getName());
		}
		if(cities.size() > 0){
			str = new StringBuffer(str.substring(1));
		}else{
			str = new StringBuffer("");
		}
		return str.toString();
	}

	/**
	 * 查询所有省份
	 * @return 要返回的省份数据，格式： code1:name1,code2:name2
	 */
	public String findProvince(){
		StringBuffer str = new StringBuffer();
		Iterator itr = provinces.entrySet().iterator();
		while(itr.hasNext()){
			Map.Entry<String,Province> me = (Map.Entry)itr.next();
			str.append("," + me.getValue().getCode() + ":" + me.getValue().getName());
		}
		if(provinces.size() > 0){
			str = new StringBuffer(str.substring(1));
		}else{
			str = new StringBuffer("");
		}
		return str.toString();
	}

}
