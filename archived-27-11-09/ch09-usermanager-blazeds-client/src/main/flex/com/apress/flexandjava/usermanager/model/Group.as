package com.apress.flexandjava.usermanager.model
{
	import mx.collections.ArrayCollection;

	public class Group
	{
		public function Group(){
		}

		public var uid 		    : String ;

		public var commonName   : String;

		public var description  : String;

		public var users		: ArrayCollection;

	}
}