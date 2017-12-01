package com.Service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.FileDAO;
import com.Model.FileVO;

@WebServlet("/SelectService")
public class FileUploadSelectService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DB�� ���屭 file������ ��� �˻��ؼ� jsp�� ����
		FileDAO dao = FileDAO.getInstance();
		
		ArrayList<FileVO> list=null;
		try {
			list = dao.selectAll();
			
			if(list != null) {
				request.setAttribute("list", list);
			}
			
			RequestDispatcher dis = request.getRequestDispatcher("board.jsp");
			dis.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
