package com.winning.bi.model.vo
{
	import mx.collections.ArrayCollection;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="com.winning.bi.vo.StatisticsData")]
	[Bindable]
	public class StatisticsData extends LightEntity
	{
		public function StatisticsData()
		{
		}
		
		public var titles:ArrayCollection;
		public var datas:ArrayCollection;

	}
}