package org.just.xch.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="org.just.xch.domain.IndVarMap")]
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