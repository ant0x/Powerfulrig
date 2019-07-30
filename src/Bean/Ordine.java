package Bean;

import java.util.ArrayList;

public class Ordine
{
	private int quantità;
	private float prezzo;
	private ArrayList<Prodotto> prodotti;
	private float totale;
	private int numeroOrdine;
	private Utente user;
	
	public Ordine()
	{
		prodotti=new ArrayList<Prodotto>();
	}
	
	public int getNumeroOrdine() 
	{
		return numeroOrdine;
	}

	public void setNumeroOrdine(int numeroOrdine)
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
	
	public void setProdotti(Prodotto prod)
	{
		this.prodotti.add(prod.clone());
	}
	
	public ArrayList<Prodotto> getProdotti()
	{
		ArrayList<Prodotto> clone=new ArrayList<Prodotto>();
		for(Prodotto prod:prodotti)
			clone.add(prod.clone());
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
	
}
