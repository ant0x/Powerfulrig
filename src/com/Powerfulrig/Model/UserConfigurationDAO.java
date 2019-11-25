package com.Powerfulrig.Model;

import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.Powerfulrig.util.*;
import com.Powerfulrig.Bean.*;

public class UserConfigurationDAO implements UserConfigurationModel {

	String query = null;
	Connection con=null;
	PreparedStatement preparedStatement;		// parametric queries
	Statement statement;						//normal queries
	ResultSet results;
	
	
	@Override
	public boolean createUserConfiguration(String configurationName, String Email) throws SQLException{
		
		int esito = 0;
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");  
		Date date = new Date(System.currentTimeMillis());  
		String dateFormatted = formatter.format(date);
		
		try {
			con=ConnectionPool.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		query = "INSERT INTO users_configurations(name_configuration, owner_configuration, creation_date, configuration_price, cpu_in_configuration, gpu_in_configuration, ram_in_configuration, case_in_configuration, motherboard_in_configuration, psu_in_configuration, storage_in_configuration, heatsink_in_configuration) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {			

			preparedStatement=con.prepareStatement(query);
			
			preparedStatement.setString(1, configurationName);
			
			preparedStatement.setString(2, Email);
			
			preparedStatement.setString(3, dateFormatted);
			
			preparedStatement.setString(4, "0");
			
			preparedStatement.setString(5, null);
		
			preparedStatement.setString(6, null);
		
			preparedStatement.setString(7, null);
			
			preparedStatement.setString(8, null);
			
			preparedStatement.setString(9, null);
			
			preparedStatement.setString(10, null);
			
			preparedStatement.setString(11, null);
			
			preparedStatement.setString(12, null);
				
			esito = preparedStatement.executeUpdate();		
			con.commit();
				
			
		} finally {
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

	@Override
	public boolean deleteUserConfiguration(int id_conf) throws SQLException {
		
		int esito = 0;
		
		try {
			con=ConnectionPool.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		query = "DELETE FROM users_configurations WHERE  id_configuration = '"+id_conf+"'";
		
		try {			
			statement=con.createStatement();		
			esito = statement.executeUpdate(query);		
			con.commit();
		} finally {
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

	@Override
	public ArrayList<UserConfigurationBean> retrieveByEmail(String Email) throws SQLException {
		
		ArrayList<UserConfigurationBean> configurations = new ArrayList<>();
		
		try {
			con=ConnectionPool.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		query = "SELECT * FROM users_configurations WHERE owner_configuration = '"+Email+"'";
		
		try
		{
			statement = con.createStatement();
			results = statement.executeQuery(query);
		
			while(results.next())
			{
				UserConfigurationBean bean = new UserConfigurationBean();
				
				bean.set_id_configuration(results.getInt(1));
				bean.setname_configuration(results.getString(2));
				bean.setOwner_configuration(results.getString(3));
				bean.setCreation_date(results.getDate(4).toLocalDate());
				bean.setConfiguration_price(results.getFloat(5));
				bean.setCpu_in_configuration(results.getString(6));
				bean.setGpu_in_configuration(results.getString(7));
				bean.setRam_in_configuration(results.getString(8));
				bean.setCase_in_configuration(results.getString(9));
				bean.setMotherboard_in_configuration(results.getString(10));
				bean.setpsu_in_configuration(results.getString(11));
				bean.setStorage_in_configuration(results.getString(12));
				bean.setHeatsink_in_configuration(results.getString(13));
				
				configurations.add(bean);
			}
		}
		catch(Exception e){e.printStackTrace();}
		
		finally 
		{
			try {
				if (statement != null)
					statement.close();
			} finally {
				if (con != null)
					con.close();
			}
		}
		
		return configurations;
	}
	
	public UserConfigurationBean retrieveById(int id_conf) throws SQLException
	{
		UserConfigurationBean bean = new UserConfigurationBean();
		
		try {
			con=ConnectionPool.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		query = "SELECT * FROM users_configurations WHERE  id_configuration = '"+id_conf+"'";
		
		try
		{
			statement = con.createStatement();
			results = statement.executeQuery(query);
			
			if(results.first())
			{
				bean.set_id_configuration(results.getInt(1));
				bean.setname_configuration(results.getString(2));
				bean.setOwner_configuration(results.getString(3));
				bean.setCreation_date(results.getDate(4).toLocalDate());
				bean.setConfiguration_price(results.getFloat(5));
				bean.setCpu_in_configuration(results.getString(6));
				bean.setGpu_in_configuration(results.getString(7));
				bean.setRam_in_configuration(results.getString(8));
				bean.setCase_in_configuration(results.getString(9));
				bean.setMotherboard_in_configuration(results.getString(10));
				bean.setpsu_in_configuration(results.getString(11));
				bean.setStorage_in_configuration(results.getString(12));
				bean.setHeatsink_in_configuration(results.getString(13));
			}
		}
		catch(Exception e){e.printStackTrace();}
		
		finally 
		{
			try {
				if (statement != null)
					statement.close();
			} finally {
				if (con != null)
					con.close();
			}
		}
		
		return bean;
	}
	
	@Override
	public boolean deleteComponentFromConfiguration(String id_conf, String id_comp, String model_comp) throws SQLException
	{
		
		String comp = id_comp.substring(0, id_comp.lastIndexOf("_"));
		comp=comp.toLowerCase();
		String query_price_prod = null;
		String query_price_conf = null;
		int esito = 0;
		int sconto=0;
		float price_prod = 0;
		float price_conf = 0;
		
		try {
			con=ConnectionPool.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//ottenimento del prezzo della componente da aggiungere
		//TODO
			query_price_prod = "SELECT Prezzo FROM prodotto WHERE Modello = '"+model_comp+"' ";
			String sconto_price = "Select PercentualeSconto FROM prodotto WHERE Modello = '"+model_comp+"' ";
			query_price_conf = "SELECT configuration_price FROM users_configurations WHERE  id_configuration = '"+id_conf+"' ";
	
			try {
				
				statement=con.createStatement();
				results = statement.executeQuery(query_price_prod);
				
				statement=con.createStatement();
				ResultSet result1 = statement.executeQuery(sconto_price);
				if(result1.first())
					  sconto = result1.getInt(1);
			
				
				if(results.first())			
					price_prod = results.getFloat(1);
							
				statement=con.createStatement();
				results = statement.executeQuery(query_price_conf);
					
				if(results.first())		
				{
					if(sconto>0)
						
					sconto=100-sconto;
					price_conf = results.getFloat(1) - (sconto*price_prod)/100;
				}
					else
					{
						price_conf = results.getFloat(1) - price_prod;
					}
																	
				} finally {
						if (statement != null)
								statement.close();
					}
		
		query = "UPDATE users_configurations SET "+comp+"_in_configuration = NULL, configuration_price = '"+price_conf+"' WHERE (`id_configuration` = '"+id_conf+"')";		
		
		try {			
			statement=con.createStatement();
			esito = statement.executeUpdate(query);	
			con.commit();
		} finally {
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

	public boolean checkConf(String id_comp, String id_conf) throws SQLException
	{
		
		String comp = id_comp.substring(0, id_comp.lastIndexOf("_"));
		comp=comp.toLowerCase();
		boolean esito = false;
		
		try {
			con=ConnectionPool.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		query = "SELECT "+comp+"_in_configuration FROM users_configurations WHERE  id_configuration = '"+id_conf+"' ";
	
		
		try {
			
			statement=con.createStatement();
			results=statement.executeQuery(query);
			
			results.first();
			
			if(results.getString(1) == null)
				esito = true;
								
		} finally {
				try {
					if (statement != null)
						statement.close();
				} finally {
					if (con != null)
						con.close();
				}
			}
		
		return esito;
	}

	public boolean addComponentToConf(String id_comp, String id_prod, String id_conf, String model_comp) throws SQLException {
		
		String comp = id_comp.substring(0, id_comp.lastIndexOf("_"));
		comp=comp.toLowerCase();
		String query_price_prod = null;
		String query_price_conf = null;
		int esito = 0;
		float price_prod = 0;
		float price_conf = 0;
		float finalprice = 0;
		int percentuale =0;
		
		try {
			con=ConnectionPool.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//ottenimento del prezzo della componente da aggiungere
		//TODO
		query_price_prod = "SELECT Prezzo,PercentualeSconto FROM prodotto WHERE IdProdotto = '"+id_prod+"' ";
		query_price_conf = "SELECT configuration_price FROM users_configurations WHERE  id_configuration = '"+id_conf+"' ";
		try {
			
			statement=con.createStatement();
			results = statement.executeQuery(query_price_prod);
			
			if(results.first())		
			{
				price_prod = results.getFloat(1);
				percentuale = results.getInt(2);
			finalprice= ((100-percentuale)*price_prod)/100;
			}
						
			statement=con.createStatement();
			results = statement.executeQuery(query_price_conf);
			
			if(results.first())			
				price_conf = results.getFloat(1) + finalprice;
		} finally {
					if (statement != null)
						statement.close();
				}
		
		
		query = "UPDATE users_configurations SET "+comp+"_in_configuration = '"+id_prod+"', configuration_price = '"+price_conf+"'  WHERE  id_configuration = '"+id_conf+"' ";
				
		try {
			
			statement=con.createStatement();
			esito = statement.executeUpdate(query);
			con.commit();
								
		} finally {
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

	@Override
	public boolean buyConfiguration(String id_conf, Cart cart) throws SQLException 
	{
		
		ResultSetMetaData meta;
		DAOProdotto model_product = new DAOProdotto();
		ArrayList<Prodotto> app;
		try {
			con=ConnectionPool.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		query = "SELECT cpu_in_configuration,gpu_in_configuration,ram_in_configuration,case_in_configuration,motherboard_in_configuration,psu_in_configuration,storage_in_configuration,heatsink_in_configuration FROM users_configurations WHERE  id_configuration = "+id_conf+" ";
		
		try 
		{
			statement=con.createStatement();
			results=statement.executeQuery(query);
			
			meta = results.getMetaData();
			int columns = meta.getColumnCount();
			
			if(results.first())
			{
				for(int i = 1; i <= columns; i++)
				{
					if(meta.getColumnName(i).contains("_in_configuration"))
					{
						if(!(results.getString(i) == null))
						{
							app=model_product.viewProduct("IdProdotto",results.getString(i));
							cart.addProduct(app.get(0));
						}
					}
				}
			}
		
		} finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				if (con != null)
					con.close();
			}
		}
		return false;
	}

	}
	