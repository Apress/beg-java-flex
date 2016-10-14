package com.apress.flexandjava.usermanager.control
{
	import com.apress.flexandjava.usermanager.model.User;

	public interface UserControl
	{
		function addUser(user:User) : void;

		function getUsers() : void;
	}
}