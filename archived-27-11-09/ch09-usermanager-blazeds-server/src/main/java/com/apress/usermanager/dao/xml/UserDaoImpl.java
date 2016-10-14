package com.apress.usermanager.dao.xml;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import nu.xom.Attribute;
import nu.xom.Builder;
import nu.xom.Document;
import nu.xom.Element;
import nu.xom.Elements;
import nu.xom.ParsingException;
import nu.xom.Serializer;
import nu.xom.ValidityException;
import com.apress.usermanager.dao.UserDao;
import com.apress.usermanager.model.User;


public class UserDaoImpl implements UserDao {

	protected File xmlFile;

	private String xmlFilePath;

	public UserDaoImpl(String filePath){
		xmlFilePath = filePath;
	}

	public List<User> getUsers(){
		return buildUserListFromXml();
	}

	public List<User> addUser(User user) throws IOException{
		try {
			Document doc = loadXml();
			Element root = doc.getRootElement();
			Element element 		=  xmlUserFactory(user);
			root.appendChild(element);
			saveOrUpdate(doc);
		} catch (ValidityException e) {
			e.printStackTrace();
		} catch (ParsingException e) {
			e.printStackTrace();
		}

		return getUsers();
	}

	public void removeUserByEmail(String email){
		List<User> users = getUsers();
		for(int i=0; i<users.size(); i++){
			if(users.get(i).getEmail().equals(email)){
				users.remove(i);
			}
		}
	 buildXmlByList(users);
	}

	private void buildXmlByList(List<User> users){
		Element root = new Element("users");
		Document doc = new Document(root);
		for(User user : users){
			Element element 		= xmlUserFactory(user);
			root.appendChild(element);
		}
		try {
			saveOrUpdate(doc);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private List<User> buildUserListFromXml(){
		List<User> users = new java.util.ArrayList<User>();
		try {
			Document doc = loadXml();
			Elements elements = doc.getRootElement().getChildElements();

			for(int i = 0; i<elements.size(); i++){
				Element element = elements.get(i);
				User user = new User();
				for(int j=0; j<element.getAttributeCount(); j++){
					Attribute attribute = element.getAttribute(j);
					String attributeName = attribute.getLocalName();
					if(attributeName == "commonname"){
						user.setCommonName(attribute.getValue());
					} else if(attributeName == "lastname"){
						user.setLastName(attribute.getValue());
					} else if(attributeName == "email"){
						user.setEmail(attribute.getValue());
					} else if(attributeName == "username"){
						user.setUsername(attribute.getValue());
					} else if(attributeName == "password"){
						user.setPassword(attribute.getValue());
					}
				}
				users.add(user);
			}
		} catch (ValidityException e) {
			e.printStackTrace();
		} catch (ParsingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return users;
	}

	private Element xmlUserFactory(User user){
		Element element 		= new Element("user");
		Attribute commonName 	= new Attribute("commonname", user.getCommonName());
		Attribute lastName 		= new Attribute("lastname", user.getLastName());
		Attribute email 		= new Attribute("email", user.getEmail());
		Attribute username 		= new Attribute("username", user.getUsername());
		Attribute password 		= new Attribute("password", user.getPassword());
		element.addAttribute(commonName);
		element.addAttribute(lastName);
		element.addAttribute(email);
		element.addAttribute(username);
		element.addAttribute(password);
		return element;
	}

	private void saveOrUpdate (Document doc) throws IOException {
	     FileOutputStream fos = new FileOutputStream(xmlFile);
	     Serializer output = new Serializer(fos, "ISO-8859-1");
	     output.setIndent(2);
	     output.write(doc);
	}

	private Document loadXml() throws ValidityException, ParsingException, IOException{
		Builder builder = new Builder();
		xmlFile = new File("src/main/webapp/WEB-INF/"+xmlFilePath);
		return builder.build(xmlFile);
	}

}
