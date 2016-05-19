package  {
	
	public class VOItem {


		private var _cname:String = "";
		private var _dtime:String = "";
		private var _cost:String = "";
		private var _store:String = "";
		private var _freedelivery:String = "";
		private var _link:String = "";
		private var _capital:String = "";
		private var _woeid:String = "";
		private var _flag:String = "";
		private var _timeZone:String = "0";
		private var _id:int;
		public var label:String = "";

		public function VOItem() {
			// constructor code
		}

		public function set id(value:int):void{
			_id = value;
		}
		public function get id():int{
			return _id;
		}
		
		public function set timeZone(value:String):void{
			_timeZone = value;
		}
		public function get timeZone():String{
			return _timeZone;
		}
		
		public function set woeid(value:String):void{
			_woeid = value;
		}
		public function get woeid():String{
			return _woeid;
		}
		
		public function set flag(value:String):void{
			_flag = value;
		}
		public function get flag():String{
			return _flag;
		}
		
		public function set capital(value:String):void{
			_capital = value;
		}
		public function get capital():String{
			return _capital;
		}

		public function set cname(value:String):void{
			_cname = value;
			label = value;
		}
		public function get cname():String{
			return _cname;
		}
		
		public function set dtime(value:String):void{
			_dtime = value;
		}
		public function get dtime():String{
			return _dtime;
		}
		
		public function set cost(value:String):void{
			_cost = value;
		}
		public function get cost():String{
			return _cost;
		}
		
		public function set store(value:String):void{
			_store = value;
		}
		public function get store():String{
			return _store;
		}
		
		public function set freedelivery(value:String):void{
			_freedelivery = value;
		}
		public function get freedelivery():String{
			return _freedelivery;
		}
		
		public function set link(value:String):void{
			_link = value;
		}
		public function get link():String{
			return _link;
		}
	}
	
}
