package org.just.xch.control.commands.domain
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.utils.ObjectUtil;
	
	import org.just.xch.control.delegates.SysModuleDelegate;
	import org.just.xch.control.events.domain.SysModuleEvent;
	import org.just.xch.model.domain.SysModule;
	import org.just.xch.model.mlct.SysMgtModelLocator;
	import org.just.xch.utils.ACHelper;
	import org.just.xch.utils.AlertUtil;
	
	public class SysModuleCommand implements ICommand, IResponder
	{
		private var sysMgtModel:SysMgtModelLocator=SysMgtModelLocator.getInstance();

		public function execute(event:CairngormEvent):void
		{
			switch (event.type)
			{
				case SysModuleEvent.EVENT_QUERY_MODULES://模块管理，查询模块功能
					queryModules(event as SysModuleEvent);
					break;
				case SysModuleEvent.EVENT_INSERT_MODULE://模块管理，新增模块功能
					insertModule(event as SysModuleEvent);
					break;
				case SysModuleEvent.EVENT_UPDATE_MODULE://模块管理，更新模块功能
					updateModule(event as SysModuleEvent);
					break;
				case SysModuleEvent.EVENT_DELETE_MODULE://模块管理，删除模块功能
					deleteModule(event as SysModuleEvent);
					break;
				default:
					break;
			}
		}

		/* event handler begin */
		private function queryModules(event:SysModuleEvent):void
		{
			sysMgtModel.uMgt_queryModulesAC=null;
			var arg:Array=event.data as Array;
			var handler:IResponder=getHandler(queryModulesResultHandler, fault);
			var delegate:SysModuleDelegate=new SysModuleDelegate(handler);
			delegate.queryModulesByCondition();
		}
		
		private function insertModule(event:SysModuleEvent):void
		{
			if(event.data){
				var handler:IResponder=getHandler(insertModuleResultHandler, fault);
				var delegate:SysModuleDelegate=new SysModuleDelegate(handler);
				delegate.insertSysModule(event.data as SysModule);
			}
			
		}
		
		private function updateModule(event:SysModuleEvent):void
		{
			if(event.data){
				var handler:IResponder=getHandler(updateModuleResultHandler, fault);
				var delegate:SysModuleDelegate=new SysModuleDelegate(handler);
				delegate.updateSysModule(event.data as SysModule);
			}
			
		}
		
		private function deleteModule(event:SysModuleEvent):void
		{
			if(event.data){
				var handler:IResponder=getHandler(deleteModuleResultHandler, fault);
				var delegate:SysModuleDelegate=new SysModuleDelegate(handler);
				delegate.deleteSysModule(event.data as SysModule);
			}
			
		}


		/* event handler end */



		/* result handler begin */
		private function queryModulesResultHandler(data:Object):void
		{
			sysMgtModel.uMgt_queryModulesAC=data.result as ArrayCollection;
		}
		
		private function insertModuleResultHandler(data:Object):void
		{
			if(data.result){
				/* var ac:ArrayCollection=ObjectUtil.copy(sysMgtModel.uMgt_queryModulesAC) as ArrayCollection;
				if(ac==null){
					ac=new ArrayCollection();
				}
				ac.addItem(data.result as SysModule);
				sysMgtModel.uMgt_queryModulesAC=ac; */
			}else{
				AlertUtil.showMessages("该模块名已经存在！");
			}
		}
		
		private function updateModuleResultHandler(data:Object):void
		{
			if(data.result){
				sysMgtModel.uMgt_queryModulesAC=ACHelper.replaceObjById(sysMgtModel.uMgt_queryModulesAC,data.result as SysModule);
			}
		}
		
		private function deleteModuleResultHandler(data:Object):void
		{
			AlertUtil.showMessages("删除成功！");
		}

		/* result handler end */





		public function SysModuleCommand()
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