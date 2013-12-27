package com.winning.bi.model.mlct
{
	import com.adobe.cairngorm.model.ModelLocator;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class ItemMgtModelLocator implements ModelLocator
	{
		
		public var itemTreeAC:ArrayCollection=new ArrayCollection();
		public var childItemAC:ArrayCollection=new ArrayCollection();
		
		public var exeItemTreeAC:ArrayCollection=new ArrayCollection();
		public var childExeItemAC:ArrayCollection=new ArrayCollection();
		
		/**所有根节点**/
		public var uMgt_queryRootItemAC:ArrayCollection;
		
		public var exeMgt_queryRootExeItemAC:ArrayCollection;
		
		public var excel_ExeItems:ArrayCollection=new ArrayCollection();
		
		public var itemMgtWithPermit_AddItemAc:ArrayCollection=new ArrayCollection();
		public var itemMgtWithPermit_AbolishItemAc:ArrayCollection=new ArrayCollection();
		
		public function ItemMgtModelLocator()
		{
		}
		
		private static var instance:ItemMgtModelLocator=null;
		
		public static function getInstance():ItemMgtModelLocator
		{
			if(instance==null)
			{
				instance=new ItemMgtModelLocator();
			}
			return instance;
		}
	}
}