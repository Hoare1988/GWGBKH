package org.just.xch.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="org.just.xch.domain.DataValue")]
	[Bindable]
	public class DataValue extends LightEntity
	{
		public function DataValue()
		{
		}
		
		public var orgCode:String;
	    public var varCode:String;
	    public var dimCode1:String;
	    public var dimCode2:String;
	    public var indValue:Number;
	    public var bizCode:String;
	    public var bizType:Number;
	    public var frequency:String;
	    public var dataDate:String;
	    public var createDate:Date;
	    public var maxDate:Date;
	    public var minDate:Date;

	}
}