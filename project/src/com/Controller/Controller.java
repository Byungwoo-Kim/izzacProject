package com.Controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Service.Command;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	HashMap<String, Command> map = new HashMap<String, Command>();
	
	@Override
	public void init() throws ServletException { //실행했을 때 최초 1회만 실행
		//map.put("Login.do", new LoginService());
		//map.put("Join.do", new JoinService());
		//map.put("MessageInsert.do", new MessageInsertService());
		//map.put("delete.do", new DeleteService());
		//map.put("Update.do", new UpdateService());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("요청한 URI : " + uri);
		String path = request.getContextPath();
		System.out.println("프로젝트명 : " + path);
		String req_uri = uri.substring(path.length() + 1);
		System.out.println("요청식별값 : " + req_uri);
		
		Command command  = map.get(req_uri);
		
//		if(req_uri.equals("Login.do")) {
//			command = new LoginService();
//		} else if(req_uri.equals("Join.do")) {
//			command = new JoinService();
//		} else if (req_uri.equals("MessageInsert.do")) {
//			command = new MessageInsertService();
//		} else if (req_uri.equals("delete.do")) {
//			command = new DeleteService();
//		} else if (req_uri.equals("Update.do")) {
//			command = new UpdateService();
//		}
		
		command.execute(request, response);
	}

}
