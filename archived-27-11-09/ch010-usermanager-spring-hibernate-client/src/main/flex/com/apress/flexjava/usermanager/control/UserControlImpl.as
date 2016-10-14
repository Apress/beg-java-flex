package com.apress.flexjava.usermanager.control
{
	import com.apress.flexjava.usermanager.events.LoginEvent;
	import com.apress.flexjava.usermanager.model.User;
	import com.apress.flexjava.usermanager.model.UserModel;
	import com.apress.flexjava.usermanager.model.UserModelImpl;

	import flash.display.DisplayObject;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.rpc.AsyncResponder;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class UserControlImpl implements UserControl
	{
		private var model : UserModel;

		private var service   : RemoteObject;

		public static const USER_SERVICE : String = "userService";

		private const BAD_CREDENTIALS : String = "Bad credentials";

		public function UserControlImpl(userModel : UserModel, view : DisplayObject){
			model = userModel;
			service = getUserService();
			view.addEventListener(LoginEvent.LOGIN_EVENT, sendLoginRequest);
			service.doLogout();
		}

		public function addUser(user:User) : void{
			service.addEventListener("result", addUserResult);
			service.addUser(user);
		}

		public function updateUser(user:User) : void{
			service.addEventListener("result", updateUserResult);
			service.updateUser(user);
		}

		public function getUsers() : void{
			service.addEventListener("result", getUsersResult);
			service.getUsers();
		}

		public function getUserByUsername(username:String) : void{
			service.addEventListener("result", getUserByUsernameResult);
			service.getUserByUsername(username);
		}

		private function sendLoginRequest(event:LoginEvent) : void{
			var token : AsyncToken = service.channelSet.login(event.user.username, event.user.password);
			token.addResponder(new AsyncResponder(getLoginResult, handleFault));
			model.currentUsername = event.user.username;
		}

		private function getUserService() : RemoteObject {
			var service : RemoteObject = new RemoteObject(USER_SERVICE);
			var cs:ChannelSet = new ChannelSet();
        	var customChannel:Channel = new AMFChannel("my-amf", "/usermanager/messagebroker/amf");
        	cs.addChannel(customChannel);
        	service.channelSet = cs;
			service.addEventListener("fault", handleFault);
			return service;
		}


		private function addUserResult(event:ResultEvent):void{
			model.usersCollection = event.result as ArrayCollection;
		}

		private function getUsersResult(event:ResultEvent):void{
			model.usersCollection = event.result as ArrayCollection;
		}

		private function getUserByUsernameResult(event:ResultEvent):void{
			model.authenticatedUser = event.result as User;
		}

		private function updateUserResult(event:ResultEvent):void{
			model.authenticatedUser = event.result as User;
			Alert.show("User updated");
		}

		private function getLoginResult(event:ResultEvent, token:Object = null):void{
			model.roles = new ArrayCollection(event.result.authorities);
			if (event.result.authorities.indexOf(UserModelImpl.ROLE_ADMIN) >= 0) {
				model.workFlowState = UserModelImpl.WINDOW_LIST_USERS;
				model.isAdmin = true;
				getUsers();
			} else if (event.result.authorities.indexOf(UserModelImpl.ROLE_USERS) >= 0) {
				model.isUser = true;
				model.workFlowState = UserModelImpl.WINDOW_USER_FORM;
				getUserByUsername(model.currentUsername);
  			} else {
				Alert.show(BAD_CREDENTIALS);
  			}
		}

		private function handleFault(event:FaultEvent, token:Object = null):void{
			Alert.show(event.fault.message);
		}


	}
}