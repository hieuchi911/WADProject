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
		String sql = "INSERT INTO user VALUES(?,?,?);";
		jdbcTemplate.update(sql, new Object[] { atts[0], atts[1], atts[2] });
		
		sql = "INSERT INTO doctor VALUES(?,?,?,?,?,?,?);";
		jdbcTemplate.update(sql, new Object[] { atts[0], atts[3], "", atts[4], atts[5], atts[6], atts[7] });
	}

	public void addMedicine(String[] atts) {
		String sql = "SELECT COUNT(*) FROM shopobject;";
		int nxt_id = jdbcTemplate.queryForObject(sql, Integer.class) + 1;
		
		sql = "INSERT INTO shopobject VALUES(?,?,?,?,?,?,?);";
		jdbcTemplate.update(sql, new Object[] { nxt_id, atts[0], "medicine", atts[1], atts[2], atts[3], atts[4] });
		
		sql = "INSERT INTO medicine VALUES(?,?,?,?);";
		jdbcTemplate.update(sql, new Object[] { nxt_id, atts[5], atts[6], atts[7] });
	}

	public void addTool(String[] atts) {
		String sql = "SELECT COUNT(*) FROM shopobject;";
		int nxt_id = jdbcTemplate.queryForObject(sql, Integer.class) + 1;
		
		sql = "INSERT INTO shopobject VALUES(?,?,?,?,?,?,?);";
		jdbcTemplate.update(sql, new Object[] { nxt_id, atts[0], "medicine", atts[1], atts[2], atts[3], atts[4] });
		
		sql = "INSERT INTO medicaltool VALUES(?,?);";
		jdbcTemplate.update(sql, new Object[] { nxt_id, atts[5] });
	}

}
