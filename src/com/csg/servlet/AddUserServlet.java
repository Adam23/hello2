package com.csg.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddUserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Enumeration eu = request.getParameterNames();
		Map user = new HashMap();
		while(eu.hasMoreElements()){
			String paramName = (String)eu.nextElement();
			String paramValue = request.getParameter(paramName);
			System.out.println(paramName + ":" + paramValue);
			user.put(paramName, paramValue);
		}
		List users = (List)this.getServletContext().getAttribute("users");
		users.add(user);
		this.getServletContext().setAttribute("users",users);
		response.sendRedirect("/hello2/list.jsp");
		
	}
	
	public void init() throws ServletException {
		//初始化测试数据
		List list = new ArrayList();
		for(int i = 1 ; i <= 100 ; i++){
			Map map = new HashMap();
			map.put("name", "测试姓名" + i);
			map.put("sex", "男");
			map.put("birthday", "1984-05-30");
			map.put("txtNativeplace", "河北-保定");
			map.put("idcard", "123456789");
			list.add(map);
		}
		this.getServletContext().setAttribute("users" , list);
	}

}
