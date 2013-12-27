package com.winning.bi.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="com.winning.bi.domain.PrescriptionSummary")]
	[Bindable]
	public class PrescriptionSummary extends LightEntity
	{
		public function PrescriptionSummary()
		{
		}
		
		public var recordid:int;
		public var yyxmdm:String;
		public var yyxmmc:String;
		public var xmdm:String;
		public var xmmc:String;
		public var sfdm:String;
		public var sfmc:String;
		public var dj:Number;
		public var sl:Number;
		public var je:Number;
	}
}