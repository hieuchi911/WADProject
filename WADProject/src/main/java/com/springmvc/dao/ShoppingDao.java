package com.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.springmvc.model.CartObject;
import com.springmvc.model.MedicalTool;
import com.springmvc.model.Medicine;
import com.springmvc.model.ShopObject;

/**
 * This class provides an implementation of the Data Access Object
 * It gets shopping object data from the database
 */
public class ShoppingDao {
	// The followings are necessary to establish database connection
	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List <ShopObject> getAllShopObjects() {
		String sql = "SELECT * FROM shopobject;";
		List<ShopObject> objects = jdbcTemplate.query(sql, new ShopObjectMapper());
		
		return objects;
	}
	
	public List <ShopObject> searchQuery(String key) {
		String sql = "SELECT * FROM shopobject WHERE "
                				+ "name LIKE \'%" + key + "%\' OR "
                				+ "category LIKE \'%" + key + "%\' OR "
                				+ "manufacturer LIKE \'%" + key + "%\';";
		List<ShopObject> objects = jdbcTemplate.query(sql, new ShopObjectMapper());
		
		return objects;
	}
	
	public List <ShopObject> getShopObjectByCategory(String category) {
		String sql = "SELECT * FROM shopobject WHERE category='" + category + "';";
		List<ShopObject> objects = jdbcTemplate.query(sql, new ShopObjectMapper());
		
		return objects;	
	}
	
	public ShopObject getShopObject(String object_id) {
		String sql = "SELECT * FROM shopobject WHERE object_id = '" + object_id + "';";
		
		List<ShopObject> objects = jdbcTemplate.query(sql, new ShopObjectMapper());
		
		if (objects.size() == 0) return null;
		ShopObject object = objects.get(0);
		
		if (object.getCategory().equals("medicine")) {
			object = getMedicine(object_id);
		} else if (object.getCategory().equals("tool")) {
			object = getTool(object_id);
		}
		
		return object;
	}

	private Medicine getMedicine(String object_id) {
		String sql = "SELECT * FROM medicine "
					+ "INNER JOIN shopobject ON medicine.medicine_id = shopobject.object_id "
					+ "WHERE object_id = '" + object_id + "';";
		List<Medicine> objects = jdbcTemplate.query(sql, new MedicineObjectMapper());
		if (objects.size() == 0) return null;
		
		return objects.get(0);
	}

	private ShopObject getTool(String object_id) {
		String sql = "SELECT * FROM medicaltool "
				+ "INNER JOIN shopobject ON medicaltool.tool_id = shopobject.object_id "
				+ "WHERE object_id = '" + object_id + "';";
		List<MedicalTool> objects = jdbcTemplate.query(sql, new ToolObjectMapper());
		if (objects.size() == 0) return null;
		
		return objects.get(0);
	}
	
	public List<CartObject> populate(List<CartObject> objects) {
		List <CartObject> result = new ArrayList<CartObject>();
		
		for (int i = 0; i < objects.size(); i++) {
			ShopObject tmp_object = getShopObject(objects.get(i).getObjectid());
			CartObject object = objects.get(i);
			object.setName(tmp_object.getName());
			object.setManufacturer(tmp_object.getManufacturer());
			object.setUrl(tmp_object.getUrl());
			object.setPrice(tmp_object.getPrice());
			object.setAmount(objects.get(i).getAmount());
			result.add(object);
		}
		return result;
	}

}

class ShopObjectMapper implements RowMapper<ShopObject> {
	public ShopObject mapRow(ResultSet rs, int arg1) throws SQLException {
		ShopObject shopobject = new ShopObject();
		
		shopobject.setId(rs.getString("object_id"));
		shopobject.setName(rs.getString("name"));
		shopobject.setCategory(rs.getString("category"));
		shopobject.setUrl(rs.getString("photo_url"));
		shopobject.setManufacturer(rs.getString("manufacturer"));
		shopobject.setDescription(rs.getString("description"));
		shopobject.setPrice(Double.parseDouble(rs.getString("price")));

		return shopobject;
	}
}

class MedicineObjectMapper implements RowMapper<Medicine> {
	public Medicine mapRow(ResultSet rs, int arg1) throws SQLException {
		Medicine shopobject = new Medicine();
		
		shopobject.setId(rs.getString("object_id"));
		shopobject.setName(rs.getString("name"));
		shopobject.setCategory(rs.getString("category"));
		shopobject.setUrl(rs.getString("photo_url"));
		shopobject.setManufacturer(rs.getString("manufacturer"));
		shopobject.setDescription(rs.getString("description"));
		shopobject.setPrice(Double.parseDouble(rs.getString("price")));
		shopobject.setUsage(rs.getString("description"));
		shopobject.setIngredients(rs.getString("ingredients"));
		shopobject.setSideeffects(rs.getString("side_effects"));

		return shopobject;
	}
}

class ToolObjectMapper implements RowMapper<MedicalTool> {
	public MedicalTool mapRow(ResultSet rs, int arg1) throws SQLException {
		MedicalTool shopobject = new MedicalTool();
		
		shopobject.setId(rs.getString("object_id"));
		shopobject.setName(rs.getString("name"));
		shopobject.setCategory(rs.getString("category"));
		shopobject.setUrl(rs.getString("photo_url"));
		shopobject.setManufacturer(rs.getString("manufacturer"));
		shopobject.setDescription(rs.getString("description"));
		shopobject.setPrice(Double.parseDouble(rs.getString("price")));
		shopobject.setUsage(rs.getString("usage"));

		return shopobject;
	}
}