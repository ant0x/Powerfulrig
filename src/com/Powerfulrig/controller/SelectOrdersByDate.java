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

import com.Powerfulrig.Bean.Ordine;
import com.Powerfulrig.Model.DAOOrdine;


@WebServlet("/SelectOrdersByDate")
public class SelectOrdersByDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    public SelectOrdersByDate() {
        super();      
    }
	
    private DAOOrdine model_ordine = new DAOOrdine();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dateStart = null;
		String dateEnd = null;
		
		String Start = request.getParameter("start");
		String End = request.getParameter("end");
		
		ArrayList<Ordine> ordiniPerData = new ArrayList<>();
		
		try {
			ordiniPerData = model_ordine.viewOrdine(dateStart, dateEnd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(!ordiniPerData.equals(null))
		{
			request.setAttribute("ordiniPerData", ordiniPerData);
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
