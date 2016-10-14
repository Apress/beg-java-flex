package
{
	import flash.events.MouseEvent;

	import mx.controls.Button;

	[Event(name="buttonMoveEvent", type="ButtonMoveEvent")]

	public class ButtonJoker extends Button
	{
		private var moved  : int = 1;

		public var direction : String;

		private const LEFT : String = "left";

		private const RIGHT : String = "right";

		public function ButtonJoker(){
			this.addEventListener(MouseEvent.ROLL_OVER, moveButtonJoker);
		}

		private function moveButtonJoker(event : MouseEvent):void{
			this.x = event.stageX + ((this.width + 10) * moved);
			moved = (moved == 1)?-2:1;
			direction = (moved == 1)?LEFT:RIGHT;
			dispatchEvent(new ButtonMoveEvent(ButtonMoveEvent.BUTTON_MOVE_EVENT,direction));
			//dispatchEvent(new Event("buttonMoveEvent"));
		}
	}
}