package Bean;

public class Prodotto implements Cloneable
{
	private int watt;
	private int idProdotto;
	private int percentualeSconto;
	private float prezzo;
	private String specifiche;
	private String marca;
	private int quantita;
	private String modello;
	private String nome;
	private String immagine;
	private String tipo;
	private String descrizione;
	
	public Prodotto()
	{}
	
	public String getDescrizione() 
	{
		return descrizione;
	}

	public void setDescrizione(String descrizione)
	{
		this.descrizione = descrizione;
	}

	public int getWatt() 
	{
		return watt;
	}

	public void setWatt(int watt) 
	{
		this.watt = watt;
	}
	
	public String getTipo()
	{
		return this.tipo;
	}
	
	public void setTipo(String tipo) 
	{
		this.tipo=tipo;
	}
	
	public int getIdProdotto() 
	{
		return idProdotto;
	}

	public void setIdProdotto(int idProdotto) 
	{
		this.idProdotto = idProdotto;
	}

	public int getPercentualeSconto() 
	{
		return percentualeSconto;
	}

	public void setPercentualeSconto(int percentualeSconto) 
	{
		this.percentualeSconto = percentualeSconto;
	}

	public float getPrezzo() 
	{
		return prezzo;
	}

	public void setPrezzo(float prezzo) 
	{
		this.prezzo = prezzo;
	}

	public String getSpecifiche()
	{
		return specifiche;
	}

	public void setSpecifiche(String specifiche) 
	{
		this.specifiche = specifiche;
	}

	public String getMarca()
	{
		return marca;
	}

	public void setMarca(String marca) 
	{
		this.marca = marca;
	}

	public int getQuantita() 
	{
		return quantita;
	}

	public void setQuantita(int quantita)
	{
		this.quantita = quantita;
	}

	public String getModello() 
	{
		return modello;
	}

	public void setModello(String modello) 
	{
		this.modello = modello;
	}

	public String getNome() 
	{
		return nome;
	}

	public void setNome(String nome) 
	{
		this.nome = nome;
	}
	
	public String getImmagine() 
	{
		return immagine;
	}

	public void setImmagine(String immagine)
	{
		this.immagine = immagine;
	}
	
	public Prodotto clone()
	{
		try 
		{
			Prodotto clone=(Prodotto) super.clone();
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
		return "watt=" + watt + ", idProdotto=" + idProdotto + ", percentualeSconto=" + percentualeSconto+ ", prezzo=" + prezzo + ", specifiche=" + specifiche + ", marca=" + marca + ", quantita=" + quantita
				+ ", modello=" + modello + ", nome=" + nome + ", immagine=" + immagine + "]";
	}
}
