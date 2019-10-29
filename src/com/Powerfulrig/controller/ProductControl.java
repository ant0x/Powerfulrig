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
import javax.servlet.http.HttpSession;

import com.Powerfulrig.Bean.Cart;
import com.Powerfulrig.Bean.Prodotto;
import com.Powerfulrig.Model.*;

@SuppressWarnings("serial")
@WebServlet("/Product")
public class ProductControl extends HttpServlet
{
	
	public ProductControl() 
	{
		super();
	}
	
	static DAOProdotto model_product=new DAOProdotto();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Cart cart;
		HttpSession session = request.getSession();
		synchronized(session) 
		{
			cart = (Cart) session.getAttribute("Carrello");
			
			/* se il carrello a vuoto lo aggiunge alla sessione */
			if(cart == null) 
			{
				cart = new Cart();
				session.setAttribute("Carrello", cart);
			}
		}
				
		String action = request.getParameter("action");
		String comp_name = request.getParameter("comp_name");
		String action_name = "Ultimi Arrivi";
		
		try {
			if(action != null) 
			{
				if(action.contains("_comp"))
				{
				/*REMOVE*/
					request.removeAttribute("comp_name");
					request.removeAttribute("component");
					request.removeAttribute("action_name");
					//action="'"+action+"'";
					log("l'action nuovo è "+action);
					System.out.println("l'action nuovo è "+action);
					/*SET ATTRIBUTE*/
					request.setAttribute("component", action);
					request.setAttribute("comp_name", comp_name);
				}
				else if(action.equals("lastarrived"))
				{		
					request.removeAttribute("action_name");
					request.removeAttribute("comp_name");
					request.removeAttribute("component");
					
					request.setAttribute("action_name", action_name);
				}
				else if(action.equals("brands"))
				{					
					request.removeAttribute("products");
					request.removeAttribute("brand");
					
					String brand = request.getParameter("brand");
					
					request.setAttribute("brand", brand);
				}
				else if(action.equals("prodotto"))
				{
					request.removeAttribute("product");
					
					String type_prod = request.getParameter("type_prod");
					String model_prod = request.getParameter("model_prod");
					ArrayList<Prodotto> app=model_product.viewProduct("Modello", model_prod,"Tipo",type_prod);
					request.setAttribute("product", app.get(0));
				}
				else if(action.equals("addProduct"))
				{
					String type_prod = request.getParameter("type_prod");
					String model_prod = request.getParameter("model_prod");

					ArrayList<Prodotto> bean = new ArrayList<Prodotto>();
					bean=model_product.viewProduct("Tipo",type_prod,"Modello",model_prod);
					Prodotto beanApp= bean.get(0);
					
					beanApp.setPrezzo((beanApp.getPrezzo()*beanApp.getPercentualeSconto())/100);
					cart.addProduct(beanApp);
					
					
					synchronized(session)
					{
						session.setAttribute("Carrello", cart);
					}
				}
				else if (action.equals("deleteProd")) 
				{
					String type_prod = request.getParameter("type_prod");
					String model_prod = request.getParameter("model_prod");
					ArrayList<Prodotto> beanApp = model_product.viewProduct(type_prod, model_prod);
					cart.deleteProduct(beanApp.get(0));
					
					String user_email = null;
					synchronized(session) 
					{
						session.setAttribute("Carrello", cart);
						user_email = (String) session.getAttribute("email");
						session.setAttribute("email", user_email);
					}
				}
				else if (action.equals("modify_product")) 
				{
					request.removeAttribute("product");
					
					String type_prod = request.getParameter("type_prod");
					String model_prod = request.getParameter("model_prod");
					
					request.setAttribute("product", model_product.viewProduct(type_prod, model_prod));	
				}
				else if (action.equals("removeProd")) 
				{
					String id = request.getParameter("id");
					
					model_product.cancelProduct(id);
				}
				else if (action.equals("addQuantity"))
				{
					String type_prod = request.getParameter("type_prod");
					String model_prod = request.getParameter("model_prod");
					int qnt_to_add = Integer.parseInt(request.getParameter("qnt_to_add"));
					
					ArrayList<Prodotto> bean = model_product.viewProduct(type_prod, model_prod);
					
					if(!cart.addQuantity(bean.get(0), qnt_to_add))
					{
						response.setStatus(500);
					}										
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		//TODO
		RequestDispatcher dispatcher;
					
		if(action.equals("Cpu_comp")) 
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
		else if(action.equals("heatsink_comp"))
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
		else if(action.equals("Gpu_comp"))
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
		else if(action.equals("motherboard_comp"))
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
		else if(action.equals("ram_comp"))
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
		else if(action.equals("storage_comp"))
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
		else if(action.equals("Psu_comp"))
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
		else if(action.equals("Case_comp"))
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
		else if(action.equals("lastarrived"))
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
		else if(action.equals("Monitor_comp"))
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
		else if(action.equals("keyboard_comp"))
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
		else if(action.equals("mouse_comp"))
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
		else if(action.equals("headphones_comp"))
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
		else if(action.equals("Sedia_comp"))
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
		else if(action.equals("Pc_comp"))
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
		else if(action.equals("prodotto"))
			dispatcher = getServletContext().getRequestDispatcher("/prodotto.jsp");
		else if(action.equals("modify_product"))
			dispatcher = getServletContext().getRequestDispatcher("/modifica_prodotto.jsp");
		else if (action.equals("ordine"))
			dispatcher = getServletContext().getRequestDispatcher("/ordine.jsp");
		else if(action.equals("addProduct"))
			dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
		else if(action.equals("removeProd"))
			dispatcher = getServletContext().getRequestDispatcher("/area-admin.jsp");
		else if(action.equals("brands"))
			dispatcher = getServletContext().getRequestDispatcher("/categoria-prodotti.jsp");
			else
				dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
		
			dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
