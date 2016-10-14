package com.apress.flexjava.usermanager.model
{
	import flash.events.EventDispatcher;

	import mx.collections.ArrayCollection;

	[Bindable]
	public class UserModelImpl extends EventDispatcher implements UserModel
	{
			private var _usersCollection : ArrayCollection;

			private var _workFlowState : uint = WINDOW_LIST_USERS

			public function set usersCollection(users : ArrayCollection) : void{
                    _usersCollection = users;
            }

            public function get usersCollection() : ArrayCollection{
                    return _usersCollection;
            }

			public function set workFlowState(value : uint) : void{
                    _workFlowState = value;
            }

            public function get workFlowState() : uint{
                    return _workFlowState;
            }

            public static const WINDOW_LIST_USERS : uint = 0;

            public static const WINDOW_USER_FORM : uint = 1;

	}
}