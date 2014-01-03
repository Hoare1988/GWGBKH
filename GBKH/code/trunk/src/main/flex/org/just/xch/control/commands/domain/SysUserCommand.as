package org.just.xch.control.commands.domain
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import org.just.xch.control.delegates.SysUserDelegate;
	import org.just.xch.control.events.domain.SysUserEvent;
	import org.just.xch.model.domain.SysUser;
	import org.just.xch.model.mlct.SysMgtModelLocator;
	import org.just.xch.utils.ACHelper;
	import org.just.xch.utils.AlertUtil;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.utils.ObjectUtil;

	public class SysUserCommand implements ICommand, IResponder
	{
		private var sysMgtModel:SysMgtModelLocator=SysMgtModelLocator.getInstance();



		public function execute(event:CairngormEvent):void
		{
			switch (event.type)
			{
				case SysUserEvent.EVENT_QUERY_USERS://用户管理，查询用户功能
					queryUsers(event as SysUserEvent);
					break;
				case SysUserEvent.EVENT_INSERT_USER://用户管理，新增用户功能
					insertUser(event as SysUserEvent);
					break;
				case SysUserEvent.EVENT_UPDATE_USER://用户管理，更新用户功能
					updateUser(event as SysUserEvent);
					break;
				case SysUserEvent.EVENT_QUERY_PMUSERS://权限管理，查询用户功能
					queryPmUsers(event as SysUserEvent);
					break;
				case SysUserEvent.EVENT_INSERT_PMUSERS://权限管理，保存用户角色功能
					savePmUserRoles(event as SysUserEvent);
					
				case SysUserEvent.EVENT_QUERY_USERS_BY_PY://权限管理，保存用户角色功能
					queryUsersByPinYin(event as SysUserEvent);
					break;
				default:
					break;
			}
		}

		private function queryUsersByPinYin(event:SysUserEvent):void
		{
			var handler:IResponder=getHandler(queryUsersByPinYinResultHandler, fault);
			var delegate:SysUserDelegate=new SysUserDelegate(handler);
			delegate.queryUsersByCondition(null, null, event.data);
		}
		
		private function queryUsersByPinYinResultHandler(data:Object):void
		{
			sysMgtModel.searchUserInitACFunction(data.result);
		}
		
		
		
		/* event handler begin */
		private function queryUsers(event:SysUserEvent):void
		{
			sysMgtModel.uMgt_queryUsersAC=null;
			var arg:Array=event.data as Array;
			var handler:IResponder=getHandler(queryUsersResultHandler, fault);
			var delegate:SysUserDelegate=new SysUserDelegate(handler);
			delegate.queryUsersByCondition(arg[0], arg[1], arg[2]);
		}
		
		private function queryPmUsers(event:SysUserEvent):void
		{
			sysMgtModel.uMgt_queryPmUsersAC=null;
			var arg:Array=event.data as Array;
			var handler:IResponder=getHandler(queryPmUsersResultHandler, fault);
			var delegate:SysUserDelegate=new SysUserDelegate(handler);
			delegate.queryPmUsers(arg[0], arg[1], arg[2]);
		}
		
		private function insertUser(event:SysUserEvent):void
		{
			if(event.data){
				var handler:IResponder=getHandler(insertUserResultHandler, fault);
				var delegate:SysUserDelegate=new SysUserDelegate(handler);
				delegate.insertSysUser(event.data as SysUser);
			}
			
		}
		
		private function savePmUserRoles(event:SysUserEvent):void
		{
			if(event.data){
				var handler:IResponder=getHandler(savePmUserRolesResultHandler, fault);
				var delegate:SysUserDelegate=new SysUserDelegate(handler);
				delegate.savePmUserRoles(event.data as SysUser);
			}
			
		}
		
		private function updateUser(event:SysUserEvent):void
		{
			if(event.data){
				var handler:IResponder=getHandler(updateUserResultHandler, fault);
				var delegate:SysUserDelegate=new SysUserDelegate(handler);
				delegate.updateSysUser(event.data as SysUser);
			}
			
		}


		/* event handler end */



		/* result handler begin */
		private function queryUsersResultHandler(data:Object):void
		{
			sysMgtModel.uMgt_queryUsersAC=data.result as ArrayCollection;
		}
		
		private function queryPmUsersResultHandler(data:Object):void
		{
			sysMgtModel.uMgt_queryPmUsersAC=data.result as ArrayCollection;
		}
		
		private function insertUserResultHandler(data:Object):void
		{
			if(data.result){
				var ac:ArrayCollection=ObjectUtil.copy(sysMgtModel.uMgt_queryUsersAC) as ArrayCollection;
				if(ac==null){
					ac=new ArrayCollection();
				}
				ac.addItem(data.result as SysUser);
				sysMgtModel.uMgt_queryUsersAC=ac;
			}else{
				AlertUtil.showMessages("该用户名已经存在！");
			}
		}
		private function updateUserResultHandler(data:Object):void
		{
			if(data.result){
				sysMgtModel.uMgt_queryUsersAC=ACHelper.replaceObjById(sysMgtModel.uMgt_queryUsersAC,data.result as SysUser);
			}
		}
		private function savePmUserRolesResultHandler(data:Object):void
		{
			if(data.result){
				sysMgtModel.uMgt_queryPmUsersAC=ACHelper.replaceObjById(sysMgtModel.uMgt_queryPmUsersAC,data.result as SysUser);
			}
		}

		/* result handler end */





		public function SysUserCommand()
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