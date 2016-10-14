package com.apress.flexandjava.usermanager.model
{
	import flash.events.IEventDispatcher;

	import mx.collections.ArrayCollection;

	[Bindable]
	public interface UserModel extends IEventDispatcher
	{
		function set usersCollection(users : ArrayCollection) : void;

        function get usersCollection() : ArrayCollection;

	}
}