package org.just.xch.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[RemoteClass(alias="org.just.xch.domain.SettlementDetailLine")]
	[Bindable]
	public class SettlementDetailLine extends LightEntity
	{
		public function SettlementDetailLine()
		{
		}
		
		public var jsd_id:Number;
		public var jsd_balanceid:Number;
		
		public var jsd_zlje:Number;// CKC109 自理金额
		public var jsd_zfje:Number;// CKC108 自费金额
		public var jsd_fhjbylje:Number;// CKC102 符合基本医疗金额
		public var jsd_zhzf:Number;// CKC105 帐户支付
		public var jsd_xjzf:Number;// CKC118 现金支付
		public var jsd_gbzhzf:Number;// CKC110 公补帐户支付
		public var jsd_qbzhzf:Number;// CKC111 企补帐户支付
		public var jsd_tczf:Number;// AKC260 统筹支付
		public var jsd_qbzf:Number;// CKC104 企补支付
		public var jsd_gbzf:Number;// CKC103 公补支付
		
		public var jsd_ze:Number;// CKC101 总额
		public var jsd_zhje:Number;//账户金额=帐户支付(CKC105 ) + 公补帐户支付(CKC110 ) +企补帐户支付(CKC111 ) 
		public var jsd_jzje:Number;//记账金额=总金额(CKC101) -现金支付(CKC118 )
		public var jsd_jjje:Number;//基金=记账金额-账户金额
	}
}