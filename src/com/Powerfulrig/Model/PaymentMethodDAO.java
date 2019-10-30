package com.Powerfulrig.Model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

import com.Powerfulrig.Bean.PaymentMethodBean;
import com.Powerfulrig.Bean.PaymentMethodModel;
import com.Powerfulrig.util.ConnectionPool;

public class PaymentMethodDAO implements PaymentMethodModel{
	
	String query = null;
	Connection con=null;
	Connection connection;
	PreparedStatement preparedStatement;		// parametric queries
	Statement statement;						//normal queries
	ResultSet results;

	@Override
	public ArrayList<PaymentMethodBean> doRetrieveByUsername(String username) throws SQLException {
		
		ArrayList<PaymentMethodBean> payment_methods = new ArrayList<PaymentMethodBean>();
		
		try {
			con=ConnectionPool.getConnection();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		query="SELECT * FROM users_payement_method WHERE card_owner = ?";
		
		try {
			
			preparedStatement=connection.prepareStatement(query);
			
			preparedStatement.setString(1, username);
					
			results=preparedStatement.executeQuery();
			
			while(results.next()) 
			{
				PaymentMethodBean bean = new PaymentMethodBean();
				
				bean.setCard_number(results.getString(1));
				bean.setCard_bank(results.getString(2));
				bean.setCard_cvc(results.getInt(3));
				bean.setCard_expiry(results.getDate(4).toLocalDate());
				bean.setCard_owner(results.getString(5));
				bean.setDate_registration_card(results.getDate(6).toLocalDate());
				
				payment_methods.add(bean);
			}			
		} finally {
				try {
					if (statement != null)
						statement.close();
				} finally {
					if (connection != null)
						connection.close();
				}
			}
		return payment_methods;
	}

	@Override
	public PaymentMethodBean doRetrieveByCardNumber(String card_number) throws SQLException {
		
		PaymentMethodBean bean = new PaymentMethodBean ();
		
		try {
			con=ConnectionPool.getConnection();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		query="SELECT * FROM users_payment_method WHERE card_owner = ?";
		
		try {
			
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, card_number);
			
			results = preparedStatement.executeQuery();
			
			bean.setCard_number(results.getString(1));
			bean.setCard_bank(results.getString(2));
			bean.setCard_cvc(results.getInt(3));
			bean.setCard_expiry(results.getDate(4).toLocalDate());
			bean.setCard_owner(results.getString(5));
			bean.setDate_registration_card(results.getDate(6).toLocalDate());
						
		} finally {
				try {
					if (statement != null)
						statement.close();
				} finally {
					if (connection != null)
						connection.close();
				}
			}
		
		return bean;
	}

	public boolean deletePaymentMethod(String card_number)throws SQLException
	{
		
		int rs = 0; 			//esito del DELETE
		
		try {
			con=ConnectionPool.getConnection();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		query="DELETE FROM users_payement_method WHERE card_number = '"+card_number+"'";
		System.out.println("payemnwrgDAO---->"+query);
		try {
			
			statement=connection.createStatement();		
			rs=statement.executeUpdate(query);
			
		} finally {
				try {
					if (statement != null)
						statement.close();
				} finally {
					if (connection != null)
						connection.close();
				}
		}
		
		return (rs!=0);
	}

	public boolean createPaymentMethod(String card_number, String card_bank, int card_cvc, LocalDate card_expiry,String card_owner, LocalDate date_registration_card) throws SQLException {

		int esito = 0;
		try {
			con=ConnectionPool.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		query = "SELECT * FROM users_payement_method WHERE card_number = '"+card_number+"'";
		
		statement = connection.createStatement();
		results = statement.executeQuery(query);
		
		if(results.first())
			return false;	// esiste gi� un metodo di pagamento legato al card_number in questione
	
		// non esiste, procedo con l'inserimento
		query="INSERT INTO users_payement_method(card_number,card_bank,card_cvc,card_expiry,card_owner,date_registration_card) VALUES (?,?,?,?,?,?)";
		
		try {
			preparedStatement=connection.prepareStatement(query);
			
			preparedStatement.setString(1, card_number);
			preparedStatement.setString(2, card_bank);
			preparedStatement.setInt(3, card_cvc);
			preparedStatement.setDate(4, java.sql.Date.valueOf(card_expiry));
			preparedStatement.setString(5, card_owner);
			preparedStatement.setDate(6, java.sql.Date.valueOf(date_registration_card));
				
			esito = preparedStatement.executeUpdate();
			
		} finally {
				try {
					if (preparedStatement != null)
						preparedStatement.close();
				} finally {
					if (connection != null)
						connection.close();
				}
		}
		
		return (esito != 0);	//qualunqe valore diverso da 0 indica il usccesso dell'operazione
	}
}
