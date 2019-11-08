package com.Powerfulrig.controller;

import java.io.IOException;

import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Powerfulrig.Bean.Utente;
import com.Powerfulrig.Model.PaymentMethodDAO;



@WebServlet("/InsertPaymentMethod")
public class InsertPaymentMethod extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static PaymentMethodDAO model_payment = new PaymentMethodDAO();
	
    public InsertPaymentMethod() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//ottenimento dell'utenteLoggato
		Utente utenteLoggato = (Utente) request.getSession().getAttribute("utenteLoggato");
		
		String card_owner = utenteLoggato.getEmail();		//card_owner = username
		String card_bank = " ";
		String card_number = null;
		int card_cvc = 0;
		LocalDate card_expiry = null;
		LocalDate date_registration_card = null;
		
		card_bank = request.getParameter("card_type_selector");
		card_number = request.getParameter("codcarta");
		card_cvc = Integer.parseInt(request.getParameter("codcvc"));
		card_expiry = LocalDate.parse(request.getParameter("dataexpcarta"));
		date_registration_card = LocalDate.now(java.time.ZoneId.of("UTC"));
		
		try {
			if(model_payment.createPaymentMethod(card_number, card_bank, card_cvc, card_expiry, card_owner, date_registration_card))
			{
				request.setAttribute("isCardNumberValid", true);
				RequestDispatcher dispatcher = request.getRequestDispatcher("area-utente.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				request.setAttribute("isCardNumberValid", false);
				RequestDispatcher dispatcher = request.getRequestDispatcher("area-utente.jsp");
				dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
			e.printStackTrace();
		}
		finally
		{
			request.setAttribute("isCardNumberValid", false);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
