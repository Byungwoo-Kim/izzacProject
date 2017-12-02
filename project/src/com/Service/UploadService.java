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
		ServletContext context = getServletContext(); // ���ø����̼ǿ� ���� ������ ������.
		String saveDir = context.getRealPath("upload"); // ��ǻ���� �����θ� �޾ƿ´�.
		int maxSize = 10 * 1024 * 1024; // 3MB
		String encoding = "euc-kr";
		MultipartRequest multi = null;
		
		HttpSession session = request.getSession();
		String email=(String)session.getAttribute("email");
	
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		System.out.println(isMulti);
		System.out.println("������ >> " + saveDir);
		if (isMulti) {
			
			multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
			
			// 1. request
			// 2. saveDir : �����ų ���
			// 3. maxSize : ���� ũ�� ����
			// 4. encoding : ���ڵ� ó��
			// 5. new DefaultFileRenamePolicy() : ������ �̸��� ��� �ڵ����� �̸��� ����
			
			DataDAO Datadao = new DataDAO();
			String file = multi.getFilesystemName("file"); //�����̸�
			
			
			if(file.contains(".csv")) {
				try {
					int cnt = Datadao.FileInsert(email, file);
					String moveUrl = "";

					if (cnt > 0) {

						System.out.println("����Ϸ� / Python, R ����");
						
						RunPython runPython = new RunPython();
						runPython.run();
						
						Thread.sleep(35000);
						
						RunR runR = new RunR();
						runR.run();
						
						System.out.println("Python / R �Ϸ�");				
						
						out.print("<script>alert('���ε忡 �����߽��ϴ�. ������������ Ȯ���� ������.');history.go(-1);</script>");
						
					} else {
						System.out.println("�������");
						out.print("<script>alert('���ε忡 �����߽��ϴ�.');history.go(-1);</script>");
					}
					
				} catch (Exception e) {
					response.sendRedirect("error/FileError.jsp");
					e.printStackTrace();
				}
			}else {
				out.print("<script>alert('csv������ �ƴմϴ�.');history.go(-1);</script>");
			}
			
		} else {
			System.out.println("�Ϲ����� Form�Դϴ�.");
		}

	}
}