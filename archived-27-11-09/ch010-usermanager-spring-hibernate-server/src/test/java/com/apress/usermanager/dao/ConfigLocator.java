package com.apress.usermanager.dao;

public class ConfigLocator {

	private static final long serialVersionUID = 1L;

     private String[] locations;

     public ConfigLocator() {
             locations = new String[] {
                             "classpath:/applicationContext-resources.xml",
                             "classpath:/applicationContext-dao.xml",
                             "/WEB-INF/applicationContext.xml",
                         	 "/WEB-INF/security.xml"
             };
     }

     public void setLocations(String[] locations) {
             this.locations = locations;
     }

     public String[] getLocations() {
             return locations;
     }
}
