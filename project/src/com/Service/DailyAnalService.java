package com.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DataDAO;
import com.DTO.AnalDTO;
import com.DTO.PreDTO;

@WebServlet("/DailyAnalService")
public class DailyAnalService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		String email = (String) session.getAttribute("email");

		
		
		String year = request.getParameter("year");
		int month = Integer.parseInt(request.getParameter("month"));
		String date = request.getParameter("date");
		if ((date.length())==1) {
			date = "0"+date;
			
		}
		String selectedDate = year + "-" + month + "-" + date;
		System.out.println("DailyAnal selectedDate : " + selectedDate);
		
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();

		DataDAO dao = new DataDAO();

		ArrayList<AnalDTO> list = new ArrayList<>();
		try {
			
			list = dao.SelectAnal(email);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("실제 판매량 페이지 선택한 날짜 : " + selectedDate);
		String AnalData = "";
		for (int i = 0; i < list.size(); i++) {
			if ((list.get(i).getaDate()).equals(selectedDate)) {

				System.out.println("실제 판매량 페이지 데이터 날짜 : " + list.get(i).getaDate());
				AnalData = list.get(i).getAnalData();
				break;
			}else {
				AnalData = "nothing";
			}
		}
		System.out.println("DailyAnal AnalData : " + AnalData);
		out.print(AnalData);

	}

}
