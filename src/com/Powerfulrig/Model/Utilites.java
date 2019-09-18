package com.Powerfulrig.Model;

public class Utilites
{
	public static boolean fieldOk(String[] table)
	{
		String app="";
		for(int i=0;i<table.length;i+=2)
			app+=" "+table[i];
		if(app.indexOf("1 or 1")>=0 || app.indexOf("0 or 1")>=0 || app.indexOf("1 or 0")>=0
		   || app.indexOf("0 or 0")>=0 || app.indexOf("1 or 1")>=0)
			return false;
		return true;
	
	}
}
