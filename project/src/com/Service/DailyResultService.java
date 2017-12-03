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

@WebServlet("/DailyResultService")
public class DailyResultService extends HttpServlet {

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
		System.out.println("DailyResult selectedDate : " + selectedDate);
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();

		DataDAO dao = new DataDAO();

		ArrayList<PreDTO> list = new ArrayList<>();
		try {
			list = dao.SelectPre(email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("선택한 날짜pre : " + selectedDate);

		String AnalData1 = "";
		String AnalData2 = "";
		String AnalData3 = "";
		String AnalData4 = "";
		String AnalData5 = "";
		String AnalData6 = "";
		String AnalData7 = "";
		String AnalData8 = "";
		String PreData = "";
		for (int i = 0; i < list.size(); i++) {
			if ((list.get(i).getpDate()).equals(selectedDate)) {
				System.out.println("데이터 날짜pre : " + list.get(i).getpDate());
				AnalData1 = list.get(i).getPreData0();
				AnalData2 = list.get(i).getPreData1();
				AnalData3 = list.get(i).getPreData2();
				AnalData4 = list.get(i).getPreData3();
				AnalData5 = list.get(i).getPreData4();
				AnalData6 = list.get(i).getPreData5();
				AnalData7 = list.get(i).getPreData6();
				AnalData8 = list.get(i).getPreData7();
				break;
			}
		}
		String all = AnalData1 + "^" + AnalData2 + "^" + AnalData3 + "^" + AnalData4 + "^" + AnalData5 + "^" + AnalData6 + "^" + AnalData7 + "^" + AnalData8;
		System.out.println("예상판매량 : " + all);
		out.print(all);

	}

}
