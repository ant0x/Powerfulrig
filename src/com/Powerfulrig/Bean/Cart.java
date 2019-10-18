package com.Powerfulrig.Bean;

/* TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO
 * TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO
 */

import java.util.ArrayList;

import com.Powerfulrig.Bean.Prodotto;


public class Cart 
{
	public ArrayList<Prodotto> products;
	
	public Cart()
	{
		products=new ArrayList<Prodotto>();
	}
	
	public synchronized boolean addProduct(Prodotto product)
	{
		int I=0;
		
		if(products.size()==0)
		{
			products.add(product);
			products.get(products.size()-1).setQuantita(1);
			return true;
		}
		
		for(I=0;I<products.size();I++)
		{
			if(product.getTipo().equals(products.get(I).getTipo()) && product.getModello().equals(products.get(I).getModello()))
			{
				if(products.get(I).getQuantita() < product.getQuantita())
				{
					products.get(I).setQuantita(products.get(I).getQuantita()+1);
					return true;
				}
				else
					return false;
			}
		}
				
		if(I==products.size())
		{
			products.add(product);
			products.get(products.size()-1).setQuantita(1);
			return true;
		}
		else
			return false;
	}
	
	@Override
	public synchronized String toString() {
		return "Cart [products=" + products + "]";
	}
	
	public synchronized boolean addQuantity(Prodotto product, int quantity)
	{
		for(int I=0;I<products.size();I++)		//si scorrono tutti i prodotti presenti nel cart fincha non si trova quello deisderato
		{
			if(product.getTipo().equals(products.get(I).getTipo()) && product.getModello().equals(products.get(I).getModello()))
			{
				if(quantity < product.getQuantita())
				{
					products.get(I).setQuantita(quantity);
					return true;
				}
			}
		}
		return false;
	}
	
	public synchronized int getNumberProductsInCart()
	{
		int c=0;
		
		for(int I=0;I<products.size();I++)
		{
			c=c+products.get(I).getQuantita();
		}
		return c;
	}
	
	public synchronized void deleteProduct(Prodotto product)
	{
		for(Prodotto prod: products) 
		{
			if(prod.getTipo().equals(product.getTipo()) && prod.getModello().equals(product.getModello())) 
			{
				products.remove(prod);
				break;
			}
		}
 	}
	
	public synchronized ArrayList<Prodotto> getProducts() 
	{
		return products;
	}
		
	public synchronized double getTotale()
	{
		double totale = 0;
		
		for(int I=0; I<products.size(); I++)
			totale = totale + (products.get(I).getPrezzo() * products.get(I).getQuantita());
		
		totale = Math.rint(totale*Math.pow(10,2))/Math.pow(10,2);
		
		return totale;
	}
	
	public synchronized void clearCart()
	{
		products.clear(); 
	}
	
}
