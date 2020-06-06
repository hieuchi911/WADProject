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
	
	public List <ShopObject> getShopObjectByCategory(String category) {
		String sql = "SELECT * FROM shopobject WHERE category='" + category + "';";
		List<ShopObject> objects = jdbcTemplate.query(sql, new ShopObjectMapper());
		
		return objects;	
	}
	
	public ShopObject getShopObject(String object_id) {
		String sql = "SELECT * FROM shopobject WHERE object_id = '" + object_id + "';";
		
		List<ShopObject> objects = jdbcTemplate.query(sql, new ShopObjectMapper());
		
		return objects.size() > 0 ? objects.get(0) : null;	
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