package com.Util;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;


@WebServlet("/WeatherCrawling")
public class WeatherCrawling extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("1´Ü°è");
		String cityNum = request.getParameter("cityNum");
		System.out.println(cityNum);
		
		Parser parser = new Parser();
		String temp = parser.parsing(cityNum);
		
		request.setAttribute("temp", temp);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ParserWidget");
		dispatcher.forward(request, response);

		/*
		out.print(hum);
		out.print(rain);
		out.print(wind);*/
	}

}
