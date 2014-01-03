package org.just.xch.model.domain
{
	import mx.collections.ArrayCollection;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="org.just.xch.domain.IndNode")]
	[Bindable]
	public class IndNode extends LightEntity
	{
		public function IndNode()
		{
		}
		
		public var code:String;
	    public var name:String;
	    public var py:String;
	    public var ordinal:int;
	    public var level:int;
	    public var enable:int;
	    public var parent:IndNode;
	    public var updateDate:Date;
	    public var children:ArrayCollection;
	    public var indicators:ArrayCollection;

	}
}