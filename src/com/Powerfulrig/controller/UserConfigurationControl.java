package com.Powerfulrig.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Powerfulrig.Bean.Cart;
import com.Powerfulrig.Model.UserConfigurationDAO;

@SuppressWarnings("serial")
@WebServlet("/UserConfiguration")
public class UserConfigurationControl extends HttpServlet 
{

	static UserConfigurationDAO model_user_conf = new UserConfigurationDAO();
	

	public UserConfigurationControl()
	{
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cart cart;
		HttpSession session = request.getSession();
		synchronized(session) 
		{
			cart = (Cart) session.getAttribute("Carrello");
			
			/* se il carrello è vuoto lo aggiunge alla sessione */
			if(cart == null) 
			{
				cart = new Cart();
				session.setAttribute("Carrello", cart);
			}
		}
		
		String action = request.getParameter("action");
		
		try
		{
			if(action != null)
			{
				if(action.equals("createConf"))
				{
					String Email = request.getParameter("Mail");
					String confName = request.getParameter("confName");
					
					model_user_conf.createUserConfiguration(confName, Email);
				}
				else if(action.equals("deleteConf"))
				{
					int id_conf = Integer.parseInt(request.getParameter("id_conf"));
					
					model_user_conf.deleteUserConfiguration(id_conf);
				}
				else if(action.equals("showConf"))
				{
					int id_conf = Integer.parseInt(request.getParameter("id_conf"));
					
					request.setAttribute("conf", model_user_conf.retrieveById(id_conf));
				}
				else if(action.equals("deleteComponent"))
				{
					String id_comp = request.getParameter("id_comp");
					String id_conf = request.getParameter("id_conf");
					String model_comp = request.getParameter("model_comp");
					if(!model_user_conf.deleteComponentFromConfiguration(id_conf, id_comp,model_comp))
					{
						response.setStatus(500);
					}
				}
				else if (action.equals("addComponentToConf"))
				{
					String id_comp = request.getParameter("id_comp");
					String id_prod = request.getParameter("idprod");
					String id_conf = request.getParameter("id_conf");
					String model_comp = request.getParameter("model_comp");					
					if(model_user_conf.checkConf(id_comp, id_conf)) { //SE LA COMPONENTE NON E' PRESENTE
						model_user_conf.addComponentToConf(id_comp, id_prod, id_conf, model_comp); //LA INSERISCE DIRETTAMENTE
					}
					else {
						response.setStatus(500);  //ALTRIMENTI RITORNA UNO STATUS CODE DI ERRORE (QUESTO FA IN MODO DI FAR SCEGLIERE SE SOSTITUIRE O MENO CON IL PROSEGUIO DELLA CHIAMATA AJAX IN prodotto.jsp)
					}
				}
				else if (action.equals("modifyComponentInConf"))
				{
					String id_comp = request.getParameter("id_comp");
					String id_prod = request.getParameter("idprod");
					String id_conf = request.getParameter("id_conf");
					String model_comp = request.getParameter("model_comp");
					
					model_user_conf.addComponentToConf(id_comp,id_prod, id_conf,model_comp);
				}
				else if (action.equals("buyConfiguration"))
				{
					String id_conf = request.getParameter("id_conf");
					
					model_user_conf.buyConfiguration(id_conf, cart);
					
					synchronized(session)
					{
						session.setAttribute("Carrello", cart);
					}
				}
			}

		} catch(Exception e)
		{
			e.printStackTrace();
		}
		
			
			RequestDispatcher dispatcher;
			if(action.equals("createConf"))
				dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
			else if(action.equals("showConf"))
				dispatcher = getServletContext().getRequestDispatcher("/configurazione.jsp");
			else
				dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
			
				dispatcher.forward(request, response);
			
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			doGet(request, response);
		}

}
