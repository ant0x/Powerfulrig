/*showAccount viene usato in area-admin.jsp*/

package com.Powerfulrig.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Powerfulrig.Model.DAOUser;

@WebServlet("/Utente1")
public class UtenteControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static DAOUser model_utente = new DAOUser();
       
    public UtenteControl() 
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String action = request.getParameter("action");
		
		try
		{
				if(action.equals("logout"))
				{
					model_utente.logout(request.getSession());
				}	

			}
		
		catch(Exception e){e.printStackTrace();}
		
		RequestDispatcher dispatcher;
		if(action.equals("deleteUser"))
			dispatcher = getServletContext().getRequestDispatcher("/area-admin.jsp#utdiv");
		else if (action.equals("showAccounts"))
			dispatcher = getServletContext().getRequestDispatcher("/area-admin.jsp");
		else if (action.equals("logout"))
			dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
		else if (action.equals("deleteAddress"))
			dispatcher = getServletContext().getRequestDispatcher("/area-utente.jsp");
		else if(action.equals("modifyPassword"))
			dispatcher = getServletContext().getRequestDispatcher("/modify-password.jsp");
		else if(action.equals("deletePaymentMethod"))
			dispatcher = getServletContext().getRequestDispatcher("/area-utente.jsp");
			else
				dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
		
			dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

