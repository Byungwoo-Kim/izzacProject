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
		
		//email �������� ���߿� �ٲ��ٰ�
		//String email = (String) session.getAttribute("email");
		String email = "test@test";
		
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String date = request.getParameter("date");
		String selectedDate = year + "-" + month + "-" + date;
		System.out.println(selectedDate);
		
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();

		DataDAO dao = new DataDAO();

		ArrayList<AnalDTO> list = new ArrayList<>();
		try {
			System.out.println("������� �ư�,");
			list = dao.SelectAnal(email);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("������ ��¥ : " + selectedDate);
		System.out.println("������ ��¥ : " + list.get(0).getaDate());
		String AnalData = "";
		for (int i = 0; i < list.size(); i++) {
			if ((list.get(i).getaDate()).equals(selectedDate)) {
				System.out.println("1�ܰ�");
				AnalData = list.get(i).getAnalData();

			}
		}
		System.out.println(AnalData);
		out.print(AnalData);

	}

}
