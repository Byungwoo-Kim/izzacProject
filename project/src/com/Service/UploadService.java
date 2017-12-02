package com.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.DAO.DataDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/UpLoadService")
public class UploadService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		boolean isMulti = ServletFileUpload.isMultipartContent(request);
		ServletContext context = getServletContext(); // 어플리케이션에 대한 정보를 가진다.
		String saveDir = context.getRealPath("upload"); // 컴퓨터의 절대경로를 받아온다.
		int maxSize = 10 * 1024 * 1024; // 3MB
		String encoding = "euc-kr";
		MultipartRequest multi = null;
		
		HttpSession session = request.getSession();
		String email=(String)session.getAttribute("email");
	
		System.out.println("1단계");
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		System.out.println(isMulti);
		System.out.println("절대경로 >> " + saveDir);
		if (isMulti) {
			System.out.println("1.2단계");
			multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
			System.out.println("1.3단계");
			// 1. request
			// 2. saveDir : 저장시킬 경로
			// 3. maxSize : 파일 크기 제한
			// 4. encoding : 인코딩 처리
			// 5. new DefaultFileRenamePolicy() : 동일한 이름일 경우 자동으로 이름이 변경

			
			
			DataDAO Datadao = new DataDAO();
			System.out.println("2단계");
			String file = multi.getFilesystemName("file");
			
			if(file.contains(".csv")) {
				try {
					int cnt = Datadao.FileInsert(email, file);
					String moveUrl = "";

					if (cnt > 0) {

						System.out.println("저장완료");
						response.sendRedirect("#");
						
					} else {
						System.out.println("저장실패");
						response.sendRedirect("error/FileError.jsp");
					}
					
				} catch (Exception e) {
					response.sendRedirect("error/FileError.jsp");
					e.printStackTrace();
				}
			}else {
				out.print("<script>alert('csv파일이 아닙니다.');history.go(-1);</script>");
			}
			
		} else {
			System.out.println("일반전송 Form입니다.");
		}

	}
}