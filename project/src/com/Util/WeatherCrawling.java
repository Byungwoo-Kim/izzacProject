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
		String cityNum = request.getParameter("cityNum");
		System.out.println(cityNum);
		Document doc = Jsoup.connect("http://news.nate.com/weather?areaCode=" + cityNum).get();

		Elements tempEmt = doc.select(".celsius");
		Elements humEmt = doc.select(".humidity");
		Elements rainEmt = doc.select(".rainfall");
		Elements windEmt = doc.select(".wind");

		String temp = tempEmt.get(0).text();
		String hum = humEmt.get(0).text();
		String rain = rainEmt.get(0).text();
		String wind = windEmt.get(0).text();

		PrintWriter out = response.getWriter();
		out.print(hum);
		
		/*
		 * Parser parser = new Parser(); String temp = parser.parsing(cityNum);
		 * 
		 * request.setAttribute("temp", temp);
		 * 
		 * RequestDispatcher dispatcher = request.getRequestDispatcher("ParserWidget");
		 * dispatcher.forward(request, response);
		 */

		/*
		 * out.print(hum); out.print(rain); out.print(wind);
		 */
	}

}
