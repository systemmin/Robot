package com.min.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.min.tools.Robot;

public class RobotServlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	
	public RobotServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String info = request.getParameter("info");
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String infoString = Robot.info(info);
		out.println(infoString);
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}

}
