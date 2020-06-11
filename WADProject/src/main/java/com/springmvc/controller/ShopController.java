package com.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.Cart;
import com.springmvc.model.CartObject;
import com.springmvc.model.ObjectListContainer;
import com.springmvc.model.ShopObject;
import com.springmvc.model.User;
import com.springmvc.service.ShoppingService;

/** 
 * The ShopController class handles shopping activities of the user,
 * with urls:
 * | "/shop"				This page shows the shopping catalogues
 * | "/shopitem/{object_id}"	This page shows the shopping object corresponding to `object_id`
 */
@Controller
public class ShopController {
	
	@Autowired
	ShoppingService shopService;
	
	/* ---------------------------- showShop --------------------------------------
	 * This method shows the shopping screen in url "/shop".
	 */
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public ModelAndView showShop(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("shop");
		
		HttpSession sess = request.getSession();
		Cart cart = (Cart) sess.getAttribute("cart");
		
		if (cart == null)
			sess.setAttribute("cart", new Cart());
		else 
			sess.setAttribute("cart", cart);
		
		ObjectListContainer<ShopObject> objects = new ObjectListContainer<ShopObject>();
		objects.setObjects(shopService.getAllShopObjects());
		
		mav.addObject("objects", objects);
		return mav;
	}

	/* ---------------------------- showShopByCategory --------------------------------------
	 * This method shows the shopping screen in url "/shop".
	 */
	@RequestMapping(value = "/{category}-shop", method = RequestMethod.GET)
	public ModelAndView showShopByCategory(@PathVariable String category) {
		ModelAndView mav = new ModelAndView("shop");
		
		ObjectListContainer<ShopObject> objects = new ObjectListContainer<ShopObject>();
		objects.setObjects(shopService.getShopObjectsByCategory(category));
		
		mav.addObject("objects", objects);
		return mav;
	}
	
	/* ---------------------------- showItem --------------------------------------
	 * This method shows the item screen in url "/shopitem/{item}".
	 */
	@RequestMapping(value = "/shopitem/{object_id}", method = RequestMethod.GET)
	public ModelAndView showItem(@PathVariable String object_id) {
		ModelAndView mav = new ModelAndView("shopitem");
		
		ShopObject object = shopService.getShopObject(object_id);
		mav.addObject("object", object);
		mav.addObject("cartobject", new CartObject());
		
		return mav;
	}
	
	
	/* ---------------------------- addItem2Cart --------------------------------------
	 * This method handles the adding of an item to the user cart
	 */
	@RequestMapping(value = "addItem2Cart", method = RequestMethod.POST)
	public String addItem2Cart(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute CartObject cartobject) {
		HttpSession sess = request.getSession();
		Cart cart = (Cart) sess.getAttribute("cart");
		
		ObjectListContainer<CartObject> cart_objects = cart.getItems();
		if (cart_objects == null) {
			cart_objects = new ObjectListContainer<CartObject>();
		}
		
		List<CartObject> objects = cart_objects.getObjects();
		if (objects == null) {
			objects = new ArrayList<CartObject>();
		}
		
		boolean isPresent = false;
		for (int i = 0; i < objects.size(); i++) {
			String id = objects.get(i).getObjectid();
			if (cartobject.getObjectid().equals(id)) {
				objects.get(i).setAmount(objects.get(i).getAmount() + cartobject.getAmount());
				isPresent = true;
				break;
			}
		}
		
		if (!isPresent) objects.add(cartobject);
		cart_objects.setObjects(objects);
		cart.setItems(cart_objects);
		
		sess.setAttribute("cart", cart);
		
		return "redirect:/shop";
	}
	
	/* ---------------------------- removeItemFromCart --------------------------------------
	 * This method shows the shopping screen in url "/shop".
	 */
	@RequestMapping(value = "/remove-item", method = RequestMethod.GET)
	public ModelAndView removeItemFromCart(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("redirect:/shopCheckout");
		
		HttpSession sess = request.getSession();
		Cart cart = (Cart) sess.getAttribute("cart");
		
		String object_id = request.getParameter("remove");
		ObjectListContainer<CartObject> cart_objects = cart.getItems();
		List<CartObject> objects = cart_objects.getObjects();
		
		for (int i = 0; i < objects.size(); i++) {
			String id = objects.get(i).getObjectid();
			if (id.equals(object_id)) {
				objects.remove(i);
				break;
			}
		}
		sess.setAttribute("cart", cart);

		return mav;
	}
	
	/* ---------------------------- checkOut --------------------------------------
	 * This method handles checking out
	 */
	@RequestMapping(value = "/shopCheckout", method = RequestMethod.GET)
	public ModelAndView checkOut(HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute User user) {
		HttpSession sess = request.getSession();
		Cart cart = (Cart) sess.getAttribute("cart");
		
		ObjectListContainer<CartObject> cart_objects = cart.getItems();
		if (cart_objects == null) {
			ModelAndView mav = new ModelAndView("redirect:/shop");
			return mav;
		}
		
		List <CartObject> objects = cart_objects.getObjects();
		objects = shopService.populate(objects);
		
		ModelAndView mav = new ModelAndView("checkout");
		mav.addObject("objects", objects);
		return mav;
	}
	
	/* ---------------------------- confirmTransaction --------------------------------------
	 * This method confirms the transaction and renews the shopping cart.
	 */
	@RequestMapping(value="/confirmTransaction", method=RequestMethod.POST) 
	public String confirmTransaction(HttpServletRequest request, HttpServletResponse response,
			@SessionAttribute User user) {
		HttpSession sess = request.getSession();
		sess.setAttribute("cart", null);
		
		return "redirect:/shop";
	}
	
	/* ---------------------------- searchItem --------------------------------------
	 * This method shows the search items.
	 */
	@RequestMapping(value="/searchitem", method = RequestMethod.GET)
	public ModelAndView searchItem(HttpServletRequest request, HttpServletResponse response) {
		String key = request.getParameter("query");
		ModelAndView mav = new ModelAndView("searchItems");
		
		ObjectListContainer<ShopObject> objects = new ObjectListContainer<ShopObject>();
		objects.setObjects(shopService.search(key));
		
		mav.addObject("objects", objects);
		return mav;
	}
}
