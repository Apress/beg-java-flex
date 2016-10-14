package com.apress.usermanager.dao.hibernate;

import java.io.Serializable;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.LockMode;
import org.hibernate.criterion.Example;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.apress.usermanager.dao.GenericDao;

public abstract class BaseHibernateDao<T, ID extends Serializable> extends HibernateDaoSupport implements GenericDao<T, ID> {


	private Class<T> persistentClass;

	private static final Logger LOGGER = Logger.getLogger(BaseHibernateDao.class);


    public BaseHibernateDao(Class<T> persistentClass){
    	this.persistentClass = persistentClass;
    }

    public Class<T> getPersistentClass() {
        return persistentClass;
    }

    @SuppressWarnings("unchecked")
	public T findByIdUsingGet ( ID id) {
    	T entity = null;
    	try {
    		entity = (T) getHibernateTemplate().get(getPersistentClass(), id);
    	} catch (DataAccessException e) {
			LOGGER.error(e.getMessage(), e);
		}
		return entity;
	}

    public T findById(ID id){
    	T result = this.findById(id, false);
    	return result;
    }

    @SuppressWarnings("unchecked")
    public T findById(ID id, boolean lock) {
    	LOGGER.info("calling findById :" + id + " from " + getPersistentClass());
        T entity = null;
        try {
			if (lock){
			    entity = (T)getHibernateTemplate().load(getPersistentClass(), id, LockMode.UPGRADE);
			}
			else{
			    entity = (T)getHibernateTemplate().load(getPersistentClass(), id);
			}
		} catch (DataAccessException e) {
			LOGGER.error(e.getMessage(), e);
		}
        return entity;
    }

    public List<T> findAll() {
    	LOGGER.info("findAll");
    	List<T> results = null;
        try {
        	results = findByCriteria();
		} catch (DataAccessException e){
			LOGGER.error(e.getMessage(), e);
		}
        return results;
    }

    public List<T> findByExample(T exampleInstance) {
    	LOGGER.info("findByExample");
    	List<T> results = null;
    	try {
    		results = findByCriteria( Example.create(exampleInstance) );
		} catch (DataAccessException e){
			LOGGER.error(e.getMessage(), e);
		}
        return results;
    }

    @SuppressWarnings("unchecked")
    public List<T> findByExample(T exampleInstance, String... excludeProperty) {
        org.hibernate.Criteria crit = getSession().createCriteria(getPersistentClass());
        org.hibernate.criterion.Example example =
                org.hibernate.criterion.Example.create(exampleInstance);
        for (String exclude : excludeProperty) {
            example.excludeProperty(exclude);
        }
        crit.add(example);
        return crit.list();
    }

    /*@SuppressWarnings("unchecked")
    public List<T> findByExample(T exampleInstance, String[] excludeProperty) {
        Criteria crit = getSession().createCriteria(getPersistentClass());
        Example example =  Example.create(exampleInstance);
        for (String exclude : excludeProperty) {
            example.excludeProperty(exclude);
        }
        crit.add(example);
        return crit.list();
    }*/


    @SuppressWarnings("unchecked")
	public ID save(T entity){
    	LOGGER.info("save " + persistentClass.getName());
    	ID id = null;
		try {
			id = (ID)getHibernateTemplate().save(entity);
		} catch (DataAccessException e) {
			LOGGER.error("DataAccessException " + e.getMessage(), e);
		}
		LOGGER.info("save " + persistentClass.getName() + " id " + id);
		return id;
    }

    @SuppressWarnings("unchecked")
	public ID createNew(T entity){
    	LOGGER.info("createNew");
    	ID id = null;
    		try {
				id = (ID)getHibernateTemplate().save(entity);
			} catch (DataAccessException e) {
				LOGGER.error(e.getMessage(), e);
			}
        return id;
    }

    @SuppressWarnings("unchecked")
	public T makePersistent(T entity) {
    	LOGGER.info("makePersistent");
    	T persistedEntity = null;
    	ID id = null;
    	try {
    		id = (ID)getHibernateTemplate().save(entity);
    		persistedEntity = findById(id);
		} catch (DataAccessException e) {
			LOGGER.error(e.getMessage(), e);
		}
		return persistedEntity;
    }

    public void update(T entity){
    	LOGGER.info("update");
    	try {
			getHibernateTemplate().update(entity);
		} catch (DataAccessException e) {
			LOGGER.error(e.getMessage(), e);
		}
    }

    public T merge(T entity){
    	LOGGER.info("merge");
    	T persistedEntity = null;
    	try {
    		persistedEntity = (T)getHibernateTemplate().merge(entity);
		} catch (DataAccessException e) {
			LOGGER.error(e.getMessage(), e);
		}
		return persistedEntity;
    }



    public void makeTransient(T entity){
    	LOGGER.info("makeTransient");
    	try {
			getHibernateTemplate().delete(entity);
		} catch (DataAccessException e) {
			LOGGER.error(e.getMessage(), e);
		}
    }

    @SuppressWarnings("unchecked")
    protected List<T> findByCriteria(org.hibernate.criterion.Criterion... criterion) {
        org.hibernate.Session session =  getSession();
        org.hibernate.Criteria crit
                = session.createCriteria(getPersistentClass());
        for (org.hibernate.criterion.Criterion c : criterion) {
            crit.add(c);
        }
        return crit.list();
    }

    protected List<?> findByCriteria(Class<?> clazz,org.hibernate.criterion.Criterion... criterion) {
        org.hibernate.Session session =  getSession();
        org.hibernate.Criteria crit
                = session.createCriteria(clazz);
        for (org.hibernate.criterion.Criterion c : criterion) {
            crit.add(c);
        }
        return crit.list();
   }

    @SuppressWarnings("unchecked")
    protected T findUniqueEntityByCriteria(Class<?> clazz,org.hibernate.criterion.Criterion... criterion) {
        org.hibernate.Session session =  getSession();
        org.hibernate.Criteria crit
                = session.createCriteria(clazz);
        for (org.hibernate.criterion.Criterion c : criterion) {
            crit.add(c);
        }
        return (T)crit.uniqueResult();
   }

    @SuppressWarnings("unchecked")
    protected T findUniqueEntityByCriteria(org.hibernate.criterion.Criterion... criterion) {
        org.hibernate.Session session =  getSession();
        org.hibernate.Criteria crit
                = session.createCriteria(getPersistentClass());
        for (org.hibernate.criterion.Criterion c : criterion) {
            crit.add(c);
        }
        return (T)crit.uniqueResult();
   }


    public boolean delete(ID id) {
    	LOGGER.info("delete");
		boolean deleted = true;
		try {
			T entity = findById( id);
			getHibernateTemplate().delete(entity);
		} catch (DataAccessException e) {
			deleted = false;
			LOGGER.error(e.getMessage(), e);
		}
		return deleted;
	}
}