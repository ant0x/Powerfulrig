package Model;

import java.sql.SQLException;

public class tester
{
	public static void main(String[] args) throws SQLException 
	{
		System.out.println(DAOAdmin.viewProduct("watt","0"));
	}
}
