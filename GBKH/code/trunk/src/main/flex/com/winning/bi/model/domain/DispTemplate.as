package com.winning.bi.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="com.winning.bi.domain.DispTemplate")]
	[Bindable]
	public class DispTemplate extends LightEntity
	{
		public function DispTemplate()
		{
		}

		public var code:String;
		public var name:String;
		public var type:int;
		public var description:String;
		public var vsIndex:int;
		public var sourceName:String;

	}
}