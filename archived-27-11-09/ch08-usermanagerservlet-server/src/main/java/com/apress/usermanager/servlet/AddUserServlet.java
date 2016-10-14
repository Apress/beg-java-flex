package com.apress.usermanager.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nu.xom.Attribute;
import nu.xom.Document;
import nu.xom.Element;
import nu.xom.ParsingException;
import nu.xom.Serializer;
import nu.xom.ValidityException;

public class AddUserServlet extends ServletBase {



	public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();
		Document doc;
		try {
			doc = getXml();
			Element root = doc.getRootElement();
			Element element = new Element("user");
			Attribute commonName = new Attribute("commonname", req.getParameter("cn"));
			Attribute lastName = new Attribute("lastname", req.getParameter("ln"));
			Attribute email = new Attribute("email", req.getParameter("em"));
			Attribute username = new Attribute("username", req.getParameter("us"));
			Attribute password = new Attribute("password", req.getParameter("ps"));
			element.addAttribute(commonName);
			element.addAttribute(lastName);
			element.addAttribute(email);
			element.addAttribute(username);
			element.addAttribute(password);
			root.appendChild(element);
			saveOrUpdate(doc);
			out.println(doc.toXML());
		} catch (ValidityException e) {
			e.printStackTrace();
		} catch (ParsingException e) {
			e.printStackTrace();
		}

	}


	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doPost(req, resp);
	}

	public void saveOrUpdate (Document doc) throws IOException {
	     FileOutputStream fos = new FileOutputStream(xmlFile);
	     Serializer output = new Serializer(fos, "ISO-8859-1");
	     output.setIndent(2);
	     output.write(doc);
	}


}
