package com.apress.usermanager.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import nu.xom.Builder;
import nu.xom.Document;
import nu.xom.ParsingException;
import nu.xom.ValidityException;

abstract class ServletBase extends HttpServlet {

	protected File xmlFile;

	protected Document getXml() throws ValidityException, ParsingException, IOException{
		Builder builder = new Builder();
		xmlFile = new File(getServletContext().getRealPath("WEB-INF/users.xml"));
		return builder.build(xmlFile);
	}

}
