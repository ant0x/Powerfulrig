package com.Powerfulrig.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Powerfulrig.Bean.Utente;
import com.Powerfulrig.Model.*;


@SuppressWarnings("serial")
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet
{
	static DAOUser model_utente=new DAOUser();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.removeAttribute("login");
		
		String user_email = request.getParameter("user_email");
		String user_password = request.getParameter("user_password");
		
		String redirectedPage = "";
		
		HttpSession session = request.getSession(true);
		synchronized (session) {
		
			try 
			{
				Utente utenteLoggato = model_utente.checkLogin(user_email, user_password);
				
				if(utenteLoggato!= null)
				{				
					session.setAttribute("utenteLoggato", utenteLoggato);
					session.setAttribute("email", user_email);
					request.setAttribute("login", true);
					redirectedPage = "/home.jsp";
					
				}
				else
				{
					request.setAttribute("login", false);
					redirectedPage = "/log-area.jsp";
				}
			}
				 catch (Exception e) {
					 System.out.println("Servlet error");
				e.printStackTrace();
				}
			}
			
		RequestDispatcher dispatcher = request.getRequestDispatcher(redirectedPage);
		dispatcher.forward(request, response);
		//response.sendRedirect(request.getContextPath() + redirectedPage);
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}
	
}
