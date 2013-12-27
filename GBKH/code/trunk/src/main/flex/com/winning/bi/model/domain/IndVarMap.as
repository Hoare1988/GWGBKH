package com.winning.bi.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="com.winning.bi.domain.IndVarMap")]
	[Bindable]
	public class IndVarMap extends LightEntity
	{
		public function IndVarMap()
		{
		}
		public var id:int;
		public var indicator:Indicator;
    	public var indVariable:IndVariable;

	}
}