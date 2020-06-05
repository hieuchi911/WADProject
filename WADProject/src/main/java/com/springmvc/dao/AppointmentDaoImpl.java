package com.springmvc.dao;

import java.time.LocalDateTime;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.springmvc.model.Appointment;
import com.springmvc.model.Doctor;
import com.springmvc.model.ObjectListContainer;
import com.springmvc.model.Patient;
import com.springmvc.model.Prescription;
import com.springmvc.model.ShopObject;

public class AppointmentDaoImpl implements AppointmentDao{
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public Appointment makeAppointment(Appointment appointment) { // Need symptom report here, not yet handled
		String sql = "INSERT INTO appointment (doctor_username, patient_username, illness_description, from_to)"
				+ 																			"VALUES (?, ?, ?, ?);";
		jdbcTemplate.update(sql, new Object[] { appointment.getDoctor(), appointment.getPatient(), appointment.getIllness_description(), "none"});
		
		return appointment;
	}

	@Override
	public void rejectAppointment(Appointment appointment) {
		String sql = "DELETE FROM appointment "
				+ "WHERE doctor_username = '" + appointment.getDoctor()+ "' "
				+ "AND patient_username = '" + appointment.getPatient() + "';";
		jdbcTemplate.update(sql);
	}

	@Override
	public Appointment computeTime(String doctor, Patient patient) {
		
		String sql = "SELECT from_to FROM appointment WHERE doctor_username = '" + doctor + "';";
		List<String> from_to = jdbcTemplate.query(sql, new FromToMapper());
		
		// Not consider existing appointments, this is just plain computation for a proper from_to
		int appointment_hour = 0;
		int appointment_shift = 0;
		int hour = LocalDateTime.now().getHour();
		int minute = LocalDateTime.now().getMinute();
//		int hour = 8;
//		int minute = 35;
		if(hour < 7 || hour > 17) {		// if making appointment at non-working time, then set appointment time as the first shift in a day
			appointment_hour = 7;
			appointment_shift = 1;
		} else {
			if(minute > 40) {
				appointment_hour = hour + 1;
				appointment_shift = 1;
			} else {
				if(minute < 20) {
					appointment_hour = hour;
					appointment_shift = 2;
				} else {
					appointment_hour = hour;
					appointment_shift = 3;
				}
			}
		}
		
		
		// Handle existing appointments
		int[][] shifts = new int[11][3]; // 11 working hours a day (index i --> i + 7 o'clock), 3 shifts per hour (a one-hot vector)
		
		if(from_to != null) {
			for(String f_t: from_to) {
				if(!f_t.equals("none")) {
					System.out.println("f_t LOOP is: " + f_t);
					String[] splitstring = f_t.split("_");	// 16_1
					if(Integer.parseInt(splitstring[1]) == 1) {	// if the shift is 1, then the first element of array is 1
						System.out.println("This hour is at shift 1");
						shifts[Integer.parseInt(splitstring[0]) - 7][0] = 1;
						System.out.println("The shifts of this hour is: [" 
								+ shifts[Integer.parseInt(splitstring[0]) - 7][0]
								+ ", " + shifts[Integer.parseInt(splitstring[0]) - 7][1]
								+ ", " + shifts[Integer.parseInt(splitstring[0]) - 7][2] + "]\n");
					}
					
					if(Integer.parseInt(splitstring[1]) == 2) {		// if the shift is 2, then the second element of array is 1
						System.out.println("This hour is at shift 2\n");
						shifts[Integer.parseInt(splitstring[0]) - 7][1] = 1;
						System.out.println("The shifts of this hour is: [" 
								+ shifts[Integer.parseInt(splitstring[0]) - 7][0]
								+ ", " + shifts[Integer.parseInt(splitstring[0]) - 7][1]
								+ ", " + shifts[Integer.parseInt(splitstring[0]) - 7][2] + "]\n");
					}
					
					if(Integer.parseInt(splitstring[1]) == 3) {		// if the shift is 3, then the third element of array is 1
						System.out.println("This hour is at shift 3\n");
						shifts[Integer.parseInt(splitstring[0]) - 7][2] = 1;
						System.out.println("The shifts of this hour is: [" 
								+ shifts[Integer.parseInt(splitstring[0]) - 7][0]
								+ ", " + shifts[Integer.parseInt(splitstring[0]) - 7][1]
								+ ", " + shifts[Integer.parseInt(splitstring[0]) - 7][2] + "]\n");
					}
				}
			}
			
			// Find for empty slots after appointment_hour to choose shift
			int count_hour = 0;
			int count_shift = 1;
			int shift_index = 0;
			int hour_index = 0;
			boolean flag = false;
			for(int[] shift: shifts) {
				System.out.println("The hour: " + (hour_index + 7)+ " vs. appointment_hour: " + appointment_hour);
				System.out.println("The hour's shifts are: [" + shift[0] + ", " + shift[1] + ", " + shift[2] + "]");
				if(count_hour + 7 < appointment_hour) {
					hour_index++;
					count_hour++;
					continue;
				}
				else {
					shift_index = 0;
					for(int s : shift) {
						if(count_shift < appointment_shift) {
							shift_index++;
							count_shift++;
							continue;
						}
						else {
							if(s == 1) {
								shift_index++;
								continue;
							}
							if(s == 0) {
								appointment_shift = shift_index + 1;
								appointment_hour = hour_index + 7;
								flag = true;
								break;
							}
						}
					}
				}
				if(flag)
					break;
				hour_index++;
				count_shift = 1;
				appointment_shift = 1;
				shift_index = 0;
			}
		}

		String f_t = appointment_hour + "_" + appointment_shift;
		System.out.println("f_t is: " + f_t);
		
		String sql_update = "UPDATE appointment \n"
				+ "SET from_to = '" + f_t+ "' \n"
				+ "WHERE doctor_username = '" + doctor + "' AND patient_username = '" + patient.getUsername() + "';";
		jdbcTemplate.update(sql_update);
		Appointment appointment = new Appointment();
		appointment.setDoctor(doctor);
		appointment.setPatient(patient.getUsername());
		appointment.setFrom_to(f_t); // this needs handling
		
		
		
		
		appointment.setIllness_description(patient.getDescription().toString()); // can retrieve by modifying String sql above to select from_to and illness_descr
		
		
		
		return appointment;
	}

