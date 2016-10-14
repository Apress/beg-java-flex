package com.apress.flexjava.usermanager.control
{
	import com.apress.flexjava.usermanager.model.User;
	import com.apress.flexjava.usermanager.model.UserModel;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class UserControlImpl implements UserControl
	{
		private var model : UserModel;

		private var service   : RemoteObject;

		public static const USER_SERVICE : String = "userService";

		public function UserControlImpl(userModel : UserModel){
			model = userModel;
			service = getUserService();
		}

		public function addUser(user:User) : void{
			service.addUser(user);
		}

		public function getUsers() : void{
			service.getUsers();
		}

		private function getUserService() : RemoteObject {
			var service : RemoteObject = new RemoteObject();
			service.addEventListener("fault", handleFault);
			service.addEventListener("result", handleResult);
			return service;
		}

		private function handleResult(event:ResultEvent):void{
			model.usersCollection = event.result as ArrayCollection;
		}

		private function handleFault(event:FaultEvent):void{
			Alert.show(event.fault.message);
		}

	}
}