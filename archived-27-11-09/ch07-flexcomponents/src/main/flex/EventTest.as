package
{
	import flash.events.Event;

	public class EventTest extends Event
	{
		public function EventTest(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}