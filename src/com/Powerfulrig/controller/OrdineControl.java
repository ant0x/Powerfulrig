package com.Powerfulrig.controller;

import java.io.IOException;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Powerfulrig.Model.DAOOrdine;


@WebServlet("/Order")
public class OrdineControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static DAOOrdine model_ordine = new DAOOrdine();
       
    public OrdineControl() {
        super();
        
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action != null) 
		{
			if(action.equals("deleteOrder"))
			{
				int order_id = Integer.parseInt(request.getParameter("order_id"));
				model_ordine.deleteOrder(order_id);
			}		
		}
		
		RequestDispatcher dispatcher;
		if(action.equals("deleteOrder"))
			dispatcher = getServletContext().getRequestDispatcher("/area-admin.jsp");
		else
			dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
				
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
