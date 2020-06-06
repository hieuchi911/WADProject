package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.*;
import com.springmvc.service.PrescriptionService;
import com.springmvc.service.ShoppingService;


@Controller
public class PrescriptionController {
	@Autowired
	ShoppingService shopService;
	
	@Autowired
	PrescriptionService prescriptionService;
	
	/* ---------------------------- createPrecription --------------------------------------
	 * This method handles the zoom meeting link
	 */
	@RequestMapping(value = "/prescribe-{username}", method = RequestMethod.GET)
	public ModelAndView createPrecription(HttpServletRequest request, HttpServletResponse response,
			@PathVariable String username, @SessionAttribute User user) {
		ModelAndView mav = new ModelAndView("prescribe");
			
		ObjectListContainer<ShopObject> objects = new ObjectListContainer<ShopObject>();
		objects.setObjects(shopService.getShopObjectsByCategory("medicine"));
		mav.addObject("objects", objects);
		
		HttpSession sess = request.getSession();
		Prescription pres = (Prescription) sess.getAttribute("prescription");
		
		if (pres == null) {
			pres = new Prescription();
			pres.setDoctor(user.getUsername());
			pres.setPatient(username);
			pres.setPrescription(new ObjectListContainer <PrescribedMedicine>());

			sess.setAttribute("prescription", pres);
		} 
		
		return mav;
	}
	
	/* ---------------------------- takePrescription --------------------------------------
	 * This method lets the patient user see the prescription of their doctor
	 */
	@RequestMapping(value = "/take-{username}", method = RequestMethod.GET)
	public ModelAndView takePrescription(HttpServletRequest request, HttpServletResponse response,
			@PathVariable String username, @SessionAttribute User user) {
		ModelAndView mav;
		
		Prescription pres = prescriptionService.getPrescription(user.getUsername(), username);
		if (pres == null) {
			mav = new ModelAndView("redirect:/patient-accepted-requests");		
		} else {
			mav = new ModelAndView("patientprescription");		
			mav.addObject("prescription", pres);
		}
				
		return mav;
	}
	
	
	/* ---------------------------- buyPrescription --------------------------------------
	 * This method lets the patient user buy the prescription of their doctor
	 */
	@RequestMapping(value = "/buy-prescription-${doctor_username}", method = RequestMethod.GET)
	public ModelAndView buyPrescription(HttpServletRequest request, HttpServletResponse response,
			@PathVariable String doctor_username, @SessionAttribute User user) {
		ModelAndView mav;
		
		Prescription pres = prescriptionService.getPrescription(user.getUsername(), doctor_username);
		
		return mav;
	}
	
	
	
	/* ---------------------------- addMedicine2Prescription --------------------------------------
	 * This method adds a medicine into prescription with some amount
	 */
	@RequestMapping(value = "/add-medicine-{id}", method = RequestMethod.POST)
	public ModelAndView addMedicine2Prescription(HttpServletRequest request, HttpServletResponse response,
			@PathVariable String id, @SessionAttribute User user) {
		HttpSession sess = request.getSession();
		Prescription pres = (Prescription) sess.getAttribute("prescription");
		String amount = request.getParameter("amount");
		
		String link = "redirect:/prescribe-" + pres.getPatient();
		ModelAndView mav = new ModelAndView(link);
		
		ObjectListContainer <PrescribedMedicine> prescription = pres.getPrescription();
		List<PrescribedMedicine> items = prescription.getObjects();
		
		boolean isPresent = false;
		for (int i = 0; i < items.size(); i++) {
			if (items.get(i).getId().equals(id)) {
				isPresent = true;
				items.get(i).setAmount(items.get(i).getAmount() + Integer.parseInt(amount));
				break;
			}
		}
		
		if (!isPresent) {
			items.add(prescriptionService.getPrescribedMedicine(id, amount));
		}
		
		prescription.setObjects(items);
		pres.setPrescription(prescription);
		
		sess.setAttribute("prescription", pres);
		return mav;
	}
	
	/* ---------------------------- removeMedicine --------------------------------------
	 * This method removes a prescribed medicine from the prescription
	 */
	@RequestMapping(value = "/removemed-{id}", method = RequestMethod.GET)
	public ModelAndView removeMedicine(HttpServletRequest request, HttpServletResponse response,
			@PathVariable String id, @SessionAttribute User user) {
		HttpSession sess = request.getSession();
		Prescription pres = (Prescription) sess.getAttribute("prescription");
		
		ObjectListContainer <PrescribedMedicine> prescription = pres.getPrescription();
		List<PrescribedMedicine> items = prescription.getObjects();
		
		for (int i = 0; i < items.size(); i++) {
			if (items.get(i).getId().equals(id)) {
				items.remove(i);
				break;
			}
		}
		
		prescription.setObjects(items);
		pres.setPrescription(prescription);
		sess.setAttribute("prescription", pres);
		
		String link = "redirect:/prescribe-" + pres.getPatient();
		ModelAndView mav = new ModelAndView(link);
	
		return mav;
	}
	
	/* ---------------------------- confirmPrescription --------------------------------------
	 * This method confirms the prescription and saves it into database
	 */
	@RequestMapping(value = "/confirm-prescription", method = RequestMethod.GET)
	public ModelAndView confirmPrescription(HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute User user) {
		HttpSession sess = request.getSession();
		Prescription pres = (Prescription) sess.getAttribute("prescription");
		
		String diagnosis = request.getParameter("diagnosis");
		String from_to = request.getParameter("from-to");
		prescriptionService.confirm(pres, diagnosis, from_to);
		
		ModelAndView mav = new ModelAndView("redirect:/appointments");
		sess.setAttribute("prescription", null);

		return mav;
	}
}
