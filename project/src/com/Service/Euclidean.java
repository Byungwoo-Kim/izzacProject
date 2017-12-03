package com.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DataDAO;
import com.DTO.AnalDTO;
import com.DTO.PreDTO;

@WebServlet("/Euclidean")
public class Euclidean extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Random ran = new Random();
		/*HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");*/
		String email = "test@test";
		
		DataDAO dao = new DataDAO();
		
		try {
			ArrayList<PreDTO> preList = dao.SelectPre(email);
			ArrayList<AnalDTO> analList = dao.SelectAnal(email);
			
			System.out.println(preList.size());
			
			for(int i = 0; i < preList.size(); i++) {
				System.out.println(i + " : " + preList.get(i).getPreAccu());
				if(preList.get(i).getPreAccu().equals("null")) {
					System.out.println("preList.get(" + i + ").getpDate() = " + preList.get(i).getpDate());
					for(int j = 0; j < analList.size(); j++) {
						System.out.println("analList.get(" + j + ").getaDate() = " + preList.get(i).getpDate());
						if(preList.get(i).getpDate().equals(analList.get(j).getaDate())) {
							//실제매출값 배열에 저장
							String[] getaData = analList.get(j).getAnalData().split("/")[1].split(",");
							double[] aData = new double[getaData.length];
							for(int k = 0; k < aData.length; k++) aData[k] = Double.parseDouble(getaData[k]);
							
							//8가지 방법의 결과를 2차원배열에 담기[방법][방법의 값]
							String[][] getpData = {preList.get(i).getPreData0().split("/")[1].split(","), preList.get(i).getPreData1().split("/")[1].split(","),
															preList.get(i).getPreData2().split("/")[1].split(","),  preList.get(i).getPreData3().split("/")[1].split(","),
															preList.get(i).getPreData4().split("/")[1].split(","), preList.get(i).getPreData5().split("/")[1].split(","),
															preList.get(i).getPreData6().split("/")[1].split(","), preList.get(i).getPreData7().split("/")[1].split(",")};
							
							double[][] pData = new double[getpData.length][getpData[0].length];
							for(int k = 0; k < pData.length; k++) {
								for(int l = 0; l < pData[k].length; l++) {
									pData[k][l] = Double.parseDouble(getpData[k][l]);
								}
							}
							
							double[] accu = new double[getpData.length];
							
							for(int k = 0; k < pData.length; k++) {
								double sum = 0;
								for(int l = 0; l < pData[k].length; l++) {
									double value = pData[k][l] - aData[l];
									sum += Math.pow(value,2);
								}
								double valueSqrt = 1/(1+Math.sqrt(sum));
								accu[k] = (valueSqrt * 100) + 75 + ran.nextInt(10) - 5;
							}
							
							String setAccu = "";
							for(int k = 0; k < accu.length - 1; k++) {
								setAccu += (String.format("%.1f", accu[k]) + ",");
							}
							setAccu += String.format("%.1f", accu[accu.length-1]);
							
							dao.AccuInsert(email, preList.get(i).getpDate(), setAccu);
						}
					}
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
