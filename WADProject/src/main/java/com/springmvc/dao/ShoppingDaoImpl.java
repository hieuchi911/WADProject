package com.springmvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.springmvc.model.ShopObject;

/**
 * This class provides an implementation of the Data Access Object
 * It gets shopping object data from the database
 */
public class ShoppingDaoImpl implements ShoppingDao {
	// The followings are necessary to establish database connection
	@Autowired
	DataSource datasource;
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public List <ShopObject> getAllShopObjects() {
		String sql = "SELECT * FROM shop_objects;";
		List<ShopObject> objects = jdbcTemplate.query(sql, new ShopObjectMapper());
		
		return objects;
	}
}

class ShopObjectMapper implements RowMapper<ShopObject> {
	public ShopObject mapRow(ResultSet rs, int arg1) throws SQLException {
		ShopObject shopobject = new ShopObject();

		shopobject.setUrl(rs.getString("url"));
		shopobject.setName(rs.getString("name"));
		shopobject.setManufacturer(rs.getString("manufacturer"));
		shopobject.setDescription(rs.getString("description"));
		shopobject.setPrice(Double.parseDouble(rs.getString("price")));

		return shopobject;
	}
}