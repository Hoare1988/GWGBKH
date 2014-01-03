package org.just.xch.model.vo
{
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="org.just.xch.vo.CPDataVO")]
	[Bindable]
	public class CPDataVO extends LightEntity
	{
		public function CPDataVO()
		{
		}
		
		public var code:String;
	    public var name:String;
	    public var exCode:String;
	    public var exName:String;
	    public var displayName:String;
	    public var dimCode:String;
	    public var value:Number;
	    public var fzValue:Number;
	    public var fmValue:Number;

	}
}