package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Bean.Utente;
import database.ConnectionPool;

public class UserDAO 
{
	private static String addUtente="INSERT INTO utente(Email,Password,Nome,Cognome) values(?,?,?,?)";
	private static String modifyPass="UPDATE utente set Password=? where Email=?;";
	
	
	public static boolean addUtente(Utente utente) throws SQLException 
	{
		Connection con=null;
		PreparedStatement statement=null;
		boolean flag=true;

		try 
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(addUtente);
			statement.setString(1,utente.getEmail());
			statement.setString(2,utente.getPassword());
			statement.setString(3,utente.getNome());
			statement.setString(4,utente.getCognome());
			statement.executeUpdate();
		} 
		catch (SQLException e) 
		{
			flag = false;
		}
		finally
		{
			try
			{
				if(statement!=null)
					statement.close();
			}
			finally
			{
				ConnectionPool.rilasciaConnessione(con);
			}
		}
		return flag;
	}
	
	public static boolean modifyPassword(String passModificata,int identificativo) throws SQLException
	{
		Connection con=null;
		PreparedStatement statement=null;
		boolean flag=false;
		
		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(modifyPass);
			statement.setString(1,passModificata);
			statement.setInt(2,identificativo);
			if(statement.executeUpdate()>0)
				flag=true;
		}
		catch (SQLException e) 
		{}
		finally
		{
			try
			{
				if(statement!=null)
					statement.close();
			}
			finally
			{
				ConnectionPool.rilasciaConnessione(con);
			}
		}
		return flag;
	}
	
	
}

