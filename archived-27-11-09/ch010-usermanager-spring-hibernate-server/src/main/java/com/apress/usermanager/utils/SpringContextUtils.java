package com.apress.usermanager.utils;

import javax.servlet.ServletContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class SpringContextUtils {
	 /**
	    * Returns a named bean from the current application context.
	    * @param <T> Type of bean
	    * @param context ServletContext
	    * @param name required bean name
	    * @return implmentation of the bean
	    */
	   @SuppressWarnings("unchecked")
	   public final static <T> T getBean(ServletContext context, String name) {
	      return (T) WebApplicationContextUtils.getRequiredWebApplicationContext(context)
	            .getBean(name);
	   }

}
