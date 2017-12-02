package com.Run;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;

public class RunPython {

	public void run() {
		String pyPath = "D:\\Project\\pythonCode\\analyze.py";
		System.out.println("ÆÄÀÌ½ã°æ·Î: "+pyPath);
		
		try {
			
			System.out.println("..............python start.......................................");
			
			ProcessBuilder builder = new ProcessBuilder("C:\\Users\\pc-20\\AppData\\Local\\Programs\\Python\\Python36\\python.exe", pyPath);
	  	   
			builder.redirectOutput(Redirect.INHERIT);
			builder.redirectError(Redirect.INHERIT);
			
		    Process process = builder.start();
		
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
	}
}
