package Bean;

public class Utente implements Cloneable
{
	private String email;
	private String tipo;
	private String password;
	private String nome;
	private String cognome;
	private String via;
	private String cap;
	private int numeroCivico;
	private String numeroTelefono;

	public Utente () 
	{}

	public Utente(String email, String tipo, String password, String nome, String cognome) 
	{
		this.email = email;
		this.tipo = tipo;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
	}

	public String getEmail() 
	{
		return email;
	}

	public void setEmail(String email) 
	{
		this.email = email;
	}

	public String getTipo() 
	{
		return tipo;
	}

	public void setTipo(String tipo)
	{
		this.tipo = tipo;
	}

	public String getPassword() 
	{
		return password;
	}

	public void setPassword(String password) 
	{
		this.password = password;
	}

	public String getNome() 
	{
		return nome;
	}

	public void setNome(String nome) 
	{
		this.nome = nome;
	}

	public String getCognome()
	{
		return cognome;
	}

	public void setCognome(String cognome) 
	{
		this.cognome = cognome;
	}

	public String getVia() 
	{
		return via;
	}

	public void setVia(String via)
	{
		this.via = via;
	}

	public String getCap()
	{
		return cap;
	}

	public void setCap(String cap) 
	{
		this.cap = cap;
	}

	public int getNumeroCivico() 
	{
		return numeroCivico;
	}

	public void setNumeroCivico(int numeroCivico)
	{
		this.numeroCivico = numeroCivico;
	}

	public String getNumeroTelefono() {
		return numeroTelefono;
	}

	public void setNumeroTelefono(String numeroTelefono) 
	{
		this.numeroTelefono = numeroTelefono;
	}

	public Utente clone()
	{
		try 
		{
			Utente clone=(Utente) super.clone();
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
		return "email=" + email + ", tipo=" + tipo + ", password=" + password + ", nome=" + nome + ", cognome="+ cognome + ", via=" + via + ", cap=" + cap + ", numeroCivico=" + numeroCivico + ", numeroTelefono="+ numeroTelefono;
	}
	


}
