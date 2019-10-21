<<<<<<< HEAD
package com.Powerfulrig.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Powerfulrig.Bean.Prodotto;
import com.Powerfulrig.util.ConnectionPool;

public class DAOProdotto
{
	public static boolean addProduct(Prodotto prod) throws SQLException
	{
		boolean flag=false;

		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(addProduct);
			statement.setInt(1,prod.getWatt());
			statement.setInt(2,prod.getPercentualeSconto());
			statement.setFloat(3,prod.getPrezzo());
			statement.setString(4,prod.getSpecifiche());
			statement.setString(5,prod.getMarca());
			statement.setInt(6,prod.getQuantita());
			statement.setString(7,prod.getNome());
			statement.setString(8,prod.getModello());
			statement.setString(9,prod.getTipo());
			statement.setString(10,prod.getDescrizione());
			statement.setString(11,prod.getImmagine());
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

	public static boolean modifyProduct(String ...vars) throws SQLException /*Da fare piu veloce*/
	{
		boolean flag=false;
		int j=1;

		if(vars.length<0 || !Utilites.fieldOk(vars))
			throw new SQLException("parametri inseriti errati");
		for(int i=0;i<vars.length;i+=2)
		{
			if(i!=vars.length-4)
				modifyProduct+=" "+vars[i]+"=?,";
			else 
			{
				modifyProduct+=" "+vars[i]+"=? WHERE Visualizzabile=true AND "+vars[vars.length-2]+"=?";
				break;
			}
		}
		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(modifyProduct);
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

	public static ArrayList<Prodotto> viewProduct(String ...strings) throws SQLException
	{
		ArrayList<Prodotto> prodotti=new ArrayList<Prodotto>();
		int j=1;
		if(strings.length>0)
		{
			if(!Utilites.fieldOk(strings))
				throw new SQLException("parametri di ricerca errati");
			viewProduct+=" WHERE Visualizzabile=true AND ";
			for(int i=0;i<strings.length;i+=2)
			{					
				if(i!=strings.length-2)
					viewProduct+=strings[i]+"=? AND ";
				else
					viewProduct+=strings[i]+"=?;";
			}
		}
		try 
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(viewProduct);
			for(int i=1;i<strings.length;i+=2,j++) 
				statement.setString(j,strings[i]);
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
				prod.setImmagine(set.getString(12));
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

	public static boolean cancelProduct(String idProdotto) throws SQLException
	{
		boolean flag=false;
		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(deleteProduct);
			statement.setInt(1,Integer.parseInt(idProdotto));
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

	private static Connection con=null;
	private static PreparedStatement statement=null;
	private static 	ResultSet set=null;
	private static String addProduct;
	private static String modifyProduct;
	private static String viewProduct;
	private static String deleteProduct;

	static
	{
		addProduct="INSERT INTO prodotto(Watt,PercentualeSconto,Prezzo,Specifica,Marca,Quantita,Nome,Modello,Tipo,Descrizione,path) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		modifyProduct="UPDATE PowerfulRig.prodotto SET";
		viewProduct="SELECT * FROM prodotto";
		deleteProduct="UPDATE PowerfulRig.prodotto SET Visualizzabile=false WHERE Visualizzabile=true AND IdProdotto=?";
	}
=======
package com.Powerfulrig.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Powerfulrig.Bean.Prodotto;
import com.Powerfulrig.util.ConnectionPool;

public class DAOProdotto
{
	public static boolean addProduct(Prodotto prod) throws SQLException
	{
		boolean flag=false;

		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(addProduct);
			statement.setInt(1,prod.getWatt());
			statement.setInt(2,prod.getPercentualeSconto());
			statement.setFloat(3,prod.getPrezzo());
			statement.setString(4,prod.getSpecifiche());
			statement.setString(5,prod.getMarca());
			statement.setInt(6,prod.getQuantita());
			statement.setString(7,prod.getNome());
			statement.setString(8,prod.getModello());
			statement.setString(9,prod.getTipo());
			statement.setString(10,prod.getDescrizione());
			statement.setString(11,prod.getImmagine());
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

	public static boolean modifyProduct(String ...vars) throws SQLException /*Da fare piu veloce*/
	{
		boolean flag=false;
		int j=1;

		if(vars.length<0 || !Utilites.fieldOk(vars))
			throw new SQLException("parametri inseriti errati");
		for(int i=0;i<vars.length;i+=2)
		{
			if(i!=vars.length-4)
				modifyProduct+=" "+vars[i]+"=?,";
			else 
			{
				modifyProduct+=" "+vars[i]+"=? WHERE Visualizzabile=true AND "+vars[vars.length-2]+"=?";
				break;
			}
		}
		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(modifyProduct);
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

	public ArrayList<Prodotto> viewProduct(String ...strings) throws SQLException
	{
		viewProduct="SELECT * FROM prodotto";
		ArrayList<Prodotto> prodotti=new ArrayList<Prodotto>();
		int j=1;
		if(strings.length>0)
		{
			if(!Utilites.fieldOk(strings))
				throw new SQLException("parametri di ricerca errati");
			viewProduct+=" WHERE Visualizzabile=true AND ";
			System.out.println("le stringe di merd"+strings.toString());
			for(int i=0;i<strings.length;i+=2)
			{					
				if(i!=strings.length-2)
					viewProduct+=strings[i]+"=? AND ";
				else
					viewProduct+=strings[i]+"=?;";
			}
		}
		try 
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(viewProduct);
			for(int i=1;i<strings.length;i+=2,j++) 
				statement.setString(j,strings[i]);
			System.out.println("lo statement è il seguente"+statement);
			System.out.println("lo statement è il seguente"+statement);
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
				prod.setImmagine(set.getString(12));
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

	public static boolean cancelProduct(String idProdotto) throws SQLException
	{
		boolean flag=false;
		try
		{
			con=ConnectionPool.getConnection();
			statement=con.prepareStatement(deleteProduct);
			statement.setInt(1,Integer.parseInt(idProdotto));
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

	private static Connection con=null;
	private static PreparedStatement statement=null;
	private static 	ResultSet set=null;
	private static String addProduct;
	private static String modifyProduct;
	private static String viewProduct;
	private static String deleteProduct;

	static
	{
		addProduct="INSERT INTO prodotto(Watt,PercentualeSconto,Prezzo,Specifica,Marca,Quantita,Nome,Modello,Tipo,Descrizione,path) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		modifyProduct="UPDATE PowerfulRig.prodotto SET";
		deleteProduct="UPDATE PowerfulRig.prodotto SET Visualizzabile=false WHERE Visualizzabile=true AND IdProdotto=?";
	}
>>>>>>> branch 'master' of https://github.com/ant0x/Powerfulrig.git
}