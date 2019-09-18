package com.Powerfulrig.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Powerfulrig.Bean.Prodotto;
import com.Powerfulrig.Bean.Utente;
import com.Powerfulrig.util.ConnectionPool;

public class DAOUser 
{
	public static boolean regUtente(Utente utente) throws SQLException 
	{
		boolean flag=false;

		try 
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(addUtente);
			statement.setString(1,utente.getEmail());
			statement.setString(2,utente.getPassword());
			statement.setString(3,utente.getNome());
			statement.setString(4,utente.getCognome());
			flag=statement.executeUpdate()>0;
			con.commit();
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

	public static boolean cancellaAccount(String Email) throws SQLException
	{
		boolean flag=false;
		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(DeleteAccount);
			statement.setString(1,Email);
			flag=statement.executeUpdate()>0;
			con.commit();
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

	public static boolean modificaAccount(String ...vars) throws SQLException
	{
		int j=1;
		boolean flag=false;

		if(vars.length<0 || !Utilites.fieldOk(vars))
			throw new SQLException("parametri inseriti errati");
		for(int i=0;i<vars.length;i+=2)
		{
			if(i!=vars.length-4)
				modifyAccount+=" "+vars[i]+"=?,";
			else 
			{
				modifyAccount+=" "+vars[i]+"=? WHERE "+vars[vars.length-2]+"=?";
				break;
			}
		}
		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(modifyAccount);
			for(int i=1;i<vars.length;i+=2,j++) 
				statement.setString(j,vars[i]);
			flag=statement.executeUpdate()>0;
			con.commit();
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

	public static boolean checkEmail(String Email) throws SQLException
	{
		boolean flag=false;

		try 
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(checkEmail);
			statement.setString(1,Email);
			set=statement.executeQuery();
			flag=set.next();
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

	public static boolean checkLogin(String Email,String password) throws SQLException
	{
		boolean flag=false;

		try 
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(checkLogin);
			statement.setString(1,Email);
			statement.setString(2,password);
			set=statement.executeQuery();
			flag=set.next();
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

	public static Utente showAccount(String Email) throws SQLException
	{
		Utente user=null;

		try 
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(showAccount);
			statement.setString(1,Email);
			set=statement.executeQuery();
			while(set.next())
			{	//potrei utilizzare un costruttore riducendo le righe di codice ,complessità invariata
				user=new Utente();
				user.setEmail(set.getString(1));
				user.setPassword(set.getString(3));
				user.setNome(set.getString(4));
				user.setCognome(set.getString(5));
				user.setVia(set.getString(6));
				user.setCap(set.getString(7));
				user.setNumeroCivico(set.getInt(8));
				user.setNumeroTelefono(set.getString(9));
			}
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
		return user;	
	}

	private static Connection con;
	private static PreparedStatement statement;
	private static ResultSet set;
	private static String addUtente;
	private static String DeleteAccount;
	private static String modifyAccount;
	private static String checkEmail;
	private static String showAccount;
	private static String checkLogin;

	static
	{
		addUtente="INSERT INTO utente(Email,Password,Nome,Cognome) values(?,?,?,?)";
		DeleteAccount="DELETE  FROM utene WHERE Email=?";
		modifyAccount="UPDATE PowerfulRig.utente SET";
		checkEmail="SELECT nome FROM utente where Email=?";
		showAccount="SELECT * FROM utente where Email=?\"";
		checkLogin="SELECT nome FROM utente where Email=? AND Password=?";
	}
}

