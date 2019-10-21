package com.Powerfulrig.controller;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Powerfulrig.Bean.Ordine;
import com.Powerfulrig.Model.DAOOrdine;


@WebServlet("/SelectOrdersByUsername")
public class SelectOrdersByUsername extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectOrdersByUsername() {
        super();
    
    }
	
	 private DAOOrdine model_ordine = new DAOOrdine();
		

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String email = request.getParameter("email");
		ArrayList<Ordine> orders_per_user = new ArrayList<>();
		
		try {
			orders_per_user = model_ordine.viewOrdineById(email);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(!orders_per_user.equals(null))
		{
			request.setAttribute("ordiniPerUsername", orders_per_user);
			RequestDispatcher dispatcher;
			dispatcher = request.getRequestDispatcher("area-admin.jsp");
			dispatcher.forward(request, response);
		}
		else
		{
			RequestDispatcher dispatcher;
			dispatcher = request.getRequestDispatcher("area-admin.jsp");
			dispatcher.forward(request, response);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
