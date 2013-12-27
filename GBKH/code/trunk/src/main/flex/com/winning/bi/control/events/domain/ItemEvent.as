package com.winning.bi.control.events.domain
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class ItemEvent extends CairngormEvent
	{
		public static const EVENT_LOAD_ALL_ITEM:String="eventLoadAllItems";
		public static const EVENT_ADD_ITEM:String="eventAddItem";
		public static const EVENT_ADD_ROOT_ITEM:String="eventAddRootItem";
		public static const EVENT_UPDATE_ITEM:String="eventUpdateItem";
		public static const EVENT_DELETE_ITEM:String="eventDeleteItem";
		public static const EVENT_DELETE_ITEM_AC:String="eventDeleteItemAC";
		public static const EVENT_FIND_ITEM_TREE_BY_ROOT_NAME:String="eventFindTreeByRootName";
		public static const EVENT_ADD_PERMISSION:String="eventAddItemPermission";
		public static const EVENT_FIND_ROOT_ITEM:String="eventFindRootItems";
		public static const EVENT_FIND_BY_CONDITION:String="eventFindItemByCondition";
		public static const EVENT_DELETE_ITEMPERMISSIONS:String="eventDeleteItemPermisssions";
		
		public function ItemEvent(type:String, value:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			data = value;
		}
	}
}