package org.just.xch.model.domain
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias="org.just.xch.vo.PrescriptionVO")]
	[Bindable]
	public class PrescriptionVO
	{
		public function PrescriptionVO()
		{
		}
		
		public var yyxmdm:String;
		public var yyxmmc:String;
		public var xmdm:String;
		public var xmmc:String;
		public var sflb:String;
		public var sl:Number;
		public var je:Number;
		
		public var gjlclj:String="非路径项目";
		public var bdlclj:String="非路径项目";
		public var jcf:Number=0;
		public var zjcf:Number=0;
		
	}
}