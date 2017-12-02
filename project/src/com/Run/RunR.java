package com.Run;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class RunR {
	public void run() throws IOException, InterruptedException {
		
		String currentDir = "D:\\Project\\pythonCode";
		
		StringBuffer cmd = new StringBuffer(); // CMD 커맨드용 stringbuffer
		cmd.append("Rscript");
		cmd.append(" ");
		cmd.append(currentDir);
		cmd.append("\\");
		cmd.append("drawGraph.R");

		Process proc = Runtime.getRuntime().exec(cmd.toString());
		// CMD실행 (R 호출)

		int resultSign = proc.waitFor();

		// wait for R process is over, if success return 0, else 1 or 2 or etc

		if (resultSign == 0) { //성공하면
			System.out.println("R operation success"); 
			System.out.println();

			StringBuffer rOut = new StringBuffer(); // create variable rOut to get result from R
			String inputLine;
			BufferedReader inputBuf = new BufferedReader(new InputStreamReader(proc.getInputStream(), "UTF-8"));
			// open input stream with encoding UTF-8
			while (((inputLine = inputBuf.readLine()) != null)) { 
				rOut.append(inputLine); // write on variable "rOut"
				rOut.append("\n"); // 개행
			}
			inputBuf.close(); // close input stream

			System.out.println(rOut.toString()); // show R response

		} else { // 실패
			System.out.println("R error : " + resultSign);
		}
	}
}
