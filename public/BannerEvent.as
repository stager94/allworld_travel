package {

	import flash.events.Event;

	public class BannerEvent extends Event {
		
		public static const SELECT_CITY : String = "SELECT_CITY";
		
		
		public var argument:Object;
		
		public function BannerEvent(type : String, bubbles : Boolean, cancelable : Boolean, args : Object = null) {
			super(type, bubbles, cancelable);
			argument = args;
		}

		override public function clone():Event {
			return new BannerEvent(type, bubbles, cancelable, argument);
		}
	}
}