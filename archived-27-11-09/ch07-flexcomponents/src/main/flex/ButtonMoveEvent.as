package
{
	import flash.events.Event;

	public class ButtonMoveEvent extends Event
	{

		public var direction : String;

		public static const BUTTON_MOVE_EVENT : String = "buttonMoveEvent";

		public function ButtonMoveEvent(type:String, direction : String){
			super(type);
			this.direction = direction;
		}

		override public function clone():Event{
			return new ButtonMoveEvent(type, direction);
		}

	}
}