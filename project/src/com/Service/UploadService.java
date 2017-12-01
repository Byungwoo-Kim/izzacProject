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

import org.apache.catalina.Session;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.DAO.DataDAO;
import com.Model.FileDAO;
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
		String email = "d";
		System.out.println("1�ܰ�");
		PrintWriter out = response.getWriter();
		System.out.println(isMulti);
		System.out.println("������ >> " + saveDir);
		if (isMulti) {
			System.out.println("1.2�ܰ�");
			multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
			System.out.println("1.3�ܰ�");
			// 1. request
			// 2. saveDir : �����ų ���
			// 3. maxSize : ���� ũ�� ����
			// 4. encoding : ���ڵ� ó��
			// 5. new DefaultFileRenamePolicy() : ������ �̸��� ��� �ڵ����� �̸��� ����
			
			FileDAO dao = FileDAO.getInstance();
			DataDAO Datadao = new DataDAO();
			System.out.println("2�ܰ�");
			String file = multi.getFilesystemName("file");
			try {
				int insertCnt = Datadao.FileInsert(email, file);
			} catch (Exception e1) {
				e1.printStackTrace();
			}

			try {
				int cnt = dao.uploadExcel(file);
				String moveUrl = "";

				if (cnt > 0) {

					System.out.println("����Ϸ�");

					moveUrl = "FileUploadPage.jsp";
					out.println("<script>alert('����Ϸ�!');opener.window.location.reload();window.close();</script>");
				} else {
					System.out.println("�������");
					moveUrl = "FileUploadSelectService";
				}

				response.sendRedirect(moveUrl);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("�Ϲ����� Form�Դϴ�.");
		}

	}
}