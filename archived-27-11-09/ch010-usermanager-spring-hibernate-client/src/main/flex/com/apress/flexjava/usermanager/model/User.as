package com.apress.flexjava.usermanager.model
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="com.apress.usermanager.model.User")]
	public class User
	{
		public function User(){
		}

		public var userId 		: String ;

		public var username     : String;

		public var commonName   : String;

		public var lastName     : String;

		public var email        : String;

		public var password     : String;

		public var enabled      : int;



	}
}