package com.winning.bi.utils
{
	import com.winning.bi.control.events.domain.SysEvent;
	import com.winning.bi.model.mlct.AppModelLocator;
	import com.winning.bi.model.vo.SysUserVO;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	import mx.events.ValidationResultEvent;
	import mx.managers.PopUpManager;
	import mx.rpc.events.FaultEvent;
	
	public class AlertUtil
	{
		
		
		public function AlertUtil()
		{
		}
		
		public static var appModel:AppModelLocator=AppModelLocator.getInstance();
		
		public static const WARN:String="提示信息";
		public static const DEL:String="确定要删除吗?";
		public static const HMD:String="确定要加入黑名单吗?";
		
		public static function errorMessages(validatorErrorArray:Array):void{
			var errorMessageArray:Array=[];
			for each (var err:ValidationResultEvent in validatorErrorArray)
			{
				errorMessageArray.push(err.message);
			}
			Alert.show(errorMessageArray.join("\n"),"请按照以下错误提示信息重新填写", Alert.OK);
		}
		
		public static function showMessages(errStr:String):void{
			Alert.show(errStr, WARN, Alert.OK);
		}
		
		public static function remoteMsg(event:Object):void{
			if(event!=null&&event.hasOwnProperty("message")&&event.message!=null&&event.message.hasOwnProperty("rootCause")&&event.message.rootCause!=null&&event.message.rootCause.hasOwnProperty("message")&&event.message.rootCause.message!=null){
				Alert.show(event.message.rootCause.message.toString(),"系统提示", Alert.OK);
			}else{
				Alert.show(event.toString(),"系统提示", Alert.OK);
			}
		}
		
		public static function saveSuccess():void{
			Alert.show("保存成功！", WARN, Alert.OK);
		}
		
		public static function show(event:Object):void
		{
			if (event is FaultEvent)
			{
				if (FaultEvent(event).fault && FaultEvent(event).fault.rootCause)
				{
					if (FaultEvent(event).fault.rootCause.hasOwnProperty("message") && FaultEvent(event).fault.rootCause.message != null && FaultEvent(event).fault.rootCause.message != '')
					{
						Alert.show(FaultEvent(event).fault.rootCause.message,"提示");
					}
					else if (FaultEvent(event).fault.rootCause.hasOwnProperty("message") && FaultEvent(event).fault.rootCause.messages != null && FaultEvent(event).fault.rootCause.messages != '')
					{
						Alert.show(FaultEvent(event).fault.rootCause.messages,"提示");
					}
					else
					{
						Alert.show(event.toString(),"提示");
					}
				}
				else
				{
					Alert.show(event.toString(),"提示");
				}
			}
			else
			{
				Alert.show(event.toString(),"提示");
			}
		}
		
	}
}