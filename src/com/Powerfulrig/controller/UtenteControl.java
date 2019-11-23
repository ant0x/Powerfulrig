package com.Powerfulrig.controller;

/*showAccount viene usato in area-admin.jsp*/

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Powerfulrig.Model.*;


@WebServlet("/Utente")
public class UtenteControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static DAOUser model_utente = new DAOUser();
       
    public UtenteControl() 
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String username = request.getParameter("username");

		
		try
		{
			if(action != null)
			{
				
				if(action.equals("logout"))
				{
					model_utente.logout(request.getSession());
				}
				if(action.equals("banUser"))
				{
					
					model_utente.cancellaAccount(username);
				}
				if(action.equals("deleteAddress"))
				{
					int addressNumber = Integer.parseInt(request.getParameter("addressNumber"));
					
					//model_utente.(addressNumber, username);
				}	
				if(action.equals("modifyPassword"))
				{
					String old_psw = request.getParameter("old_psw");
					String new_psw = request.getParameter("new_psw");
					String cnfr_new_psw = request.getParameter("cnfr_new_psw");
				
/*
					if(model_utente.checkPassword(old_psw))
					{
						if(new_psw.equals(cnfr_new_psw))
						{
							model_utente.updatePassword(username, new_psw);
							request.setAttribute("modifiedPsw", true);
						}
						else
						{
							response.setStatus(500);
							request.setAttribute("modifiedPsw", false);
						}
					}
					else
					{
						response.setStatus(500);
						request.setAttribute("modifiedPsw", false);
					}
					*/
				}
				if(action.equals("deletePaymentMethod"))
				{
					System.out.println("daviddddddddddddddddddddddddddddddddd");
					log("davidddddddddddddddddddddddddddddddddddddd");
					String card_number = request.getParameter("card_number");
					
					model_utente.deletePaymentMethod(card_number);
				}

			}
			
		}catch(Exception e){e.printStackTrace();}
		
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