	@Override
	public List<Appointment> getAllAppointment(Doctor doctor) {
		String sql = "SELECT * FROM appointment \n"
				+ "WHERE doctor_username = '" + doctor.getUsername() + "';";
		List<Appointment> appointments = jdbcTemplate.query(sql, new AppointmentMapper());
		
		return appointments;
	}
	
	@Override
	public List<Appointment> getAllAppointmentForPatient(Patient patient) {
		String sql = "SELECT * FROM appointment \n"
				+ "WHERE patient_username = '" + patient.getUsername() + "';";
		List<Appointment> appointments = jdbcTemplate.query(sql, new AppointmentMapper());
		
		return appointments;
	}
	
	@Override
	public List<Prescription> getAllPrescription(Doctor doctor) {
		String sql = "SELECT * FROM prescription \n"
				+ "WHERE doctor_username = '" + doctor.getUsername() + "';";
		List<Prescription> prescriptions = jdbcTemplate.query(sql, new PrescriptionMapper());
		
		return prescriptions;
	}
	
	
	
}

class FromToMapper implements RowMapper<String> {
	public String mapRow(ResultSet rs, int arg1) throws SQLException {
		String from_to = rs.getString("from_to");

		return from_to;
	}
}


class AppointmentMapper implements RowMapper<Appointment> {
	public Appointment mapRow(ResultSet rs, int arg1) throws SQLException {
		Appointment appointment = new Appointment();

		appointment.setDoctor(rs.getString("doctor_username"));
		appointment.setPatient(rs.getString("patient_username"));
		appointment.setFrom_to(rs.getString("from_to"));
		appointment.setIllness_description(rs.getString("illness_description"));

		return appointment;
	}
}


class PrescriptionMapper implements RowMapper<Prescription> {
	public Prescription mapRow(ResultSet rs, int arg1) throws SQLException {
		Prescription prescription = new Prescription();

		prescription.setDoctor(rs.getString("doctor_username"));
		prescription.setPatient(rs.getString("patient_username"));
		prescription.setFrom_to(rs.getString("from_to"));
		prescription.setDiagnosis(rs.getString("diagnosis"));

		return prescription;
	}
}


