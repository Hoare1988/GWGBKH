package com.winning.bi.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="com.winning.bi.domain.WorkRelatedInjuriesReimbursement")]
	[Bindable]
	public class WorkRelatedInjuriesReimbursement extends LightEntity
	{
		public function WorkRelatedInjuriesReimbursement()
		{
		}
		public var manager:String;
		public var manageDate:String;
		public var itemName:String;
		public var num:Number;
		public var totalMoney:Number;
		public var checkedReimbursement:Number;
	}
}