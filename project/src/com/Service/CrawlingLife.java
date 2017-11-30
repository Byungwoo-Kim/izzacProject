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
 * Servlet implementation class CrawlingLife
 */
@WebServlet("/CrawlingLife")
public class CrawlingLife extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");

		Document doc = Jsoup.connect("http://kostat.go.kr/incomeNcpi/cpi/index.action").get();

		Elements spanTag = doc.select(".JSnum > strong");
		String index = spanTag.get(0).text();
		System.out.println(index);
		PrintWriter out = response.getWriter();

		Elements spanTag2 = doc.select(".down");
		String index2 = spanTag2.get(0).text();
		String result = index + "," + index2;
		System.out.println(result);
		out.print(result);
	}
}
