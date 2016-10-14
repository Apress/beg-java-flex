package com.apress.usermanager.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.test.AbstractDependencyInjectionSpringContextTests;

public abstract class BaseSpringTestCase extends
		AbstractDependencyInjectionSpringContextTests {
	/**
	 * Log variable for all child classes. Uses LogFactory.getLog(getClass())
	 * from Commons Logging
	 */
	protected final Log log = LogFactory.getLog(getClass());

	/**
	 * Sets AutowireMode to AUTOWIRE_BY_NAME and configures all context files
	 * needed to tests DAOs.
	 * 
	 * @return String array of Spring context files.
	 */
	@Override
	protected String[] getConfigLocations() {
		setAutowireMode(AUTOWIRE_BY_TYPE);
		// to have a single place to add configLocations, even if more than one
		// BaseTestCase class is present
		return new ConfigLocator().getLocations();
	}
}
