package com.apress.flexandjava.usermanager.model
{
	[RemoteClass(alias="com.apress.usermanager.model.User")]
	public class User
	{
		public function User(){
		}

		public var uid 		    : String ;

		public var username     : String;

		public var commonName   : String;

		public var lastName     : String;

		public var email        : String;

		public var password     : String;


	}
}