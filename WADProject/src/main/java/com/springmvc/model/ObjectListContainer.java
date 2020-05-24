package com.springmvc.model;

import java.util.List;

/**
 * POJO class for handling lists of objects
 */
public class ObjectListContainer {
    private List <ShopObject> objects;

	public ObjectListContainer() {}

	/* Object list tasks */
    public List <ShopObject> getObjects() {
        return objects;
    }
    public void setObjects(List <ShopObject> objects) {
        this.objects = objects;
    }
	
}
