package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Bean.Prodotto;
import Bean.Spedizione;
import Bean.Utente;
import database.ConnectionPool;

public class DAOAdmin
{
	private static String searchUtentebyKey="SELECT Email,Nome,Cognome FROM utente"; 
	private static String addProduct="INSERT INTO prodotto VALUES(?,?,?,?,?,?,?,?,?)";
	private static String viewShipmentProgress="SELECT * FROM spedizione WHERE stato=? ORDER BY data_partenza DESC";
	private static String modifyProduct="UPDATE prodotto SET";
	private static String viewProduct="SELECT* FROM prodotto";
	private static Connection con=null;
	private static PreparedStatement statement=null;
	private static 	ResultSet set=null;


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
						searchUtentebyKey+=vars[i]+"= ? AND";
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

	public static boolean addProduct(Prodotto prod) throws SQLException
	{
		boolean flag=false;

		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(addProduct);
			statement.setInt(1,prod.getWatt());
			statement.setInt(2,prod.getIdProdotto());
			statement.setInt(3,prod.getPercentualeSconto());
			statement.setFloat(4,prod.getPrezzo());
			statement.setString(5,prod.getSpecifiche());
			statement.setString(6,prod.getMarca());
			statement.setInt(7,prod.getQuantita());
			statement.setString(8,prod.getNome());
			statement.setString(9,prod.getModello());
			statement.setString(10,prod.getTipo());
			statement.setString(11,prod.getDescrizione());
			if(statement.executeUpdate()>0)
				flag=true;
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
				shipments.add(shipment.clone());
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

	public static boolean modifyProduct(String ...vars) throws SQLException /*Da provare*/
	{
		boolean flag=false;

		if(vars.length<0 || !Utilites.fieldOk(vars))
			throw new SQLException("parametri inseriti errati");
		for(int i=0;i<vars.length;i+=2)
		{
			if(i!=vars.length-4)
				modifyProduct+=vars[i]+"= ? ,";
			else 
			{
				modifyProduct+=vars[i]+" = ? WHERE ";
				modifyProduct+=vars[vars.length-3]+" = ?";
				break;
			}
		}
		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(modifyProduct);
			for(int i=0;i<vars.length;i+=2) 
				statement.setString(1,vars[i+1]);
			if(statement.executeUpdate()>0)
				flag=true;
		}
		catch(SQLException ex)
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

	public static ArrayList<Prodotto> viewProduct(String ...strings) throws SQLException
	{
		ArrayList<Prodotto> prodotti=new ArrayList<Prodotto>();

		if(strings.length>0)
		{
			if(!Utilites.fieldOk(strings))
				throw new SQLException("parametri di ricerca errati");
			viewProduct+=" where ";
			for(int i=0;i<strings.length;i+=2)
			{					
				if(i!=strings.length-2)
					viewProduct+=strings[i]+"= ? AND";
				else
					viewProduct+=strings[i]+" = ?;";
			}
		}
		try 
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(viewProduct);
			for(int i=0;i<strings.length;i+=2) 
				statement.setString(1,strings[i+1]);
			System.out.println(viewProduct);
			set=statement.executeQuery();
			while(set.next())
			{
				Prodotto prod=new Prodotto();
				prod.setWatt(set.getInt(1));
				prod.setIdProdotto(set.getInt(2));
				prod.setPercentualeSconto(set.getInt(3));
				prod.setPrezzo(set.getFloat(4));
				prod.setSpecifiche(set.getString(5));
				prod.setMarca(set.getString(6));
				prod.setQuantita(set.getInt(7));
				prod.setNome(set.getString(8));
				prod.setModello(set.getString(9));
				prod.setTipo(set.getString(10));
				prod.setDescrizione(set.getString(11));
				prodotti.add(prod);
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
		return prodotti;
	}
}
