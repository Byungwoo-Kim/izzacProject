
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

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
public class CrawlingSub extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		String cityNum = request.getParameter("cityNum");
		System.out.println(cityNum);
		Document doc = Jsoup.connect("http://news.nate.com/weather?areaCode=" + cityNum).get();

		Elements tempEmt = doc.select(".celsius");
		Elements humEmt = doc.select(".humidity");
		Elements rainEmt = doc.select(".rainfall");
		Elements windEmt = doc.select(".wind");
		Elements img = doc.select(".left_today>.text");
		
		String image = img.get(0).text();
		System.out.println(image);
		// 온도
		String temp = "";
		String tempS = tempEmt.get(0).text();
		if (tempS.length() == 3) {
			temp = tempS.substring(0, 2);
		} else if (tempS.length() == 2) {
			temp = tempS.substring(0, 1);
		}

		// 습도
		String humS = humEmt.get(0).text();
		String hum = "";
		hum = humS.substring(2, 4);

		// 강수량
		String rainS = rainEmt.get(0).text();
		String rain = "";
		if (rainS.length() == 6) {
			rain = rainS.substring(3, 4);
		} else if (rainS.length() == 7) {
			rain = rainS.substring(3, 5);
		} else if (rainS.length() == 8) {
			rain = rainS.substring(3, 6);
		}

		// 풍속
		String windS = windEmt.get(0).text();
		String wind = "";
		System.out.println(windS + windS.length());
		/*
		 * if (windS.length()==13) {
		 * 
		 * 
		 * }
		 */
		if ((windS.charAt(5) >= 48) && (windS.charAt(5) <= 57)) {
			wind = windS.substring(5);
		} else if ((windS.charAt(6) >= 48) && (windS.charAt(6) <= 57)) {
			wind = windS.substring(6);
		} else if ((windS.charAt(7) >= 48) && (windS.charAt(7) <= 57)) {
			wind = windS.substring(6);
		}
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		


		String parAll = temp + "," + hum + "," + rain + "," + wind + "," + image;
		System.out.println(parAll);
		out.print(parAll);

	}

}
