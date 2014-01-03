package org.just.xch.model.bean
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class MenuBean
	{
		public function MenuBean(label:String, type:String, data:Number, children:ArrayCollection=null)
		{
			this.label=label;
			this.type=type;
			this.data=data;
			this.children=children;
			this.toggle=false;
		}

		public var label:String;
		public var type:String;
		public var data:Number;
		public var toggle:Boolean;
		public var children:ArrayCollection;


		public static function getMenuBeans():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();

			var ac1:ArrayCollection=new ArrayCollection();
			ac1.addItem(new MenuBean('基金支出', 'check', 1));
			ac1.addItem(new MenuBean('个人账户', 'check', 2));
			ac1.addItem(new MenuBean('统筹基金', 'check', 3));
			var ac2:ArrayCollection=new ArrayCollection();
			ac2.addItem(new MenuBean('医疗费用', 'check', 1));
			ac2.addItem(new MenuBean('药品费用', 'check', 1));
			ac2.addItem(new MenuBean('均次费用', 'check', 1));
			ac2.addItem(new MenuBean('均次药费', 'check', 1));
			ac2.addItem(new MenuBean('药占比', 'check', 1));
			var ac3:ArrayCollection=new ArrayCollection();
			ac3.addItem(new MenuBean('就诊人次', 'check', 1));

			ac.addItem(new MenuBean('基金', '', 0, ac1));
			ac.addItem(new MenuBean('费用', '', 0, ac2));
			ac.addItem(new MenuBean('人次', '', 0, ac3));
			return ac;
		}
	}



}