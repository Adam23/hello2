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

public class NewsServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		List newsList = new ArrayList();
		if(type.equals("local")){
			Map news1= new HashMap();
			Map news2= new HashMap();
			Map news3= new HashMap();
			news1.put("time", "2014-07-22");
			news1.put("title", "习近平晤卡斯特罗 央视播放系列组照");
			news2.put("time", "2014-07-22");
			news2.put("title", "推动旅游市场向社会资本全面开放");
			news3.put("time", "2014-07-22");
			news3.put("title", "台风麦德姆再登福建 华东六省有强降雨");
			newsList.add(news1);
			newsList.add(news2);
			newsList.add(news3);
			
		}else if(type.equals("international")){
			Map news1= new HashMap();
			Map news2= new HashMap();
			Map news3= new HashMap();
			news1.put("time", "2014-07-22");
			news1.put("title", "世界杯完了");
			news2.put("time", "2014-07-22");
			news2.put("title", "乌克兰俄罗斯");
			news3.put("time", "2014-07-22");
			news3.put("title", "俄公布四证据暗指乌军击落马航客机 英国将破解黑匣子");
			newsList.add(news1);
			newsList.add(news2);
			newsList.add(news3);
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html,charset=utf-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String json = gson.toJson(newsList);
		System.out.println(json);
		out.println(json);

	}
}
