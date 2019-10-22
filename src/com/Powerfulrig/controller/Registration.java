package com.Powerfulrig.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Powerfulrig.Bean.Utente;
import com.Powerfulrig.Model.*;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public Registration()
	{
		super();
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String user_firstname = null;
		String user_lastname = null;
		String user_email = null;
		String user_password = null;
		String confirm_user_password = null;
		
		user_firstname = request.getParameter("user_firstname");
		user_lastname = request.getParameter("user_lastname");
		user_email = request.getParameter("user_email");
		user_password = request.getParameter("user_password");
		confirm_user_password = request.getParameter("confirm_user_password");
		
		if(user_password != null && !(user_password.isEmpty()) && !(user_password.equals(confirm_user_password)))
		{
			System.out.println("porcodiovegetale1283");
		}
		
		
		
		
		
		
		//creazione del nuovo utente
		Utente utente = new Utente();
		
		utente.setNome(user_firstname);
		utente.setCognome(user_lastname);
		utente.setEmail(user_email);
		utente.setPassword(user_password);
		
		try {
			if(!DAOUser.checkEmail(user_email))
			{
				DAOUser.regUtente(utente);
				request.setAttribute("inserimentoUtente", "true");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/log-area.jsp");
				dispatcher.forward(request, response);
			}
			else 
			{
				request.setAttribute("inserimentoUtente", "false");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/registrazione.jsp");
				dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		doGet(request, response);
	}

}
