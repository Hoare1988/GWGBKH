package com.winning.bi.control.commands.domain
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.winning.bi.control.delegates.AppDelegate;
	import com.winning.bi.control.delegates.SysUserDelegate;
	import com.winning.bi.control.events.domain.PageEvent;
	import com.winning.bi.control.events.domain.SysEvent;
	import com.winning.bi.model.domain.AppOption;
	import com.winning.bi.model.domain.ApplyRecord;
	import com.winning.bi.model.domain.SMS;
	import com.winning.bi.model.domain.SysUser;
	import com.winning.bi.model.mlct.AppModelLocator;
	import com.winning.bi.model.vo.condition.QueryArgVO;
	import com.winning.bi.utils.AlertUtil;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;

	public class SysCommand implements ICommand, IResponder
	{

		private var appModel:AppModelLocator=AppModelLocator.getInstance();

		public function execute(event:CairngormEvent):void
		{
			switch (event.type)
			{
				case SysEvent.EVENT_LOGIN: //登录系统
					loginSystem(event as SysEvent);
					break;
				case SysEvent.EVENT_EXIT: //登出系统
					exitSystem(event as SysEvent);
					break;
			
					break;
				default:
					break;
			}
		}

		/* event handler begin */
		private function loginSystem(event:SysEvent):void
		{
			appModel.loginUser=null;
			var arg:Array=event.data as Array;
			var handler:IResponder=getHandler(loginSystemResultHandler, fault);
			var delegate:SysUserDelegate=new SysUserDelegate(handler);
			delegate.login(arg[0], arg[1]);
		}


		private function exitSystem(event:SysEvent):void
		{
			appModel.loginUser=null;
			appModel.vsindex=AppModelLocator.VS_0;

			var handler:IResponder=getHandler(result, fault);
			var delegate:SysUserDelegate=new SysUserDelegate(handler);
			delegate.logout();
		}
		

		/* event handler end */



		private function findAllNeedCheckApplyRecordsResultHandler(data:Object):void
		{
			appModel.applyRecords=data.result as ArrayCollection;
		}
		private function saveAfterReadSMSResultHandler(data:Object):void
		{
		}
		
		private function loginSystemResultHandler(data:Object):void
		{
			if (data.result)
			{
				appModel.loginUser=data.result as SysUser;
				appModel.vsindex=AppModelLocator.VS_1;
			}
			else
			{
				AlertUtil.showMessages("用户名或密码错误!");
			}
		}

		private function getSysLogCountResultHandler(data:Object):void
		{
			
			if (data.result)
			{
				appModel.sysLogsCount=data.result as Number;
			}
		}
		
		/* result handler end */
		public function SysCommand()
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