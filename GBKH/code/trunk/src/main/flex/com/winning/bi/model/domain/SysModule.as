package com.winning.bi.model.domain
{
	import com.winning.bi.assets.ImagesAssets;
	
	import mx.collections.ArrayCollection;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="com.winning.bi.domain.sys.SysModule")]
	[Bindable]
	public class SysModule extends LightEntity
	{
		public function SysModule()
		{
		}
		
		public var id:int;
	    public var name:String;
	    public var code:String;
	    public var path:String;
	    public var ordinal:int;
	    public var isMenu:int;
	    public var isNav:int;
	    public var isLeaf:int;
	    public var stage:int;
	    public var groupName:String;
	    public var type:int;
	    public var enable:int;
	    public var comments:String;
	    public var parent:SysModule;
	    public var children:ArrayCollection;
	    public var isSelected:int;
		
	}
}