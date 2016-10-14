package com.apress.flexjava.usermanager.model
{
	import flash.events.EventDispatcher;

	import mx.collections.ArrayCollection;

	[Bindable]
	public class UserModelImpl extends EventDispatcher implements UserModel
	{
			private var _usersCollection : ArrayCollection;

			private var _workFlowState : uint = WINDOW_LOGIN_FORM;

			private var _roles : ArrayCollection;

			private var _currentUsername : String;

			private var _authenticatedUser : User;

            private var _isAdmin : Boolean = false;

            public var _isUser : Boolean = false;

			public function set usersCollection(value : ArrayCollection) : void{
                    _usersCollection = value;
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

            public function set roles(value : ArrayCollection) : void{
                    _roles = value;
            }

            public function get roles() : ArrayCollection{
                    return _roles;
            }

            public function set currentUsername(value : String) : void{
                    _currentUsername = value;
            }

            public function get currentUsername() : String{
                    return _currentUsername;
            }

            public function set authenticatedUser(value : User) : void{
                    _authenticatedUser = value;
            }

            public function get authenticatedUser() : User{
                    return _authenticatedUser;
            }

            public function set isAdmin(value : Boolean) : void{
                    _isAdmin = value;
            }

            public function get isAdmin() : Boolean{
                    return _isAdmin;
            }

            public function set isUser(value : Boolean) : void{
                    _isUser = value;
            }

            public function get isUser() : Boolean{
                    return _isUser;
            }

            public static const WINDOW_LIST_USERS : uint = 1;

	        public static const WINDOW_USER_FORM : uint = 2;

	        public static const WINDOW_LOGIN_FORM : uint = 0;

	        public static const ROLE_ADMIN : String = "ROLE_ADMIN";

	        public static const ROLE_USERS : String = "ROLE_USERS";

	        public static const ROLE_GUEST : String = "ROLE_GUEST";

	        public static const ROLE_ANONYMOUS : String = "ROLE_ANONYMOUS";

	}
}