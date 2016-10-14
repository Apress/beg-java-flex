package com.apress.flexjava.usermanager.control
{
	import com.apress.flexjava.usermanager.model.User;
	import com.apress.flexjava.usermanager.model.UserModel;

	import flash.xml.XMLDocument;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	import mx.rpc.xml.SimpleXMLDecoder;

	public class UserControlImpl implements UserControl
	{

		private var model : UserModel;

		private var service   : HTTPService;

		public static const USERS_LIST_SERVICE_URL : String = "http://localhost:8080/usermanager/getusers";

		public static const ADD_USER_SERVICE_URL : String = "http://localhost:8080/usermanager/adduser";

		public function UserControlImpl(userModel : UserModel){
			model = userModel;
		}

		public function addUser(user:User) : void{
			var token : AsyncToken = getAddUserService(user).send( );
		}

		public function getUsers() : void{
			var token : AsyncToken = getListUsersService().send( );
		}

		private function getListUsersService() : HTTPService {
			var service : HTTPService = new HTTPService();
			service.url = USERS_LIST_SERVICE_URL
			service.method = "GET";
			service.useProxy = false;
			service.resultFormat = "e4x";
			service.addEventListener("fault", handleFault);
			service.addEventListener("result", handleResult);
			return service;
		}

		private function getAddUserService(user:User) : HTTPService {
			var service : HTTPService = new HTTPService();
			service.url = ADD_USER_SERVICE_URL + "?" + buildUrlByUser(user);
			service.method = "GET";
			service.useProxy = false;
			service.resultFormat = "e4x";
			service.addEventListener("fault", handleFault);
			service.addEventListener("result", handleResult);
			return service;
		}

		private function buildUrlByUser(user:User):String{
			var url : String = "cn=" + user.commonName +
								"&ln=" + user.lastName +
								"&em=" + user.email +
								"&us=" + user.username +
								"&ps=" + user.password;
			return url;

		}

		private function handleResult(event:ResultEvent):void{
			model.usersCollection = xmlToArrayCollection(event.result as XML);
		}

		private function handleFault(event:FaultEvent):void{
			Alert.show(event.fault.message);
		}

		 private function xmlToArrayCollection(xml:XML):ArrayCollection{
           var xmlDocument:XMLDocument = new XMLDocument(xml.toString());
           var xmlDecoder:SimpleXMLDecoder = new SimpleXMLDecoder(true);
           var resultObj:Object = xmlDecoder.decodeXML(xmlDocument);
           var tmp : Object = resultObj.users.user;
           return resultObj.users.user as ArrayCollection;
		}



	}
}