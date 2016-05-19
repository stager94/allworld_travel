package  {
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class SearchBox extends MovieClip{
		//--------------------------------------------------------------------------------------------------------- 
  		// 
 		//  PUBLIC & INTERNAL VARIABLES 
		// 
		//---------------------------------------------------------------------------------------------------------
  
  		public var txtSearch:TextField;
		public var mcContainer:MovieClip;
  
		//--------------------------------------------------------------------------------------------------------- 
		//
		// PRIVATE & PROTECTED VARIABLES
		//
		//---------------------------------------------------------------------------------------------------------
  
  		private var _vectorItems:Vector.<VOItem>;
		//--------------------------------------------------------------------------------------------------------- 
		//
		//  CONSTRUCTOR 
		// 
		//---------------------------------------------------------------------------------------------------------
		
		public function SearchBox() {
			addEventListener(Event.ADDED_TO_STAGE, _handlerAddedToStage, false, 0, true);
		}

		//--------------------------------------------------------------------------------------------------------- 
		// 
		//  PUBLIC & INTERNAL METHODS 
		// 
		//---------------------------------------------------------------------------------------------------------

		public function clearSearchBox():void{
			mcContainer.removeChildren();
		}
		
		//--------------------------------------------------------------------------------------------------------- 
		// 
		//  GETTERS & SETTERS   
		// 
		//---------------------------------------------------------------------------------------------------------
  
  		public function set vectorItems(value:Vector.<VOItem>):void{
			_vectorItems = value;
		}
  
		//--------------------------------------------------------------------------------------------------------- 
		//
		// PRIVATE & PROTECTED METHODS 
		//
		//---------------------------------------------------------------------------------------------------------
		  
		private function _init():void{
			txtSearch.text = "";
			txtSearch.addEventListener(Event.CHANGE, _handlerChangeSearch, false, 0, true);
		}
  
		//--------------------------------------------------------------------------------------------------------- 
		// 
		//  EVENT HANDLERS  
		// 
		//---------------------------------------------------------------------------------------------------------
		
		private function _handlerAddedToStage(event:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE, _handlerAddedToStage);
			_init();
		}
  
  
		private function _handlerChangeSearch(event:Event):void{
			mcContainer.removeChildren();
			if(txtSearch.text.length > 0){
				var pFilTemp:Vector.<VOItem> = _vectorItems.filter(_searchFilter);					
				var pLength:int = pFilTemp.length;
				for(var i:int=0; i< pLength; i++){
					var pItem:SearchItem = new SearchItem();
					pItem.addEventListener(MouseEvent.CLICK, _handlerClick, false, 0, true);
					pItem.data = pFilTemp[i];
					pItem.finedText = pFilTemp[i].cname;
					mcContainer.addChild(pItem);
					pItem.y = i*pItem.height;
				}
			}
		}
		
		private function _handlerClick(event:MouseEvent):void{
			dispatchEvent(new BannerEvent(BannerEvent.SELECT_CITY, false, false, SearchItem(event.currentTarget).data));
		}
		
		//--------------------------------------------------------------------------------------------------------- 
		// 
		//  HELPERS  
		// 
		//--------------------------------------------------------------------------------------------------------- 
	
  		private function _searchFilter(item:VOItem, index:int, vector:Vector.<VOItem>):Boolean {
			var pIsIsset:Boolean = false;
			var pLabel:String = item.cname.toLowerCase();
			var pSearch:String = txtSearch.text.toLowerCase();
			if(pLabel.indexOf(pSearch) >= 0){
				pIsIsset = true;
			}
			
			return pIsIsset;
		}
  
		//--------------------------------------------------------------------------------------------------------- 
		// 
		//  END CLASS  
		// 
		//---------------------------------------------------------------------------------------------------------
		

		

	}
	
}
