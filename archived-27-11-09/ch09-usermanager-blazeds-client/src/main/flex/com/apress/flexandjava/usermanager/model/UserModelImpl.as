package com.apress.flexandjava.usermanager.model
{
	import flash.events.EventDispatcher;

	import mx.collections.ArrayCollection;

	[Bindable]
	public class UserModelImpl extends EventDispatcher implements UserModel
	{
			public var _usersCollection : ArrayCollection;

			public function set usersCollection(users : ArrayCollection) : void{
                    _usersCollection = users;
            }

            public function get usersCollection() : ArrayCollection{
                    return _usersCollection;
            }

            public var workFlowState : uint = WINDOW_LIST_USERS

            public static const WINDOW_LIST_USERS : uint = 0;

            public static const WINDOW_USER_FORM : uint = 1;

	}
}