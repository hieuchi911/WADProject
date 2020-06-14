package com.springmvc.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class ManagerDao {
	// The followings are necessary to establish database connection
	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	public void addDoctor(String[] atts) {
		// TODO Auto-generated method stub
		
	}

	public void addMedicine(String[] atts) {
		// TODO Auto-generated method stub
		
	}

	public void addTool(String[] atts) {
		// TODO Auto-generated method stub
		
	}

}
