package com.springmvc.model;

import java.util.List;

/**
 * POJO class for handling lists of doctors
 */
public class DoctorListContainer <T> {
    private List <T> doctors;

	public DoctorListContainer() {}

	/* Object list tasks */
    public List <T> getDoctors() {
        return doctors;
    }
    public void setDoctors(List <T> doctors) {
        this.doctors = doctors;
    }
}
