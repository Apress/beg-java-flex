package com.apress.flexjava.usermanager.model
{
	import flash.events.IEventDispatcher;

	import mx.collections.ArrayCollection;

	[Bindable]
	public interface UserModel extends IEventDispatcher
	{
		function set usersCollection(users : ArrayCollection) : void;

        function get usersCollection() : ArrayCollection;

        function set workFlowState(value : uint) : void;

        function get workFlowState() : uint;

        function set roles(value : ArrayCollection) : void;

        function get roles() : ArrayCollection;

        function set currentUsername(value : String) : void;

        function get currentUsername() : String;

        function set authenticatedUser(value : User) : void;

        function get authenticatedUser() : User;

        function set isAdmin(value : Boolean) : void;

        function get isAdmin() : Boolean;

        function set isUser(value : Boolean) : void;

        function get isUser() : Boolean;



	}
}