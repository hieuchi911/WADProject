package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.springmvc.dao.ManagerDao;

public class ManagerService {
	@Autowired
	ManagerDao managerDao;
	
	public void addDoctor(String[] atts) {
		managerDao.addDoctor(atts);
	}

	public void addMedicine(String[] atts) {
		managerDao.addMedicine(atts);
	}
	
	public void addTool(String[] atts) {
		managerDao.addTool(atts);
	}
}
