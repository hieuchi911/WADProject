package com.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.springmvc.model.Medicine;
import com.springmvc.model.ObjectListContainer;
import com.springmvc.model.PrescribedMedicine;
import com.springmvc.model.Prescription;
import com.springmvc.model.ShopObject;

public class PrescriptionDao {
	// The followings are necessary to establish database connection
	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;

	public PrescribedMedicine getPrescribedMedicine(String id) {
		String sql = "SELECT * FROM medicine INNER JOIN shopobject "
				+ 							"ON medicine.medicine_id = shopobject.object_id "
				+ 	 "WHERE medicine.medicine_id='" + id + "';";
		List<PrescribedMedicine> objects = jdbcTemplate.query(sql, new MedicineMapper());
				
		return objects.get(0);
	}

	public void addPrescription(Prescription pres, int prescription_id, String diagnosis, String from_to) {
		String sql = "INSERT INTO prescription VALUES(?,?,?,?,?);";
		
		jdbcTemplate.update(sql, new Object[] { prescription_id, pres.getDoctor(), pres.getPatient(),
												diagnosis, from_to});
	}

	public void addPrescribedMedicine(PrescribedMedicine prescribedMedicine, int prescription_id) {
		String sql = "INSERT INTO prescribedmedicine VALUES(?,?,?,?);";
		
		
		jdbcTemplate.update(sql, new Object[] { prescription_id, prescribedMedicine.getId(), 
												prescribedMedicine.getAmount(), prescribedMedicine.getDosage()});
	}

	public Prescription getPrescription(String username_1, String username_2) {
		String sql = "SELECT * FROM prescription "
				+ 	 "WHERE doctor_username='" + username_2 + "' "
				+ 	 "AND patient_username='" + username_1 + "' "
				+ 	 "ORDER BY prescription_id DESC;";
		
		List<Prescription> objects = jdbcTemplate.query(sql, new PrescriptionMapper());
		if (objects.size() == 0) {
			sql = "SELECT * FROM prescription "
					+ 	 "WHERE doctor_username='" + username_1 + "' "
					+ 	 "AND patient_username='" + username_2 + "' "
					+ 	 "ORDER BY prescription_id DESC;";
			
			objects = jdbcTemplate.query(sql, new PrescriptionMapper());
			
			if (objects.size() == 0)
				return null;
			return objects.get(0);
		}
		return objects.get(0);
	}

	public List<PrescribedMedicine> getPrescriptionMedicine(String id) {
		String sql = "SELECT * FROM prescribedmedicine INNER JOIN "
				+ 	 						"(medicine INNER JOIN shopobject ON medicine.medicine_id = shopobject.object_id) "
				+ 							"ON prescribedmedicine.medicine_id = medicine.medicine_id "
				+ 	 "WHERE prescribedmedicine.prescription_id='" + id + "';";
		List<PrescribedMedicine> objects = jdbcTemplate.query(sql, new PrescribedMedicineMapper());
		
		return objects;
	}

	public int initializeID() {
		String sql = "SELECT COUNT(*) FROM prescription;";
		
		return jdbcTemplate.queryForObject(sql, Integer.class) + 1;
	}
	
}


class PrescriptionMapper implements RowMapper<Prescription> {
	public Prescription mapRow(ResultSet rs, int arg1) throws SQLException {
		Prescription prescription = new Prescription();

		prescription.setId(rs.getString("prescription_id"));
		prescription.setDoctor(rs.getString("doctor_username"));
		prescription.setPatient(rs.getString("patient_username"));
		prescription.setFrom_to(rs.getString("from_to"));
		prescription.setDiagnosis(rs.getString("diagnosis"));
		
		prescription.setPrescription(new ObjectListContainer<PrescribedMedicine>());
		
		return prescription;
	}
}

class MedicineMapper implements RowMapper<PrescribedMedicine> {
	public PrescribedMedicine mapRow(ResultSet rs, int arg1) throws SQLException {
		PrescribedMedicine med = new PrescribedMedicine();
		
		med.setId(rs.getString("object_id"));
		med.setName(rs.getString("name"));
		med.setCategory(rs.getString("category"));
		med.setUrl(rs.getString("photo_url"));
		med.setManufacturer(rs.getString("manufacturer"));
		med.setDescription(rs.getString("description"));
		med.setPrice(Double.parseDouble(rs.getString("price")));
		med.setIngredients(rs.getString("instruction"));
		med.setIngredients(rs.getString("ingredients"));
		med.setIngredients(rs.getString("side_effects"));
		
		return med;
	}
}

class PrescribedMedicineMapper implements RowMapper<PrescribedMedicine> {
	public PrescribedMedicine mapRow(ResultSet rs, int arg1) throws SQLException {
		PrescribedMedicine med = new PrescribedMedicine();
		
		med.setId(rs.getString("object_id"));
		med.setName(rs.getString("name"));
		med.setCategory(rs.getString("category"));
		med.setUrl(rs.getString("photo_url"));
		med.setManufacturer(rs.getString("manufacturer"));
		med.setDescription(rs.getString("description"));
		med.setPrice(Double.parseDouble(rs.getString("price")));
		med.setIngredients(rs.getString("instruction"));
		med.setIngredients(rs.getString("ingredients"));
		med.setIngredients(rs.getString("side_effects"));
		if (rs.getString("amount") != null && rs.getString("amount").length() > 0)
			med.setAmount(Integer.parseInt(rs.getString("amount")));
		if (rs.getString("dosage") != null && rs.getString("dosage").length() > 0)
			med.setDosage(rs.getString("dosage"));
		return med;
	}
}