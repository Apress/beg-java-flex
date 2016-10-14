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

	}
}