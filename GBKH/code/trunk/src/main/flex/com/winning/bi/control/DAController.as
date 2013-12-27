package com.winning.bi.control
{
	import com.adobe.cairngorm.control.FrontController;
	import com.winning.bi.control.commands.domain.ItemCommand;
	import com.winning.bi.control.commands.domain.SysCommand;
	import com.winning.bi.control.commands.domain.SysModuleCommand;
	import com.winning.bi.control.commands.domain.SysRoleCommand;
	import com.winning.bi.control.commands.domain.SysUserCommand;
	import com.winning.bi.control.commands.domain.SysOrgCommand;
	import com.winning.bi.control.commands.domain.ExeItemCommand;
	
	
	import com.winning.bi.control.events.domain.ItemEvent;
	import com.winning.bi.control.events.domain.SysEvent;
	import com.winning.bi.control.events.domain.SysMemcacheEvent;
	import com.winning.bi.control.events.domain.SysModuleEvent;
	import com.winning.bi.control.events.domain.SysRoleEvent;
	import com.winning.bi.control.events.domain.SysUserEvent;
	import com.winning.bi.control.events.domain.SysOrgEvent;
	import com.winning.bi.control.events.domain.ExeItemEvent;


	public class DAController extends FrontController
	{
		public function DAController()
		{
			super();
			registerSysCommands();
			registerSysUserCommands();
			registerSysRoleCommands();
			registerSysModuleCommands();
			registerSysOrgCommands();
			registerItemCommands();
			registerExeItemCommands();
		}

		private function registerSysCommands():void
		{
			this.addCommand(SysEvent.EVENT_LOGIN, SysCommand);
			this.addCommand(SysEvent.EVENT_EXIT, SysCommand);
		}

		private function registerSysUserCommands():void
		{
			this.addCommand(SysUserEvent.EVENT_QUERY_USERS, SysUserCommand);
			this.addCommand(SysUserEvent.EVENT_INSERT_USER, SysUserCommand);
			this.addCommand(SysUserEvent.EVENT_UPDATE_USER, SysUserCommand);
			this.addCommand(SysUserEvent.EVENT_QUERY_PMUSERS, SysUserCommand);
			this.addCommand(SysUserEvent.EVENT_INSERT_PMUSERS, SysUserCommand);
			this.addCommand(SysUserEvent.EVENT_QUERY_USERS_BY_PY, SysUserCommand);
		}
		
		private function registerSysOrgCommands():void
		{
			this.addCommand(SysOrgEvent.EVENT_ADD_OR_UPDATE_ORG, SysOrgCommand);
			this.addCommand(SysOrgEvent.EVENT_QUERY_ORGS, SysOrgCommand);
			this.addCommand(SysOrgEvent.EVENT_ADD_USER_ORG_MAP, SysOrgCommand);
			this.addCommand(SysOrgEvent.EVENT_Query_USER_BY_ORG_STATION, SysOrgCommand);
		}

		private function registerSysRoleCommands():void
		{
			this.addCommand(SysRoleEvent.EVENT_QUERY_ROLES, SysRoleCommand);
			this.addCommand(SysRoleEvent.EVENT_INSERT_ROLE, SysRoleCommand);
			this.addCommand(SysRoleEvent.EVENT_UPDATE_ROLE, SysRoleCommand);

			this.addCommand(SysRoleEvent.EVENT_QUERY_PMROLES, SysRoleCommand);
			this.addCommand(SysRoleEvent.EVENT_INSERT_PMROLES, SysRoleCommand);
		}

		private function registerSysModuleCommands():void
		{
			this.addCommand(SysModuleEvent.EVENT_QUERY_MODULES, SysModuleCommand);
			this.addCommand(SysModuleEvent.EVENT_INSERT_MODULE, SysModuleCommand);
			this.addCommand(SysModuleEvent.EVENT_UPDATE_MODULE, SysModuleCommand);
			this.addCommand(SysModuleEvent.EVENT_DELETE_MODULE, SysModuleCommand);
		}

		private function registerItemCommands():void
		{
			this.addCommand(ItemEvent.EVENT_ADD_ROOT_ITEM,ItemCommand);
			this.addCommand(ItemEvent.EVENT_ADD_ITEM,ItemCommand);
			this.addCommand(ItemEvent.EVENT_DELETE_ITEM,ItemCommand);
			this.addCommand(ItemEvent.EVENT_LOAD_ALL_ITEM,ItemCommand);
			this.addCommand(ItemEvent.EVENT_UPDATE_ITEM,ItemCommand);
			this.addCommand(ItemEvent.EVENT_FIND_ROOT_ITEM,ItemCommand);
			this.addCommand(ItemEvent.EVENT_DELETE_ITEM_AC,ItemCommand);
			
			this.addCommand(ItemEvent.EVENT_ADD_PERMISSION,ItemCommand);
			this.addCommand(ItemEvent.EVENT_DELETE_ITEMPERMISSIONS,ItemCommand);
		}
		
		private function registerExeItemCommands():void
		{
			this.addCommand(ExeItemEvent.EVENT_QUERY_ROOT_EXE_ITEM,ExeItemCommand);
			this.addCommand(ExeItemEvent.EVENT_UPDATE_EXEITEMLIST_GRADE,ExeItemCommand);
			this.addCommand(ExeItemEvent.EVENT_UPDATE_EXEITEM_GRADE,ExeItemCommand);
			this.addCommand(ExeItemEvent.EVENT_FIND_EXEITEM_BY_CONDITION,ExeItemCommand);
			this.addCommand(ExeItemEvent.EVENT_CREATE_EXEITEM_TREE,ExeItemCommand);
			this.addCommand(ExeItemEvent.EVENT_CALCULATE_EXAM_SUMPOINT,ExeItemCommand);
			this.addCommand(ExeItemEvent.EVENT_QUERY_EXAMEXCEL_ITEMS_BY_ROOTEXEITEM,ExeItemCommand);
			this.addCommand(ExeItemEvent.EVENT_UPDATE_EXEITEMS,ExeItemCommand);
			
		}
	}
}