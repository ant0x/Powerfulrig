package com.Powerfulrig.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Powerfulrig.Bean.Prodotto;
import com.Powerfulrig.Model.*;


@SuppressWarnings("serial")
@WebServlet("/Cerca")
public class Cerca extends HttpServlet 
{
		
		static DAOProdotto model_product = new DAOProdotto();
		
		public Cerca() 
		{
			super();
		}
		
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
		{
				String cerca = request.getParameter("cerca");
				String redirectedPage = "";
				
				try {
					
					ArrayList<Prodotto> products = new ArrayList<Prodotto>();
					ArrayList<Prodotto> productsResult = new ArrayList<Prodotto>();
					
					request.removeAttribute("products");
					
					products = model_product.viewProduct();
					int I = 0;					
					String parola="";
					int indiceScorrimentoParolaFine = 1;
					boolean trovato = false;
					
					while (I<products.size())
					{
						for(int indiceScorrimentoParolaInizio = 0  ;indiceScorrimentoParolaInizio <= products.get(I).getNome().length()-1 && !trovato ; indiceScorrimentoParolaInizio++)
						{
							for( indiceScorrimentoParolaFine = indiceScorrimentoParolaInizio +1  ;indiceScorrimentoParolaFine <= products.get(I).getNome().length() && !trovato; indiceScorrimentoParolaFine++)
							{
								parola= products.get(I).getNome().substring(indiceScorrimentoParolaInizio, indiceScorrimentoParolaFine);
									if(parola.equalsIgnoreCase(cerca))
									{
										productsResult.add(products.get(I));
										trovato=true;
									}
							}
							
						}				
						I++;
						trovato=false;
					}
					
					String ricerca = ("Hai cercato: "+cerca);

					request.getSession().setAttribute("ricerca", ricerca);
					request.getSession().setAttribute("products", productsResult);	
					
					redirectedPage = "/categoria-prodotti.jsp";
					
					} catch (Exception e) {
						redirectedPage = "/categoria-prodotti.jsp";
						e.printStackTrace();
					}
				
			response.sendRedirect(request.getContextPath() + redirectedPage);
			
		}
	
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{
			doPost(request, response);
		}
			
}
