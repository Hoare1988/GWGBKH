package com.winning.bi.control.commands.domain
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.utils.ObjectUtil;
	
	import com.winning.bi.control.delegates.SysRoleDelegate;
	import com.winning.bi.control.events.domain.SysRoleEvent;
	import com.winning.bi.model.domain.SysRole;
	import com.winning.bi.model.mlct.SysMgtModelLocator;
	import com.winning.bi.utils.ACHelper;
	import com.winning.bi.utils.AlertUtil;
	
	public class SysRoleCommand implements ICommand, IResponder
	{
		private var sysMgtModel:SysMgtModelLocator=SysMgtModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			switch (event.type)
			{
				case SysRoleEvent.EVENT_QUERY_ROLES://角色管理，查询角色功能
					queryRoles(event as SysRoleEvent);
					break;
				case SysRoleEvent.EVENT_INSERT_ROLE://角色管理，新增角色功能
					insertRole(event as SysRoleEvent);
					break;
				case SysRoleEvent.EVENT_UPDATE_ROLE://角色管理，更新角色功能
					updateRole(event as SysRoleEvent);
					break;	
				case SysRoleEvent.EVENT_QUERY_PMROLES://权限管理，查询角色模块功能
					queryPmRoles(event as SysRoleEvent);
					break;	
				case SysRoleEvent.EVENT_INSERT_PMROLES://权限管理，保存角色模块功能
					savePmRoleModules(event as SysRoleEvent);
					break;	
				default:
					break;
			}
		}

		/* event handler begin */
		private function queryRoles(event:SysRoleEvent):void
		{
			sysMgtModel.uMgt_queryRolesAC=null;
			var arg:Array=event.data as Array;
			var handler:IResponder=getHandler(queryRolesResultHandler, fault);
			var delegate:SysRoleDelegate=new SysRoleDelegate(handler);
			delegate.queryRolesByCondition(arg[0]);
		}
		
		private function queryPmRoles(event:SysRoleEvent):void
		{
			sysMgtModel.uMgt_queryPmRolesAC=null;
			var arg:Array=event.data as Array;
			var handler:IResponder=getHandler(queryPmRolesResultHandler, fault);
			var delegate:SysRoleDelegate=new SysRoleDelegate(handler);
			delegate.queryPmRoles(arg[0]);
		}
		
		private function insertRole(event:SysRoleEvent):void
		{
			if(event.data){
				var handler:IResponder=getHandler(insertRoleResultHandler, fault);
				var delegate:SysRoleDelegate=new SysRoleDelegate(handler);
				delegate.insertSysRole(event.data as SysRole);
			}
			
		}
		
		private function updateRole(event:SysRoleEvent):void
		{
			if(event.data){
				var handler:IResponder=getHandler(updateRoleResultHandler, fault);
				var delegate:SysRoleDelegate=new SysRoleDelegate(handler);
				delegate.updateSysRole(event.data as SysRole);
			}
			
		}
		private function savePmRoleModules(event:SysRoleEvent):void
		{
			if(event.data){
				var handler:IResponder=getHandler(savePmRoleModulesResultHandler, fault);
				var delegate:SysRoleDelegate=new SysRoleDelegate(handler);
				delegate.savePmRoleModules(event.data as SysRole);
			}
			
		}


		/* event handler end */



		/* result handler begin */
		private function queryRolesResultHandler(data:Object):void
		{
			sysMgtModel.uMgt_queryRolesAC=data.result as ArrayCollection;
		}
		
		private function queryPmRolesResultHandler(data:Object):void
		{
			sysMgtModel.uMgt_queryPmRolesAC=data.result as ArrayCollection;
		}
		
		private function insertRoleResultHandler(data:Object):void
		{
			if(data.result){
				var ac:ArrayCollection=ObjectUtil.copy(sysMgtModel.uMgt_queryRolesAC) as ArrayCollection;
				if(ac==null){
					ac=new ArrayCollection();
				}
				ac.addItem(data.result as SysRole);
				sysMgtModel.uMgt_queryRolesAC=ac;
			}else{
				AlertUtil.showMessages("该角色名已经存在！");
			}
		}
		private function updateRoleResultHandler(data:Object):void
		{
			if(data.result){
				sysMgtModel.uMgt_queryRolesAC=ACHelper.replaceObjById(sysMgtModel.uMgt_queryRolesAC,data.result as SysRole);
			}
		}
		
		private function savePmRoleModulesResultHandler(data:Object):void
		{
			if(data.result){
				sysMgtModel.uMgt_queryPmRolesAC=ACHelper.replaceObjById(sysMgtModel.uMgt_queryPmRolesAC,data.result as SysRole);
			}
		}

		/* result handler end */





		public function SysRoleCommand()
		{
		}

		public function result(data:Object):void
		{
		}

		public function fault(event:Object):void
		{
			AlertUtil.remoteMsg(event);
		}

		private function getHandler(result:Function, fault:Function):IResponder
		{
			return (new mx.rpc.Responder(result, fault));
		}
	}
}