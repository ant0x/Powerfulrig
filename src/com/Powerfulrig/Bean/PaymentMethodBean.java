package com.Powerfulrig.Bean;

import java.time.LocalDate;

public class PaymentMethodBean {
	
	private String 	card_number;
	private String card_bank;
	private int card_cvc;
	private LocalDate card_expiry;
	private String card_owner;
	private LocalDate date_registration_card;
	
	public String getCard_number() {
		return card_number;
	}
	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}
	public String getCard_bank() {
		return card_bank;
	}
	public void setCard_bank(String card_bank) {
		this.card_bank = card_bank;
	}
	public int getCard_cvc() {
		return card_cvc;
	}
	public void setCard_cvc(int card_cvc) {
		this.card_cvc = card_cvc;
	}
	public LocalDate getCard_expiry() {
		return card_expiry;
	}
	public void setCard_expiry(LocalDate card_expiry) {
		this.card_expiry = card_expiry;
	}
	public String getCard_owner() {
		return card_owner;
	}
	public void setCard_owner(String card_owner) {
		this.card_owner = card_owner;
	}
	public LocalDate getDate_registration_card() {
		return date_registration_card;
	}
	public void setDate_registration_card(LocalDate date_registration_card) {
		this.date_registration_card = date_registration_card;
	}
	@Override
	public String toString() {
		return "PaymentMethodBean [card_number=" + card_number + ", card_bank=" + card_bank + ", card_cvc=" + card_cvc
				+ ", card_expiry=" + card_expiry + ", card_owner=" + card_owner + ", date_registration_card="
				+ date_registration_card + "]";
	}
	
	
	

}
