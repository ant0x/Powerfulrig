package com.Powerfulrig.Bean;

public class Spedizione implements Cloneable
{
	private int idSpedizione;
	private String stato;
	private String dataPartenza;
	private String DataArrivo;
	private String cittaDestinazione;

	public int getIdSpedizione() 
	{
		return idSpedizione;
	}
	
	public void setIdSpedizione(int idSpedizione) 
	{
		this.idSpedizione = idSpedizione;
	}
	
	public String getStato()
	{
		return stato;
	}
	
	public void setStato(String stato) 
	{
		this.stato = stato;
	}
	
	public String getDataPartenza()
	{
		return dataPartenza;
	}
	
	public void setDataPartenza(String dataPartenza) 
	{
		this.dataPartenza = dataPartenza;
	}
	
	public String getDataArrivo()
	{
		return DataArrivo;
	}
	
	public void setDataArrivo(String dataArrivo)
	{
		DataArrivo = dataArrivo;
	}
	
	public String getCittaDestinazione() 
	{
		return cittaDestinazione;
	}
	
	public void setCittaDestinazione(String cittaDestinazione)
	{
		this.cittaDestinazione = cittaDestinazione;
	}

	public Spedizione clone()
	{
		try 
		{
			Spedizione clone=(Spedizione) super.clone();
			return clone;
		} 
		catch (CloneNotSupportedException e)
		{
			return null;
		}
	}
	
	@Override
	public String toString() 
	{
		return "idSpedizione=" + idSpedizione + ", stato=" + stato + ", dataPartenza=" + dataPartenza
				+ ", DataArrivo=" + DataArrivo + ", cittaDestinazione=" + cittaDestinazione + "]";
	}



}
