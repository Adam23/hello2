package com.csg.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sun.org.apache.bcel.internal.generic.SIPUSH;

public class UploadServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//创建FileUpload的核心对象
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		
		try {
			List<FileItem> list = sfu.parseRequest(request);
			for(FileItem i :list){
				System.out.println(i.getName());
				//判断是不是标准组件
				if(i.isFormField()==true){
					
					System.out.println(i.toString());
				}else{
					String fName = i.getName();
					String suffix = fName.substring(fName.lastIndexOf("."));
					String targetName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date())+new Double(Math.random()*10000).intValue();
					
					File file = new File("F://y"+targetName+suffix);
					i.write(file);
					System.out.println("上传成功");
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
