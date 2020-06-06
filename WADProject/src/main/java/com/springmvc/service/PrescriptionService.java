package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.springmvc.dao.AppointmentDao;
import com.springmvc.dao.PrescriptionDao;
import com.springmvc.model.*;

public class PrescriptionService {
	@Autowired
	PrescriptionDao prescriptionDao;
	static private int prescription_id;
		
	public Prescription getPrescription(String patient_username, String doctor_username) {
		Prescription pres = prescriptionDao.getPrescription(patient_username, doctor_username);
		if (pres == null)
			return null;
		
		List <PrescribedMedicine> items = prescriptionDao.getPrescriptionMedicine(pres.getId());
		pres.getPrescription().setObjects(items);
		
		return pres;
	}
	
	public PrescribedMedicine getPrescribedMedicine(String id, String amount) {
		PrescribedMedicine med = prescriptionDao.getPrescribedMedicine(id);
		med.setAmount(Integer.parseInt(amount));
		return med;
	}
	
	public void confirm(Prescription pres, String diagnosis, String from_to) {
		prescription_id = prescriptionDao.initializeID();
		
		prescriptionDao.addPrescription(pres, prescription_id, diagnosis, from_to);
		
		ObjectListContainer <PrescribedMedicine> prescription = pres.getPrescription();
		List <PrescribedMedicine> meds = prescription.getObjects();
		
		for (int i = 0; i < meds.size(); i++) {
			prescriptionDao.addPrescribedMedicine(meds.get(i), prescription_id);
		}
		
	}
}
