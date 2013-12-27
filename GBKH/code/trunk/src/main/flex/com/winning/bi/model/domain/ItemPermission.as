package com.winning.bi.model.domain
{
	[RemoteClass(alias="com.winning.bi.domain.sys.ItemPermission")]
	[Bindable]
	public class ItemPermission extends BaseDomain
	{
		
		public static const EDIT_TYPE_ADD:int=1;
		public static const EDIT_TYPE_UPDATE:int=2;
		public static const EDIT_TYPE_DELETE:int=3;
		
		public function ItemPermission()
		{
		}
		
		public var item:Item ;
		public var sysOrg:SysOrg;
		
		public var editType:int;
	}
	
}