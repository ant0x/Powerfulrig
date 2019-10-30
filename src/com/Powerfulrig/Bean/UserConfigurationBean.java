package com.Powerfulrig.Bean;


import java.time.LocalDate;

public class UserConfigurationBean {

	private int  id_configuration = 0;
	private String owner_configuration = null;
	private LocalDate creation_date = null;
	private float configuration_price = 0;
	private String name_configuration = null;
	private String cpu_in_configuration = null;
	private String gpu_in_configuration = null;
	private String ram_in_configuration = null;
	private String case_in_configuration = null;
	private String motherboard_in_configuration = null;
	private String psu_in_configuration = null;
	private String storage_in_configuration = null;
	private String heatsink_in_configuration = null;
	
	public int get_id_configuration() {
		return  id_configuration;
	}
	public void set_id_configuration(int  id_configuration) {
		this. id_configuration =  id_configuration;
	}
	public String getOwner_configuration() {
		return owner_configuration;
	}
	public void setOwner_configuration(String owner_configuration) {
		this.owner_configuration = owner_configuration;
	}
	public String getname_configuration() {
		return name_configuration;
	}
	public void setname_configuration(String name_configuration) {
		this.name_configuration = name_configuration;
	}
	public String getCpu_in_configuration() {
		return cpu_in_configuration;
	}
	public void setCpu_in_configuration(String cpu_in_configuration) {
		this.cpu_in_configuration = cpu_in_configuration;
	}
	public String getGpu_in_configuration() {
		return gpu_in_configuration;
	}
	public void setGpu_in_configuration(String gpu_in_configuration) {
		this.gpu_in_configuration = gpu_in_configuration;
	}
	public String getRam_in_configuration() {
		return ram_in_configuration;
	}
	public void setRam_in_configuration(String ram_in_configuration) {
		this.ram_in_configuration = ram_in_configuration;
	}
	public String getCase_in_configuration() {
		return case_in_configuration;
	}
	public void setCase_in_configuration(String case_in_configuration) {
		this.case_in_configuration = case_in_configuration;
	}
	public String getMotherboard_in_configuration() {
		return motherboard_in_configuration;
	}
	public void setMotherboard_in_configuration(String motherboard_in_configuration) {
		this.motherboard_in_configuration = motherboard_in_configuration;
	}
	public String getpsu_in_configuration() {
		return psu_in_configuration;
	}
	public void setpsu_in_configuration(String psu_in_configuration) {
		this.psu_in_configuration = psu_in_configuration;
	}
	public String getStorage_in_configuration() {
		return storage_in_configuration;
	}
	public void setStorage_in_configuration(String storage_in_configuration) {
		this.storage_in_configuration = storage_in_configuration;
	}
	public String getHeatsink_in_configuration() {
		return heatsink_in_configuration;
	}
	public void setHeatsink_in_configuration(String heatsink_in_configuration) {
		this.heatsink_in_configuration = heatsink_in_configuration;
	}
	public LocalDate getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(LocalDate creation_date) {
		this.creation_date = creation_date;
	}
	public float getConfiguration_price() {
		return configuration_price;
	}
	public void setConfiguration_price(float configuration_price) {
		this.configuration_price = configuration_price;
	}
	
	@Override
	public String toString() {
		return "UserConfigurationBean [ id_configuration=" +  id_configuration + ", owner_configuration="
				+ owner_configuration + ", creation_date=" + creation_date + ", configuration_price="
				+ configuration_price + ", name_configuration=" + name_configuration
				+ ", cpu_in_configuration=" + cpu_in_configuration + ", gpu_in_configuration=" + gpu_in_configuration
				+ ", ram_in_configuration=" + ram_in_configuration + ", case_in_configuration=" + case_in_configuration
				+ ", motherboard_in_configuration=" + motherboard_in_configuration + ", psu_in_configuration="
				+ psu_in_configuration + ", storage_in_configuration=" + storage_in_configuration
				+ ", heatsink_in_configuration=" + heatsink_in_configuration + "]";
	}
		
}
