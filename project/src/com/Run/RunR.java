package com.Run;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class RunR {
	public void run() throws IOException, InterruptedException {
		
		String currentDir = "D:\\Project\\pythonCode";
		
		StringBuffer cmd = new StringBuffer(); // CMD Ŀ�ǵ�� stringbuffer
		cmd.append("Rscript");
		cmd.append(" ");
		cmd.append(currentDir);
		cmd.append("\\");
		cmd.append("drawGraph.R");

		Process proc = Runtime.getRuntime().exec(cmd.toString());
		// CMD���� (R ȣ��)

		int resultSign = proc.waitFor();

		// wait for R process is over, if success return 0, else 1 or 2 or etc

		if (resultSign == 0) { //�����ϸ�
			System.out.println("R operation success"); 
			System.out.println();

			StringBuffer rOut = new StringBuffer(); // create variable rOut to get result from R
			String inputLine;
			BufferedReader inputBuf = new BufferedReader(new InputStreamReader(proc.getInputStream(), "UTF-8"));
			// open input stream with encoding UTF-8
			while (((inputLine = inputBuf.readLine()) != null)) { 
				rOut.append(inputLine); // write on variable "rOut"
				rOut.append("\n"); // ����
			}
			inputBuf.close(); // close input stream

			System.out.println(rOut.toString()); // show R response

		} else { // ����
			System.out.println("R error : " + resultSign);
		}
	}
}
