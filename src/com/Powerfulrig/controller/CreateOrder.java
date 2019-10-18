package com.Powerfulrig.controller;

import java.io.IOException;

import java.net.URL;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Powerfulrig.Bean.Cart;
import com.Powerfulrig.Bean.Prodotto;
import com.Powerfulrig.Bean.Utente;
import com.Powerfulrig.Model.DAOOrdine;

@WebServlet("/CreateOrder")
public class CreateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	    
		public CreateOrder() 
	    {
	    	super();
        }
		
		DAOOrdine model_order = new DAOOrdine();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//attributti della sessione
		Utente utenteLoggato = (Utente)request.getSession().getAttribute("utenteLoggato");
		Cart cart = (Cart)request.getSession().getAttribute("Carrello");
		
		String username = utenteLoggato.getEmail();
		ArrayList<Prodotto> productsToBuy = cart.getProducts();
				
		//parametri della requests
		Float totalOrderPrice = Float.parseFloat(request.getParameter("totalOrderPrice"));
		String order_address = request.getParameter("addressopt");
		String order_payment_method = request.getParameter("payment_method_opt");
		
		//catching date of registration		
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");  
		Date date = new Date(System.currentTimeMillis());  
		String order_date = formatter.format(date);
		
		Boolean isConsegnato = false;
		/* TODO
		try {
			model_order.addOrder(username, order_payment_method, productsToBuy, order_address, order_date, totalOrderPrice, isConsegnato);
			
			request.getSession().setAttribute("Carrello", null);
			request.setAttribute("inserimento", true);
			response.sendRedirect(request.getContextPath()+"/area-utente.jsp");
			//RequestDispatcher dispatcher = request.getRequestDispatcher("/area-utente.jsp");
			//dispatcher.forward(request, response);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	*/
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		doGet(request, response);
	}

}
