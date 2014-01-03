package org.just.xch.model.domain
{
	import mx.collections.ArrayCollection;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="org.just.xch.domain.AppOption")]
	[Bindable]
	public class AppOption extends LightEntity
	{
		public function AppOption(dm:String='-1',mc:String='全部')
		{
			this.dm=dm;
			this.mc=mc;
		}
		
		public var id:Number;
		public var lbdm:String;
		public var lbmc:String;
		public var dm:String;
		public var mc:String;
		public var cs:String;
		public var bz:String;
		public var yxbz:String;
		public var gxsj:Date;
		
		//其他
		public var isSelected:Boolean=false;
		
		
		
		
		
		public static function getTreatmentCategorys():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
			ac.addItem(new AppOption());
			ac.addItem(new AppOption('1','门诊'));
			ac.addItem(new AppOption('2','住院'));
			return ac;
		}
		
		
		public static function getInsuredCategorys():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
			ac.addItem(new AppOption());
			ac.addItem(new AppOption('1','城保'));
			ac.addItem(new AppOption('2','镇保'));
			ac.addItem(new AppOption('3','农村'));
			ac.addItem(new AppOption('4','儿童'));
			return ac;
		}
		
		
		public static function getCycle():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
			ac.addItem(new AppOption('1','月份'));
			ac.addItem(new AppOption('2','季度'));
			ac.addItem(new AppOption('3','年份'));
			return ac;
		}
		
		
	}
}