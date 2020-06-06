package com.springmvc.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.springmvc.model.Login;
import com.springmvc.service.Cryptography;

public class CookieService {
	public static void addCookie(HttpServletResponse response, Login login) {
		response.addCookie(new Cookie("username", login.getUsername()));	
		response.addCookie(new Cookie("password", Cryptography.encrypt(login.getPassword())));	
	}

	public static void removeCookie(HttpServletResponse response, String cmd) {
		if (cmd.equals("login")) {
			response.addCookie(new Cookie("username", null));	
			response.addCookie(new Cookie("password", null));
		}
	}

	public static Login getCookie(HttpServletRequest request, String cmd) {
		if (cmd.equals("login")) {
			Login login = new Login();
			
			boolean isFound = false;
			Cookie [] cookies = request.getCookies();
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getValue() == null || cookies[i].getValue().length() == 0) continue;
				if (cookies[i].getName().equals("username")) {
					login.setUsername(cookies[i].getValue());
					isFound = true;
				} else if (cookies[i].getName().equals("password")) {
					login.setPassword(Cryptography.decrypt(cookies[i].getValue()));
				}
			}
			
			if (!isFound) return null;
			else {
				System.out.println(login.getUsername());
				System.out.println(login.getPassword());
			}
			return login;
		}
		return null;
	}
}
