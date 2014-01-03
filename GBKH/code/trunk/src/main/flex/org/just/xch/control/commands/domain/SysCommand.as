package org.just.xch.control.commands.domain
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import org.just.xch.control.delegates.AppDelegate;
	import org.just.xch.control.delegates.SysUserDelegate;
	import org.just.xch.control.events.domain.PageEvent;
	import org.just.xch.control.events.domain.SysEvent;
	import org.just.xch.model.domain.AppOption;
	import org.just.xch.model.domain.ApplyRecord;
	import org.just.xch.model.domain.SMS;
	import org.just.xch.model.domain.SysUser;
	import org.just.xch.model.mlct.AppModelLocator;
	import org.just.xch.model.vo.condition.QueryArgVO;
	import org.just.xch.utils.AlertUtil;
	
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