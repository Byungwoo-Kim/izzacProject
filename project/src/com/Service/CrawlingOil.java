package com.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

/**
 * Servlet implementation class CrawlingOil
 */
@WebServlet("/CrawlingOil")
public class CrawlingOil extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		/*String cityNum = request.getParameter("cityNum");*/
		
		
		Document doc = Jsoup.connect("http://www.opinet.co.kr/user/dopttot/doptTotSelect.do").get();

		Elements spanTag = doc.select(".gap");
		String oilPrice = spanTag.get(2).text();
		System.out.println(oilPrice);
		PrintWriter out = response.getWriter();
		
 
		out.print(oilPrice);
	}

}
