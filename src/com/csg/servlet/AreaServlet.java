package com.csg.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class AreaServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//得到搜索关键字
		String keyword = request.getParameter("term");
		keyword = new String(keyword.getBytes("ISO-8859-1") , "UTF-8");
		System.out.println(keyword+"====");
		List results = new ArrayList();
		for(Map area :areaList){
			if(area.get("name").toString().indexOf(keyword)!=-1){
				Map result = new HashMap();
				result.put("value", area.get("name"));
				result.put("id", area.get("code"));
				results.add(result);
			}
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String json = new Gson().toJson(results);
		out.println(json);
	}
	
	
	List<Map> areaList = new ArrayList();
	
	public void init(){
		Map area1 = new HashMap();
		area1.put("code", "HB-SJZ-CAQ");
		area1.put("name", "河北-石家庄-长安区");
		Map area2 = new HashMap();
		area2.put("code", "HB-SJZ-CAQ");
		area2.put("name", "河北-保定-新华区");
		Map area3 = new HashMap();
		area3.put("code", "SD-QD-LCQ");
		area3.put("name", "山东-青岛-李沧区");
		Map area4 = new HashMap();
		area4.put("code", "BJ-CYQ");
		area4.put("name", "北京-朝阳区");
		Map area5 = new HashMap();
		area5.put("code", "BJ-HDQ");
		area5.put("name", "北京-海淀区");
		Map area6 = new HashMap();
		area6.put("code", "SH-PDQ");
		area6.put("name", "上海-浦东区");
		areaList.add(area1);
		areaList.add(area2);
		areaList.add(area3);
		areaList.add(area4);
		areaList.add(area5);
		areaList.add(area6);
	}

}
