package com.Powerfulrig.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class ConnectionPool
{
	private static List<Connection> connessioni;

	private ConnectionPool()
	{
		connessioni=new LinkedList<Connection>();
		caricaDriver();
	}

	//funzione che caricare il driver
	private void caricaDriver()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch(ClassNotFoundException ex)
		{
			ex.printStackTrace();
			System.out.println("il driver caricato non è stato trovato:"+ex.getMessage());
		}
	}
	
	private static synchronized Connection connessioneDb() throws SQLException
	{
		Connection newConnection = null;
		String ip = "localhost";
		String port = "3306";
		String db = "PowerfulRig";
		String username = "root";
		String password = "toor";
				
		newConnection = DriverManager.getConnection("jdbc:mysql://"+ip+":"+port+"/"+db+"?zeroDateTimeBehavior=convertToNull&serverTimezone=GMT",username, password);
		newConnection.setAutoCommit(false);
		return newConnection;
	}

	public static synchronized Connection getConnection() throws SQLException
	{
		if(connessioni==null)
			new ConnectionPool();
		
		Connection con=null;
		
		if(connessioni.size()>0)
		{
			con=(Connection)connessioni.get(0);
			connessioni.remove(0);
			try
			{
				//controlla la connessione perchè quella ottenuta potrebbe essere non piï¿½ valida
				if(con.isClosed())
					con=getConnection();
			}
			catch(SQLException ex)
			{
				//ho riscontrato un errore in getConnetion();
				con.close();
				con=getConnection();
			}
		}
		else
			con=connessioneDb();

		return con;
	}

	public static synchronized void rilasciaConnessione(Connection con)
	{
		if(con!=null)
			connessioni.add(con);
	}
}
