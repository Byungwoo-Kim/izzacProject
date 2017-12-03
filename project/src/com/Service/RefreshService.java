package com.Service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Run.RunPython;
import com.Run.RunR;

public class RefreshService implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			RunPython runPython = new RunPython();
			runPython.run();
			
			Thread.sleep(35000);
			
			RunR runR = new RunR();
			runR.run();
			
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('갱신이 완료되었어요.');history.go(-1);</script>");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	
}
