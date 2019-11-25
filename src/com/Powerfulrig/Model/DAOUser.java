package com.Powerfulrig.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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

	public Utente checkLogin(String Email,String password) throws SQLException
	{
		Utente utenteLoggato = null;
		
		try 
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(checkLogin);
			statement.setString(1,Email);
			statement.setString(2,password);
			set=statement.executeQuery();
		} 		
		finally
		{
			try
			{
				if(set.first()) 
				{
					utenteLoggato = new Utente();
					utenteLoggato.setEmail(set.getString(1));
					utenteLoggato.setTipo(set.getString(2));
					utenteLoggato.setNome(set.getString(3));
					utenteLoggato.setCognome(set.getString(4));

				}
					
			}
			finally
			{
				ConnectionPool.rilasciaConnessione(con);
			}
		}
		return utenteLoggato;	
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
			{
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
	
	public static ArrayList<Utente> showAccountall() throws SQLException
	{
		ArrayList<Utente> utenti= new ArrayList<Utente>();
		Utente user= new Utente();

		try 
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(showAccountall);
			set=statement.executeQuery();
			while(set.next())
			{
				user=new Utente();
				user.setEmail(set.getString(1));
				user.setPassword(set.getString(3));
				user.setNome(set.getString(4));
				user.setCognome(set.getString(5));
				user.setVia(set.getString(6));
				user.setCap(set.getString(7));
				user.setNumeroCivico(set.getInt(8));
				user.setNumeroTelefono(set.getString(9));
				utenti.add(user);
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
		return utenti;	
	}
	
	
	public static ArrayList<String> showAddres(String Email) throws SQLException
	{
		int civico;
		ArrayList<String> compIndirizzo = new ArrayList<String>();

		try 
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(showAccount);
			statement.setString(1,Email);
			set=statement.executeQuery();
			while(set.next())
			{
				compIndirizzo.add(set.getString(6));
				compIndirizzo.add(set.getString(7));
				civico=(set.getInt(8));
				compIndirizzo.add(Integer.toString(civico));
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
		return compIndirizzo;	
	}
	
	
	public boolean deletePaymentMethod(String card_number) throws SQLException {
		int esito = 0;
		
		try {
			con = ConnectionPool.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
						
		
		String query = "DELETE FROM users_payement_method WHERE card_number = '"+card_number+"'";
		
		try
		{
		statement = con.prepareStatement(query);
		esito = statement.executeUpdate();
		con.commit();
		}
		finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				if (con != null)
					con.close();
			}
		}

		return (esito != 0);
	}
	
	
	
	public synchronized void logout(HttpSession session) throws SQLException
	{
		synchronized(session) 
		{
			session.invalidate();
		}
	}
	

	private static Connection con;
	private static PreparedStatement statement;
	private static ResultSet set;
	private static String addUtente;
	private static String DeleteAccount;
	private static String modifyAccount;
	private static String checkEmail;
	private static String showAccount;
	private static String showAccountall;
	private static String checkLogin;

	static
	{
		addUtente="INSERT INTO utente(Email,Password,Nome,Cognome) values(?,?,?,?)";
		DeleteAccount="DELETE FROM utente WHERE Email=?";
		modifyAccount="UPDATE PowerfulRig.utente SET";
		checkEmail="SELECT nome FROM utente where Email=?";
		showAccount="SELECT * FROM utente where Email=?";
		showAccountall="SELECT * FROM utente";
		checkLogin="SELECT Email,Tipo,Nome,Cognome FROM utente where Email=? AND Password=?";
	}
}

