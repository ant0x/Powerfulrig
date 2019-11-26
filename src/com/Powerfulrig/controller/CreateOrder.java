package com.Powerfulrig.controller;

import java.io.IOException;

import java.net.URL;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
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
import com.Powerfulrig.Bean.Ordine;
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
		Ordine app = new Ordine();
		Utente user = new Utente();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//attributti della sessione
		Utente utenteLoggato = (Utente)request.getSession().getAttribute("utenteLoggato");
		Cart cart = (Cart)request.getSession().getAttribute("Carrello");
		
		String email = utenteLoggato.getEmail();
		ArrayList<Prodotto> productsToBuy = cart.getProducts();
				
		//parametri della requests
		Float totalOrderPrice = Float.parseFloat(request.getParameter("totalOrderPrice"));
		String via = request.getParameter("addressopt1");
		String nCivico = request.getParameter("addressopt2");
		String quantita = request.getParameter("qnt_selector");

		int nCivico1 = Integer.parseInt(nCivico);
		String Cap = request.getParameter("addressopt3");
	
		String order_payment_method = request.getParameter("payment_method_opt");
		
		//catching date of registration		
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");  
		Date date = new Date(System.currentTimeMillis());  
		String order_date = formatter.format(date);
		
		Boolean isConsegnato = false;
		app.setQuantita(Integer.parseInt(quantita));
		app.setMetodoPagamento(order_payment_method);
		app.setLista(productsToBuy);
		app.setData(order_date);
		app.setTotale(totalOrderPrice);
		user.setEmail(email);
		user.setVia(via);
		user.setNumeroCivico(nCivico1);
		user.setCap(Cap);
		
		app.setUser(user);

		try {
			model_order.addOrder(app);
			
			request.getSession().setAttribute("Carrello", null);
			request.setAttribute("inserimento", true);
			response.sendRedirect(request.getContextPath()+"/area-utente.jsp");
			//RequestDispatcher dispatcher = request.getRequestDispatcher("/area-utente.jsp");
			//dispatcher.forward(request, response);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		doGet(request, response);
	}

}
