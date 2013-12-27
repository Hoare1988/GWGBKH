package com.winning.bi.control.commands.domain
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.winning.bi.control.delegates.SysOrgDelegate;
	import com.winning.bi.control.events.domain.SysOrgEvent;
	import com.winning.bi.model.domain.*;
	import com.winning.bi.model.mlct.SysMgtModelLocator;
	import com.winning.bi.utils.ACHelper;
	import com.winning.bi.utils.AlertUtil;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.utils.ObjectUtil;

	public class SysOrgCommand implements ICommand, IResponder
	{
		private var sysMgtModel:SysMgtModelLocator=SysMgtModelLocator.getInstance();
		public function execute(event:CairngormEvent):void
		{
			switch (event.type)
			{
				case SysOrgEvent.EVENT_QUERY_ORGS://科室,查询用户功能
					queryOrgs(event as SysOrgEvent);
				case SysOrgEvent.EVENT_ADD_USER_ORG_MAP://科室,查询用户功能
					insertUserOrgMapping(event as SysOrgEvent);
					break;
				case SysOrgEvent.EVENT_Query_USER_BY_ORG_STATION: //
					queryUsersByStation(event as SysOrgEvent);
					break;
				case SysOrgEvent.EVENT_ADD_OR_UPDATE_ORG:
					addOrUpdateOrg(event as SysOrgEvent);
					break;
				default:
					break;
			}
		}

		private function addOrUpdateOrg(event:SysOrgEvent):void
		{
			var hander:IResponder=getHandler(result, fault);
			var delgate:SysOrgDelegate=new SysOrgDelegate(hander);
			delgate.saveOrUpdateSysorg(event.data as SysOrg);
		}
		
		
		/* event handler begin */
		private function queryOrgs(event:SysOrgEvent):void
		{
			sysMgtModel.uMgt_QueryOrgsAC=null;
			var arg:Array=event.data as Array;
			var handler:IResponder=getHandler(queryOrgsResultHandler, fault);
			var delegate:SysOrgDelegate=new SysOrgDelegate(handler);
			delegate.queryOrgsByCondition(arg[0],arg[1]);
		}
		
		private function queryUsersByStation(event:SysOrgEvent):void
		{
			var arg:Array=event.data as Array;
			var handler:IResponder=getHandler(queryUsersByStationResultHandler, fault);
			var delegate:SysOrgDelegate=new SysOrgDelegate(handler);
			var station:Number=null;
			if(arg[1]!=null&&arg[1]!="")
			{
				station=Number(arg[1]);
			}
			delegate.findSysUserByStationOrgNameMap(arg[0], station);
		}
//		
		private function insertUserOrgMapping(event:SysOrgEvent):void
		{
			if(event.data){
				var handler:IResponder=getHandler(result, fault);
				var delegate:SysOrgDelegate=new SysOrgDelegate(handler);
				delegate.insertSysUserOrgMap(event.data as SysUserOrgMapping);
			}
			
		}
//		
//		private function savePmUserRoles(event:SysUserEvent):void
//		{
//			if(event.data){
//				var handler:IResponder=getHandler(savePmUserRolesResultHandler, fault);
//				var delegate:SysUserDelegate=new SysUserDelegate(handler);
//				delegate.savePmUserRoles(event.data as SysUser);
//			}
//			
//		}
//		
//		private function updateUser(event:SysUserEvent):void
//		{
//			if(event.data){
//				var handler:IResponder=getHandler(updateUserResultHandler, fault);
//				var delegate:SysUserDelegate=new SysUserDelegate(handler);
//				delegate.updateSysUser(event.data as SysUser);
//			}
//			
//		}


		/* event handler end */
		/* result handler begin */
		private function queryOrgsResultHandler(data:Object):void
		{
			sysMgtModel.uMgt_QueryOrgsAC=data.result as ArrayCollection;
		}
		
		private function queryUsersByStationResultHandler(data:Object)
		{
			sysMgtModel.uMgt_queryUserByStationAC=null;
			sysMgtModel.uMgt_queryUserByStationAC=data.result as ArrayCollection;
		}
		
//		private function queryPmUsersResultHandler(data:Object):void
//		{
//			sysMgtModel.uMgt_queryPmUsersAC=data.result as ArrayCollection;
//		}
//		
//		private function insertUserResultHandler(data:Object):void
//		{
//			if(data.result){
//				var ac:ArrayCollection=ObjectUtil.copy(sysMgtModel.uMgt_queryUsersAC) as ArrayCollection;
//				if(ac==null){
//					ac=new ArrayCollection();
//				}
//				ac.addItem(data.result as SysUser);
//				sysMgtModel.uMgt_queryUsersAC=ac;
//			}else{
//				AlertUtil.showMessages("该用户名已经存在！");
//			}
//		}
//		private function updateUserResultHandler(data:Object):void
//		{
//			if(data.result){
//				sysMgtModel.uMgt_queryUsersAC=ACHelper.replaceObjById(sysMgtModel.uMgt_queryUsersAC,data.result as SysUser);
//			}
//		}
//		private function savePmUserRolesResultHandler(data:Object):void
//		{
//			if(data.result){
//				sysMgtModel.uMgt_queryPmUsersAC=ACHelper.replaceObjById(sysMgtModel.uMgt_queryPmUsersAC,data.result as SysUser);
//			}
//		}

		/* result handler end */
		public function SysOrgCommand()
		{
		}

		public function result(data:Object):void
		{
		}

		public function fault(event:Object):void
		{
			//AlertUtil.remoteMsg(event);
		}

		private function getHandler(result:Function, fault:Function):IResponder
		{
			return (new mx.rpc.Responder(result, fault));
		}

	}
}