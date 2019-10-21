package com.Powerfulrig.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Powerfulrig.Model.*;

@WebServlet("/ModifyUser")
public class ModifyUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ModifyUser() {
        super();
       }
	
	static DAOUser model_user = new DAOUser();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstname = null;
		String lastname = null;
		String email = null;
		String username = null;
		
		firstname = request.getParameter("firstname");
		lastname = request.getParameter("lastname");
		email = request.getParameter("email");
		username = request.getParameter("username");
		/*
		try {
			
			if(model_user.modifyUser(firstname, lastname, email, username))
			{
				request.getSession().setAttribute("utenteLoggato", model_user.retrieveUserByUsername(username));
				request.setAttribute("modifica", true);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/area-utente.jsp");
				dispatcher.forward(request, response);			
			}
			else
			{
				request.setAttribute("modifica", false);
			}	
				
		} catch(Exception e){
			
			e.printStackTrace();
		}	
		*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
