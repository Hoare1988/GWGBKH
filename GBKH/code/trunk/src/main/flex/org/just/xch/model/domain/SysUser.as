package org.just.xch.model.domain
{
	import mx.collections.ArrayCollection;
	

	[RemoteClass(alias="org.just.xch.domain.sys.SysUser")]
	[Bindable]
	public class SysUser extends BaseDomain
	{
		public function SysUser()
		{

		}

		public var userName:String;//用户名(工号)
		public var password:String;//用户姓名
		public var realName:String;//密码
		public var py:String;//拼音码
		public var wb:String;//五笔码
		public var type:int;//类型
		public var lastLoginTime:Date;//最近登录时间
		public var loginCount:int;//登录系统次数
		public var roles:ArrayCollection;//角色
		public var orgs:ArrayCollection;
		
		public var gender:String;//性别
		public var deptcode:String;//部门编码
		public var deptname:String;//部门名称
		public var cellphone:String;//移动电话
		public var telphone:String;//固定电话
		public var email:String;//邮件地址
		public var superiors:Number;//上级主管
		public var postname:String;//职位名称
		public var entrydate:Date;//入职日期
		public var canaudit:Number;//拥有审核权限
		public var privilege:Number;//访问特权

		public var isSelected:Boolean;//flex 页面是否选中了
		
	}
}