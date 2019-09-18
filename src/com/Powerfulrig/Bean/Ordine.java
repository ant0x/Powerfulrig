package com.Powerfulrig.Bean;

import java.util.ArrayList;


public class Ordine
{
	public Ordine()
	{
		prodotti=new ArrayList<Prodotto>();
	}
	
	public String getData() 
	{
		return data;
	}

	public void setData(String data) 
	{
		this.data = data;
	}

	public String getNumeroOrdine() 
	{
		return numeroOrdine;
	}

	public void setNumeroOrdine(String numeroOrdine)
	{
		this.numeroOrdine = numeroOrdine;
	}
	
	public int getQuantità()
	{
		return quantità;
	}

	public void setQuantità(int quantità) 
	{
		this.quantità = quantità;
	}

	public float getPrezzo() 
	{
		return prezzo;
	}

	public void setPrezzo(float prezzo) 
	{
		this.prezzo = prezzo;
	}

	public float getTotale()
	{
		return totale;
	}

	public void setTotale(float totale) 
	{
		this.totale = totale;
	}
	
	public void setProdotto(Prodotto prod)
	{
		this.prodotti.add(prod);
	}
	
	public ArrayList<Prodotto> getProdotti()
	{
		ArrayList<Prodotto> clone=new ArrayList<Prodotto>();
		for(Prodotto prod:prodotti)
			clone.add(prod);
		return clone;
	}
	
	public void setUser(Utente user)
	{
		this.user=user.clone();
	}
	
	public Utente getUser()
	{
		return user.clone();
	}
	
	
	@Override
	public String toString() 
	{
		String s="quantità=" + quantità + ", prezzo=" + prezzo + ", totale=" + totale + ", numeroOrdine="
				+ numeroOrdine + ", data=" + data +"\n"+ user.toString()+"\n";
		for(Prodotto prod:prodotti)
			s+=prod.toString()+"\n";
		return s;
		
	}

	public String getMetodoPagamento() 
	{
		return metodoPagamento;
	}

	public void setMetodoPagamento(String metodoPagamento) 
	{
		this.metodoPagamento = metodoPagamento;
	}
	
	private int quantità;
	private float prezzo;
	private ArrayList<Prodotto> prodotti;
	private float totale;
	private String numeroOrdine;
	private Utente user;
	private String data;
	private String metodoPagamento;
}
