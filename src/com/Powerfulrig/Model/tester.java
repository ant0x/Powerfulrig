<<<<<<< HEAD
package com.Powerfulrig.Model;


import java.sql.SQLException;
import java.util.ArrayList;

import com.Powerfulrig.Bean.Ordine;
import com.Powerfulrig.Bean.Prodotto;

public class tester
{
	public static void main(String[] args) throws SQLException 
	{
		/*ArrayList<Ordine> t=DAOOrdine.viewOrdineById("antonio.baldi");
		System.out.println("abbiamo "+t.size()+" ordini effettuati");
		Ordine o=t.get(0);
		o.getProdotti().get(0).setPercentualeSconto(20);
		o.setMetodoPagamento("proa");
		System.out.println(o.toString());
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		int quantità=DAOProdotto.viewProduct("IdProdotto",String.valueOf(o.getProdotti().get(0).getIdProdotto())).get(0).getQuantita()-o.getQuantità();
		System.out.println(quantità);
		if(DAOProdotto.modifyProduct("Quantita",String.valueOf((quantità)),"PercentualeSconto",String.valueOf(o.getProdotti().get(0).getPercentualeSconto()),"IdProdotto",String.valueOf(o.getProdotti().get(0).getIdProdotto())))	
			System.out.println("ok");
		else
			System.out.println("fail");
		 */
		//System.out.println(f);
		/*for(Ordine p:f)
		{
			System.out.println(p.getUser().toString());
			ArrayList<Prodotto> a=p.getProdotti();
			for(int i=0;i<a.size();i++)
				System.out.println(p.getProdotti().get(i).toString());
			System.out.println("\n");
		}*/
		
		Prodotto prod=new Prodotto();
		prod.setDescrizione("lavor bene");
		prod.setImmagine("nero col pisello lungo");
		prod.setMarca("afganista");
		prod.setModello("nero");
		prod.setNome("abdul");
		prod.setPercentualeSconto(23);
		prod.setPrezzo(213);
		prod.setQuantita(12);
		prod.setSpecifiche("DAdasdasd");
		prod.setTipo("CPU");
		prod.setWatt(123);
		if(DAOProdotto.addProduct(prod))
			System.out.println("ok");
		else
			System.out.println("fail");
		if(DAOUser.modificaAccount("tipo","admin","email","antonio.baldi98@gmail.com"))
			System.out.println("ok");
		else
			System.out.println("fail");
		if(DAOUser.checkEmail("antonio.baldi98@gmadil.com"))
			System.out.println("ok");
		else
			System.out.println("fail");
	}
	//System.out.println(DAOProdotto.modifyProduct("Quantita",));

}

=======
package com.Powerfulrig.Model;


import java.sql.SQLException;
import java.util.ArrayList;

import com.Powerfulrig.Bean.Ordine;
import com.Powerfulrig.Bean.Prodotto;

public class tester
{
	public static void main(String[] args) throws SQLException 
	{
		/*ArrayList<Ordine> t=DAOOrdine.viewOrdineById("antonio.baldi");
		System.out.println("abbiamo "+t.size()+" ordini effettuati");
		Ordine o=t.get(0);
		o.getProdotti().get(0).setPercentualeSconto(20);
		o.setMetodoPagamento("proa");
		System.out.println(o.toString());
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		int quantita=DAOProdotto.viewProduct("IdProdotto",String.valueOf(o.getProdotti().get(0).getIdProdotto())).get(0).getQuantita()-o.getQuantita();
		System.out.println(quantita);
		if(DAOProdotto.modifyProduct("Quantita",String.valueOf((quantita)),"PercentualeSconto",String.valueOf(o.getProdotti().get(0).getPercentualeSconto()),"IdProdotto",String.valueOf(o.getProdotti().get(0).getIdProdotto())))	
			System.out.println("ok");
		else
			System.out.println("fail");
		 */
		//System.out.println(f);
		/*for(Ordine p:f)
		{
			System.out.println(p.getUser().toString());
			ArrayList<Prodotto> a=p.getProdotti();
			for(int i=0;i<a.size();i++)
				System.out.println(p.getProdotti().get(i).toString());
			System.out.println("\n");
		}*/
		
		Prodotto prod=new Prodotto();
		prod.setDescrizione("lavor bene");
		prod.setImmagine("nero col pisello lungo");
		prod.setMarca("afganista");
		prod.setModello("nero");
		prod.setNome("abdul");
		prod.setPercentualeSconto(23);
		prod.setPrezzo(213);
		prod.setQuantita(12);
		prod.setSpecifiche("DAdasdasd");
		prod.setTipo("CPU");
		prod.setWatt(123);
		if(DAOProdotto.addProduct(prod))
			System.out.println("ok");
		else
			System.out.println("fail");
		if(DAOUser.modificaAccount("tipo","admin","email","antonio.baldi98@gmail.com"))
			System.out.println("ok");
		else
			System.out.println("fail");
		if(DAOUser.checkEmail("antonio.baldi98@gmadil.com"))
			System.out.println("ok");
		else
			System.out.println("fail");
	}
	//System.out.println(DAOProdotto.modifyProduct("Quantita",));

}

>>>>>>> branch 'master' of https://github.com/ant0x/Powerfulrig.git
