package com.springmvc.model;

import java.util.ArrayList;
import java.util.List;

/**
 * POJO class for handling lists of objects
 */
public class ObjectListContainer <T> {
    private List <T> objects;

	public ObjectListContainer() {
		objects = new ArrayList<T>();
	}

	/* Object list tasks */
    public List <T> getObjects() {
        return objects;
    }
    public void setObjects(List <T> objects) {
        this.objects = objects;
    }
}
