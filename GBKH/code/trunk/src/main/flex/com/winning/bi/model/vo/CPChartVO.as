package com.winning.bi.model.vo
{
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="com.winning.bi.vo.CPChartVO")]
	[Bindable]
	public class CPChartVO extends LightEntity
	{
		public function CPChartVO()
		{
		}
		
		public var date:String;
	    public var ser1:Number;
	    public var ser2:Number;
	    public var ser3:Number;
	    public var ser4:Number;
	    public var ser5:Number;

	}
}