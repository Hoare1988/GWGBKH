package com.winning.bi.model.mlct
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.winning.bi.model.domain.SysModule;
	import com.winning.bi.model.domain.SysOrg;
	import com.winning.bi.model.domain.SysRole;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class SysMgtModelLocator implements ModelLocator
	{
		/* 木偶变量 */
		private var $role:SysRole=null;
		private var $module:SysModule=null;
		private var $org:SysOrg=null;
		
		/*拼音查询*/
		public var uMgt_queryUsersByPYAC:ArrayCollection;
		
		/* 用户管理 */
		public var uMgt_queryUsersAC:ArrayCollection;
		/* 科室*/
		public var uMgt_QueryOrgsAC:ArrayCollection;
		
		/* 角色管理 */
		public var uMgt_queryRolesAC:ArrayCollection;
		/* 模块管理 */
		public var uMgt_queryModulesAC:ArrayCollection;
		/* 权限管理 */
		public var uMgt_queryPmUsersAC:ArrayCollection;
		public var uMgt_queryPmRolesAC:ArrayCollection;
		
		public var uMgt_queryUserByStationAC:ArrayCollection;
		
		public var searchUserInitACFunction:Function=null;
		
		/* 清理操作 */
		public function clearSysUserMgt():void{
			uMgt_queryUsersAC=null;
		}
		
		public function clearSysOrgMgt():void
		{
			uMgt_QueryOrgsAC=null;
		}
		
		public function clearSysRoleMgt():void{
			uMgt_queryRolesAC=null;
		}
		public function clearSysModuleMgt():void{
			uMgt_queryModulesAC=null;
		}
		public function clearSysPermissionMgt():void{
			uMgt_queryPmUsersAC=null;
			uMgt_queryPmRolesAC=null;
		}
		
		public function SysMgtModelLocator()
		{
		}
		static private var instance:SysMgtModelLocator=null;
		static public function getInstance():SysMgtModelLocator
		{
			if(instance == null)
			{
				instance=new SysMgtModelLocator();
			}
			return instance;
		}

	}
}