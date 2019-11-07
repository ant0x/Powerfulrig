package com.Powerfulrig.Bean;

import java.util.ArrayList;


public class Ordine
{
	public Ordine()
	{
	}

	public Prodotto getProdotti() {
		return prodotti;
	}

	public void setProdotti(Prodotto prodotti) {
		this.prodotti = prodotti;
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

	public int getQuantita()
	{
		return quantita;
	}

	public void setQuantita(int quantita) 
	{
		this.quantita = quantita;
	}

	@Override
	public String toString() {
		return "Ordine [quantita=" + quantita + ", prezzo=" + prezzo + ", prodotti=" + prodotti + ", totale=" + totale
				+ ", numeroOrdine=" + numeroOrdine + ", user=" + user + ", data=" + data + ", metodoPagamento="
				+ metodoPagamento + "]";
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
		this.prodotti = prod;
	}



	public void setUser(Utente user)
	{
		this.user=user.clone();
	}

	public Utente getUser()
	{
		return user.clone();
	}

	public String getStato() {
		return stato;
	}

	public void setStato(String stato) {
		this.stato = stato;
	}




	public String getMetodoPagamento() 
	{
		return metodoPagamento;
	}

	public void setMetodoPagamento(String metodoPagamento) 
	{
		this.metodoPagamento = metodoPagamento;
	}
	public ArrayList<Prodotto> getLista() {
		return lista;
	}

	public void setLista(ArrayList<Prodotto> productsToBuy) {
		this.lista = productsToBuy;
	}
	private ArrayList<Prodotto> lista = new ArrayList<Prodotto>();
	private int quantita;
	private float prezzo;
	private Prodotto prodotti;
	private float totale;
	private String numeroOrdine;
	private Utente user;
	private String data;
	private String metodoPagamento;
	private String stato;
	

}
