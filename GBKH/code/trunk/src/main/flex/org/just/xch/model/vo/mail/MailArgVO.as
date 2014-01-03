package org.just.xch.model.vo.mail
{
	[RemoteClass(alias="org.just.xch.vo.mail.MailArgVO")]
	[Bindable]
	public class MailArgVO
	{
		public function MailArgVO()
		{
		}
		public var toAddress:String;//收件人
		public var subject:String;//主题
		public var content:String;//内容
		public var csAddress:String;//抄送地址
	}
}