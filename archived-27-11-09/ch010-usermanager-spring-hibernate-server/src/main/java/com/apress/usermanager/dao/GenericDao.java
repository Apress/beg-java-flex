package com.apress.usermanager.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.SessionFactory;


public interface GenericDao<T, ID extends Serializable>{

	public List<T> findAll();

	public T findByIdUsingGet ( ID id );

	public T findById(ID id, boolean lock);

	public T findById(ID id);

	public boolean delete(ID id);

	public List<T> findByExample(T exampleInstance);

	public T makePersistent(T entity);

	public void makeTransient(T entity);

	public void setSessionFactory(SessionFactory sessionFactory);

	public ID save(T entity);

	public ID createNew(T entity);

	public void update(T entity);

	public T merge(T entity);
}