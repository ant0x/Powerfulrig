package com.Powerfulrig.Bean;

import java.sql.SQLException;
import java.util.ArrayList;

public interface UserConfigurationModel {
	
	public boolean createUserConfiguration(String configurationName, String username) throws SQLException;
	
	public boolean deleteUserConfiguration(int id_conf) throws SQLException;
	
	public boolean deleteComponentFromConfiguration(String id_conf, String id_comp, String model_comp) throws SQLException;
	
	public boolean addComponentToConf(String id_comp, String label_comp, String model_comp) throws SQLException;

	public ArrayList<UserConfigurationBean> retrieveByEmail(String Email) throws SQLException;
	
	public UserConfigurationBean retrieveById(int id_conf) throws SQLException;

	public boolean checkConf(String id_comp, String id_conf) throws SQLException;
	
	public boolean buyConfiguration(String id_conf, Cart cart) throws SQLException;
}
