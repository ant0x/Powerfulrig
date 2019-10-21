<<<<<<< HEAD
package com.Powerfulrig.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Powerfulrig.Bean.Spedizione;
import com.Powerfulrig.Bean.Utente;
import com.Powerfulrig.util.ConnectionPool;

public class DAOAdmin
{
	public static synchronized ArrayList<Utente> searchUtente(String ...vars) throws SQLException 
	{
		ArrayList<Utente> utenti;
		try
		{
			utenti=new ArrayList<Utente>();
			con=ConnectionPool.getConnection();
			if(vars.length>0) 
			{
				if(!Utilites.fieldOk(vars))
					throw new SQLException("parametri di ricerca errati");
				searchUtentebyKey+=" where ";
				for(int i=0;i<vars.length;i+=2)
				{					
					if(i!=vars.length-2)
						searchUtentebyKey+=vars[i]+"= ? AND ";
					else
						searchUtentebyKey+=vars[i]+" = ?;";
				}
			}
			statement=con.prepareStatement(searchUtentebyKey);
			for(int i=0;i<vars.length;i+=2) 
				statement.setString(1,vars[i+1]);
			set=statement.executeQuery();
			while (set.next())
			{
				Utente user=new Utente();
				user.setEmail(set.getString(1));
				user.setNome(set.getString(2));
				user.setCognome(set.getString(3));
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

	public static ArrayList<Spedizione> viewShipmentProgress(String state) throws SQLException
	{
		ArrayList<Spedizione> shipments;

		try
		{
			shipments=new ArrayList<Spedizione>();
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(viewShipmentProgress);
			statement.setString(1,state);
			set=statement.executeQuery();
			while(set.next())
			{
				Spedizione shipment=new Spedizione();
				shipment.setIdSpedizione(set.getInt(1));
				shipment.setStato(set.getString(2));
				shipment.setDataPartenza(set.getString(3));
				shipment.setDataArrivo(set.getString(4));
				shipment.setCittaDestinazione(set.getString(5));
				shipments.add(shipment);
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
		return shipments;
	}

	private static String searchUtentebyKey="SELECT Email,Nome,Cognome FROM utente"; 
	private static String viewShipmentProgress="SELECT * FROM spedizione WHERE stato=? ORDER BY data_partenza DESC";
	private static Connection con=null;
	private static PreparedStatement statement=null;
	private static 	ResultSet set=null;
}
=======
package com.Powerfulrig.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Powerfulrig.Bean.Spedizione;
import com.Powerfulrig.Bean.Utente;
import com.Powerfulrig.util.ConnectionPool;

public class DAOAdmin
{
	public static synchronized ArrayList<Utente> searchUtente(String ...vars) throws SQLException 
	{
		ArrayList<Utente> utenti;
		try
		{
			utenti=new ArrayList<Utente>();
			con=ConnectionPool.getConnection();
			if(vars.length>0) 
			{
				if(!Utilites.fieldOk(vars))
					throw new SQLException("parametri di ricerca errati");
				searchUtentebyKey+=" where ";
				for(int i=0;i<vars.length;i+=2)
				{					
					if(i!=vars.length-2)
						searchUtentebyKey+=vars[i]+"= ? AND ";
					else
						searchUtentebyKey+=vars[i]+" = ?;";
				}
			}
			statement=con.prepareStatement(searchUtentebyKey);
			for(int i=0;i<vars.length;i+=2) 
				statement.setString(1,vars[i+1]);
			set=statement.executeQuery();
			while (set.next())
			{
				Utente user=new Utente();
				user.setEmail(set.getString(1));
				user.setNome(set.getString(2));
				user.setCognome(set.getString(3));
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

	public static ArrayList<Spedizione> viewShipmentProgress(String state) throws SQLException
	{
		ArrayList<Spedizione> shipments;

		try
		{
			shipments=new ArrayList<Spedizione>();
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(viewShipmentProgress);
			statement.setString(1,state);
			set=statement.executeQuery();
			while(set.next())
			{
				Spedizione shipment=new Spedizione();
				shipment.setIdSpedizione(set.getInt(1));
				shipment.setStato(set.getString(2));
				shipment.setDataPartenza(set.getString(3));
				shipment.setDataArrivo(set.getString(4));
				shipment.setCittaDestinazione(set.getString(5));
				shipments.add(shipment);
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
		return shipments;
	}

	private static String searchUtentebyKey="SELECT Email,Nome,Cognome FROM utente"; 
	private static String viewShipmentProgress="SELECT * FROM spedizione WHERE stato=? ORDER BY data_partenza DESC";
	private static Connection con=null;
	private static PreparedStatement statement=null;
	private static 	ResultSet set=null;
}
>>>>>>> branch 'master' of https://github.com/ant0x/Powerfulrig.git
