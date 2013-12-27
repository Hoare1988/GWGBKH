package com.winning.bi.model.vo
{
	[Bindable]
	public class SysUserVO
	{
		
	   static private var sysUserVO:SysUserVO=null;
		
		static public function getInstance():SysUserVO
		{
			if (sysUserVO == null)
			{
				sysUserVO=new SysUserVO();
			}
			return sysUserVO;
		}
		
		
		public var userName:String;//用户名(工号)
		public var password:String;//用户姓名
		
		
	}
}