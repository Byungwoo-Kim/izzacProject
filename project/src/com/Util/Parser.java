package com.Util;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class Parser {

	public String parsing(String cityNum) {
		Document doc;
		String temp="";
		try {
			doc = Jsoup.connect("http://news.nate.com/weather?areaCode=" + cityNum).get();
			
			if (doc != null) {
				Elements tempEmt = doc.select(".celsius");
				Elements humEmt = doc.select(".humidity");
				Elements rainEmt = doc.select(".rainfall");
				Elements windEmt = doc.select(".wind");

				temp = tempEmt.get(0).text();
				String hum = humEmt.get(0).text();
				String rain = rainEmt.get(0).text();
				String wind = windEmt.get(0).text();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return temp;
	}
}
