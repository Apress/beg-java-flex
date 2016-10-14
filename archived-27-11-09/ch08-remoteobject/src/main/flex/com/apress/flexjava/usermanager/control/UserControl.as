package com.apress.flexjava.usermanager.control
{
	import com.apress.flexjava.usermanager.model.User;

	public interface UserControl
	{
		function addUser(user:User) : void;

		function getUsers() : void;
	}
}