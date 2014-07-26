package com.csg.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class UserListServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//每一页有多少行数据
		int rows = Integer.parseInt(request.getParameter("rows"));
		//要查询第几页
		int page = Integer.parseInt(request.getParameter("page"));
		System.out.println("r="+rows);
		System.out.println("p="+page);
		List uList =(List)this.getServletContext().getAttribute("users");
		List subList = null;
		if(rows * page > uList.size()){
			subList = uList.subList(rows * (page - 1), uList.size());
		}else{
			subList = uList.subList(rows * (page - 1), rows * page);
		}
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Map map = new HashMap();
		int total = 0 ;
		if(uList.size() % rows != 0){
			total = new Double(uList.size() / rows).intValue() + 1;
		}else{
			total = new Double(uList.size() / rows).intValue();
		}
		
		map.put("total", total);
		map.put("page", page);
		map.put("rows", subList);
		out.print(new Gson().toJson(map));
	}

}
