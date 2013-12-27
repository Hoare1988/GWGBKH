package com.winning.bi.model.mlct
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.winning.bi.model.domain.AppOption;
	import com.winning.bi.model.domain.FAIndex;
	import com.winning.bi.model.domain.SysModule;
	import com.winning.bi.model.domain.SysOrg;
	import com.winning.bi.model.domain.SysRole;
	import com.winning.bi.model.domain.SysUser;
	import com.winning.bi.model.vo.CodeName;
	import com.winning.bi.utils.Constant;
	
	import flash.display.DisplayObject;
	
	import mx.collections.ArrayCollection;
	import mx.core.Application;
	import mx.utils.ObjectProxy;


	[Bindable]
	public class AppModelLocator implements ModelLocator
	{
		/* 木偶变量 */
		private var $role:SysRole=null;
		private var $module:SysModule=null;
		private var $org:SysOrg=null;
		private var $option:AppOption=null;

		public var mainPage:DisplayObject;
		public var mySMS:ArrayCollection;
		public var unReadSMS:int=0;
		/* 常量 */
		public static const VS_0:int=0;
		public static const VS_1:int=1;

		/* 系统登录框与欢迎页面 */
		public var vsindex:int=VS_0;
		public var language:int=Constant.LANG_ZH;

		/* 登录用户 */
		public var loginUser:SysUser;

		public var isFirstIn:Boolean=true;

		public var tenAC:ArrayCollection=new ArrayCollection();
		public var elevenAC:ArrayCollection=new ArrayCollection();
		/* 用户权限审核 */
		public var applyRecords:ArrayCollection;

		/* 基础数据-选项管理 */
		public var appOptions:ArrayCollection;

		/*抽取日志*/
		public var logRecords:ArrayCollection;
		public var sysLogsCount:Number;

		
		public var rootItems:ArrayCollection=new ArrayCollection();

		public var downloadFlag:int=0;
	
		/* 清理操作 */
		public function clearAppOptionMgt():void
		{
			appOptions=null;
		}

		public function clearApplyPermissionMgt():void
		{
			applyRecords=null;
		}

		public function clearLogs():void
		{
			logRecords=null;
		}

		public function AppModelLocator()
		{
		}
		static private var instance:AppModelLocator=null;

		static public function getInstance():AppModelLocator
		{
			if (instance == null)
			{
				instance=new AppModelLocator();
			}
			return instance;
		}

	}
}