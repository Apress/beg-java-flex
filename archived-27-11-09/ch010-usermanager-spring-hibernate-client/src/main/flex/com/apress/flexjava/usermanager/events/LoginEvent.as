package com.apress.flexjava.usermanager.events
{
	import com.apress.flexjava.usermanager.model.User;

	import flash.events.Event;

	public class LoginEvent extends Event
	{
		public static const LOGIN_EVENT : String = "loginEvent";

		public var user : User;

		public function LoginEvent(u:User){
			super(LOGIN_EVENT, true);
			user = u;
		}

	}
}