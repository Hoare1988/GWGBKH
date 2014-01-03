package org.just.xch.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="org.just.xch.domain.DataLog")]
	[Bindable]
	public class DataLog extends LightEntity
	{
		public function DataLog()
		{
		}
		
		public var id:int;
	    public var orgCode:String;
	    public var varCode:String;
	    public var dimCode1:String;
	    public var dimCode2:String;
	    public var dbCode:String;
	    public var frequency:String;
	    public var flag:int;
	    public var actNum:int;
	    public var tmpNum:int;
	    public var seconds:int;
	    public var msg:String;
	    public var startDate:Date;
	    public var endDate:Date;
	    public var createDate:Date;

	}
}