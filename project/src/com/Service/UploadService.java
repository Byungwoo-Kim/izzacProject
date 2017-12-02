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
import com.Run.RunPython;
import com.Run.RunR;
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
	
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		System.out.println(isMulti);
		System.out.println("절대경로 >> " + saveDir);
		if (isMulti) {
			
			multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
			
			// 1. request
			// 2. saveDir : 저장시킬 경로
			// 3. maxSize : 파일 크기 제한
			// 4. encoding : 인코딩 처리
			// 5. new DefaultFileRenamePolicy() : 동일한 이름일 경우 자동으로 이름이 변경
			
			DataDAO Datadao = new DataDAO();
			String file = multi.getFilesystemName("file"); //파일이름
			
			
			if(file.contains(".csv")) {
				try {
					int cnt = Datadao.FileInsert(email, file);
					String moveUrl = "";

					if (cnt > 0) {

						System.out.println("저장완료 / Python, R 시작");
						
						RunPython runPython = new RunPython();
						runPython.run();
						
						Thread.sleep(35000);
						
						RunR runR = new RunR();
						runR.run();
						
						System.out.println("Python / R 완료");				
						
						out.print("<script>alert('업로드에 성공했습니다. 매출페이지를 확인해 보세요.');history.go(-1);</script>");
						
					} else {
						System.out.println("저장실패");
						out.print("<script>alert('업로드에 실패했습니다.');history.go(-1);</script>");
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