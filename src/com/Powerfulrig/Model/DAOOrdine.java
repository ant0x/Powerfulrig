package com.Powerfulrig.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Powerfulrig.Bean.Ordine;
import com.Powerfulrig.Bean.Prodotto;
import com.Powerfulrig.Bean.Utente;
import com.Powerfulrig.util.ConnectionPool;

public class DAOOrdine 
{
	public ArrayList<Ordine> viewOrdine(String startDate,String endDate) throws SQLException
	{
		ArrayList<Ordine> ordini=new ArrayList<Ordine>();
		Utente user=null;
		Prodotto prod=null;
		Ordine order=null;
		String precedente="";
		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(viewOrdine);
			statement.setString(1,startDate);
			statement.setString(2,endDate);
			set=statement.executeQuery();
			while(set.next())
			{
				prod=new Prodotto();
				prod.setImmagine(set.getString(7));
				prod.setNome(set.getString(8));
				prod.setIdProdotto(set.getInt(14));
				if(set.getString(9).equalsIgnoreCase(precedente))
				{
					order.setProdotto(prod);
					order.setQuantita(set.getInt(12));
					order.setPrezzo(set.getFloat(13));
				}
				else
				{
					order=new Ordine();
					user=new Utente();

					user.setEmail(set.getString(1));
					user.setNome(set.getString(2));
					user.setCognome(set.getString(3));
					user.setVia(set.getString(4));
					user.setCap(set.getString(5));
					user.setNumeroCivico(set.getInt(6));
					order.setNumeroOrdine(set.getString(9));
					order.setTotale(set.getFloat(10));
					order.setData(set.getString(11));
					order.setQuantita(set.getInt(12));
					order.setPrezzo(set.getFloat(13));
					order.setUser(user);
					order.setProdotto(prod);
					ordini.add(order);
				}
				precedente=order.getNumeroOrdine();
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
		return ordini;
	}

	public static ArrayList<Ordine> viewOrdineById(String Email) throws SQLException
	{
		ArrayList<Ordine> ordini=new ArrayList<Ordine>();
		Utente user=null;
		Prodotto prod=null;
		Ordine order=null;
		String precedente="";
		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(viewOrdineById);
			statement.setString(1,Email+"%");
			set=statement.executeQuery();
			while(set.next())
			{
				prod=new Prodotto();
				prod.setImmagine(set.getString(7));
				prod.setNome(set.getString(8));
				prod.setIdProdotto(set.getInt(14));
				if(set.getString(9).equalsIgnoreCase(precedente))
				{
					order.setProdotto(prod);
					order.setQuantita(set.getInt(12));
					order.setPrezzo(set.getFloat(13));
				}
				else
				{
					order=new Ordine();
					user=new Utente();

					user.setEmail(set.getString(1));
					user.setNome(set.getString(2));
					user.setCognome(set.getString(3));
					user.setVia(set.getString(4));
					user.setCap(set.getString(5));
					user.setNumeroCivico(set.getInt(6));
					order.setNumeroOrdine(set.getString(9));
					order.setTotale(set.getFloat(10));
					order.setData(set.getString(11));
					order.setQuantita(set.getInt(12));
					order.setPrezzo(set.getFloat(13));
					order.setStato(set.getString(14));
					order.setProdotto(prod);
					order.setUser(user);
					ordini.add(order);
				}
				precedente=order.getNumeroOrdine();
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
		return ordini;
	}

	public static boolean addOrder(Ordine order) throws SQLException
	{
		boolean flag=false;
		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(addOrdine);
			statement.setDouble(1,order.getTotale());
			statement.setString(2,order.getMetodoPagamento());
			statement.setString(3,order.getData());
			statement.setString(4,order.getUser().getEmail());
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

	public static ArrayList<Ordine> viewOrdine() throws SQLException
	{
		ArrayList<Ordine> ordini=new ArrayList<Ordine>();
		Utente user=null;
		Prodotto prod=null;
		Ordine order=null;
		String precedente="";
		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(viewAll);
			set=statement.executeQuery();
			while(set.next())
			{
				prod=new Prodotto();
				prod.setImmagine(set.getString(7));
				prod.setNome(set.getString(8));
				prod.setIdProdotto(set.getInt(14));
				if(set.getString(9).equalsIgnoreCase(precedente))
				{
					order.setProdotto(prod);
					order.setQuantita(set.getInt(12));
					order.setPrezzo(set.getFloat(13));
				}
				else
				{
					order=new Ordine();
					user=new Utente();

					user.setEmail(set.getString(1));
					user.setNome(set.getString(2));
					user.setCognome(set.getString(3));
					user.setVia(set.getString(4));
					user.setCap(set.getString(5));
					user.setNumeroCivico(set.getInt(6));
					order.setNumeroOrdine(set.getString(9));					
					order.setTotale(set.getFloat(10));
					order.setData(set.getString(11));
					order.setQuantita(set.getInt(12));
					order.setPrezzo(set.getFloat(13));
					order.setUser(user);
					order.setProdotto(prod);
					ordini.add(order);
				}
				precedente=order.getNumeroOrdine();
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
		return ordini;
	}

	public static Ordine searchOrdineById(int identificativo) throws SQLException
	{
		Ordine order=null;
		Utente user=null;
		Prodotto prod=null;
		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(viewOrdineByNFattura);
			statement.setInt(1,identificativo);
			set=statement.executeQuery();
			while(set.next())
			{
				order=new Ordine();
				user=new Utente();
				prod=new Prodotto();

				user.setEmail(set.getString(1));
				user.setNome(set.getString(2));
				user.setCognome(set.getString(3));
				user.setVia(set.getString(4));
				user.setCap(set.getString(5));
				user.setNumeroCivico(set.getInt(6));
				prod.setImmagine(set.getString(7));
				prod.setNome(set.getString(8));
				prod.setIdProdotto(set.getInt(14));
				order.setNumeroOrdine(set.getString(9));
				order.setTotale(set.getFloat(10));
				order.setData(set.getString(11));
				order.setQuantita(set.getInt(12));
				order.setPrezzo(set.getFloat(13));
				order.setUser(user);
				order.setProdotto(prod);
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
		return order;
	}

	@SuppressWarnings("finally")
	public static boolean deleteOrder(int NOrdine)
	{
		boolean flag=false;
		
		try
		{
			con=ConnectionPool.getConnection();
			
		}
		finally
		{
		
		return flag;
	}}
	
	
	private static Connection con=null;
	private static PreparedStatement statement=null;
	private static 	ResultSet set=null;
	private static String viewOrdine;
	private static String viewOrdineById;
	private static String addOrdine;
	private static String viewAll;
	private static String viewOrdineByNFattura;
	private static String deleteOrder;

	static 
	{
		viewOrdine="select table2.Email,table2.Nome,table2.Cognome,table2.Via,table2.cap,table2.NumeroCivico,path,table1.Nome,numero_fattura,totale,data_fattura,quantita,table1.prezzo,table1.IdProdotto\r\n" + 
				"from (select path,Nome,composizione.quantita,composizione.prezzo,fattura,prodotto.IdProdotto\r\n" + 
				"    from prodotto inner join composizione on prodotto.IdProdotto=composizione.IdProdotto) as table1\r\n" + 
				"      inner join \r\n" + 
				"      (select numero_fattura,totale,data_fattura,Cognome,Nome,Email,Via,cap,NumeroCivico\r\n" + 
				"     from fattura inner join utente on fattura.Email_utente=utente.Email \r\n" + 
				"       where data_fattura between ? AND ? ) as table2\r\n" + 
				"       on table1.fattura=table2.numero_fattura;";
		viewOrdineById="select table2.Email,table2.Nome,table2.Cognome,table2.Via,table2.cap,table2.NumeroCivico,path,table1.Nome,numero_fattura,totale,data_fattura,quantita,table1.prezzo,table1.IdProdotto,stato\r\n" + 
				"from (select path,Nome,composizione.quantita,composizione.prezzo,fattura,prodotto.IdProdotto\r\n" + 
				"    from prodotto inner join composizione on prodotto.IdProdotto=composizione.IdProdotto) as table1\r\n" + 
				"      inner join \r\n" + 
				"      (select numero_fattura,totale,data_fattura,Cognome,Nome,Email,Via,cap,NumeroCivico,stato\r\n" + 
				"     from fattura inner join utente on fattura.Email_utente=utente.Email \r\n" +
				"	  inner join spedizione on fattura.numero_fattura = spedizione.fattura \r\n"+
				"       where Email like ? ) as table2\r\n" + 
				"       on table1.fattura=table2.numero_fattura;";
		addOrdine="INSERT INTO fattura(totale,metodo_pagamento,data_fattura,Email_Utente) VALUES (?,?,?,?)";
		viewAll="select table2.Email,table2.Nome,table2.Cognome,table2.Via,table2.cap,table2.NumeroCivico,path,table1.Nome,numero_fattura,totale,data_fattura,quantita,table1.prezzo,table1.IdProdotto\r\n" + 
				"from (select path,Nome,composizione.quantita,composizione.prezzo,fattura,prodotto.IdProdotto\r\n" + 
				"    from prodotto inner join composizione on prodotto.IdProdotto=composizione.IdProdotto) as table1\r\n" + 
				"      inner join \r\n" + 
				"      (select numero_fattura,totale,data_fattura,Cognome,Nome,Email,Via,cap,NumeroCivico\r\n" + 
				"     from fattura inner join utente on fattura.Email_utente=utente.Email) \r\n" + 
				"      as table2\r\n" + 
				"       on table1.fattura=table2.numero_fattura;";
		viewOrdineByNFattura="select table2.Email,table2.Nome,table2.Cognome,table2.Via,table2.cap,table2.NumeroCivico,path,table1.Nome,numero_fattura,totale,data_fattura,quantita,table1.prezzo,table1.IdProdotto\r\n" + 
				"from (select path,Nome,composizione.quantita,composizione.prezzo,fattura,prodotto.IdProdotto\r\n" + 
				"    from prodotto inner join composizione on prodotto.IdProdotto=composizione.IdProdotto) as table1\r\n" + 
				"      inner join \r\n" + 
				"      (select numero_fattura,totale,data_fattura,Cognome,Nome,Email,Via,cap,NumeroCivico\r\n" + 
				"     from fattura inner join utente on fattura.Email_utente=utente.Email \r\n" + 
				"       where fattura.numero_fattura=? ) as table2\r\n" + 
				"       on table1.fattura=table2.numero_fattura;";
		deleteOrder="DELETE FROM fattura WHERE numero_fattura=?";
	}
}