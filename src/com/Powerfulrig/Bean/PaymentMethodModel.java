package com.Powerfulrig.Bean;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

public interface PaymentMethodModel {

	public ArrayList<PaymentMethodBean> doRetrieveByEmail(String Email) throws SQLException;
	
	public PaymentMethodBean doRetrieveByCardNumber(String card_number) throws SQLException;
	
	public boolean deletePaymentMethod(String card_number)throws SQLException;
	
	public boolean createPaymentMethod(String card_number,String card_bank, int card_cvc,LocalDate card_expiry,String card_owner,LocalDate date_registration_card)throws SQLException;
	
}
