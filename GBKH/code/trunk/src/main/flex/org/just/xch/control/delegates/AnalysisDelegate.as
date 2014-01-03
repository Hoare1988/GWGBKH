package org.just.xch.control.delegates
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import org.just.xch.model.domain.SysRole;
	import org.just.xch.model.vo.condition.QueryArgVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	public class AnalysisDelegate
	{
		private var responder:IResponder;
		private var _service: RemoteObject;
		private var token :AsyncToken;
		private var _serviceProcess: RemoteObject;
		
		public function AnalysisDelegate(responder:IResponder)
		{
			this.responder = responder;
		}
		
		private function get service():RemoteObject
		{
			if (_service == null)
			{
				_service=ServiceLocator.getInstance().getService(Services.ANALYSIS_SERVICE) as RemoteObject;
			}
			
			return _service;
		}
		
		private function get serviceProcess():RemoteObject
		{
			if (_serviceProcess == null)
			{
				_serviceProcess=ServiceLocator.getInstance().getService(Services.ANALYSIS_PROCESS) as RemoteObject;
			}
			
			return _serviceProcess;
		}
		
		public function getAllAnalysisHosAvgFees(arg:QueryArgVO):void
		{
			token=service.getAllAnalysisHosAvgFees(arg);
			token.addResponder(responder);
		}
		
		public function getAnalysisHosAvgFeesByHosID(orgID:Number,startDate:String,endDate:String,jzlx:Number):void
		{
			token=service.getAnalysisHosAvgFeesByHosID(orgID,startDate,endDate,jzlx);
			token.addResponder(responder);
		}
		public function getFeePieByJzlx(orgID:Number,beginDate:String,endDate:String):void
		{
			token=service.getFeePieByJzlx(orgID,beginDate,endDate);
			token.addResponder(responder);
		}
		public function getAnalysisHosAvgFeesByHosName(orgName:String,startDate:String,endDate:String):void
		{
			token=service.getAnalysisHosAvgFeesByHosName(orgName,startDate,endDate);
			token.addResponder(responder);
		}
		
		
		public function getAllAnalysisPharmacyTransDisSimple(date:String):void
		{
			token=service.getAllAnalysisPharmacyTransDisSimple(date);
			token.addResponder(responder);
		}
		
		public function getAllAnalysisPharmacyTransDisSimpleByOrgID(arg:QueryArgVO):void
		{
			token=service.getAllAnalysisPharmacyTransDisSimpleByOrgID(arg);
			token.addResponder(responder);
		}
		
		public function getAllAnalysisPharmacyTransDisContentByOrgID(orgID:Number,date:String):void
		{
			token=service.getAllAnalysisPharmacyTransDisContentByOrgID(orgID,date);
			token.addResponder(responder);
		}
		
		public function getAllAnalysisPharmacyTransDisDetailsByOrgID(orgID:Number,date:String):void
		{
			token=service.getAllAnalysisPharmacyTransDisDetailsByOrgID(orgID,date);
			token.addResponder(responder);
		}
		
		public function getAllAnalysisPharmacyTransDisSimpleMount(date:String):void
		{
			token=service.getAllAnalysisPharmacyTransDisSimpleMount(date);
			token.addResponder(responder);
		}
		
		public function getAllAnalysisPharmacyTransDisSimpleByOrgIDMount(orgID:Number,date:String):void
		{
			token=service.getAllAnalysisPharmacyTransDisSimpleByOrgIDMount(orgID,date);
			token.addResponder(responder);
		}
		
		public function getAllAnalysisPharmacyTransDisContentByOrgIDMount(orgID:Number,date:String):void
		{
			token=service.getAllAnalysisPharmacyTransDisContentByOrgIDMount(orgID,date);
			token.addResponder(responder);
		}
		
		public function getAllAnalysisPharmacyTransDisDetailsByOrgIDMount(orgID:Number,date:String):void
		{
			token=service.getAllAnalysisPharmacyTransDisDetailsByOrgIDMount(orgID,date);
			token.addResponder(responder);
		}
		
		public function getALLAnalysisOutPatientSpecificDisease(arg:QueryArgVO):void
		{
			token=service.getALLAnalysisOutPatientSpecificDisease(arg);
			token.addResponder(responder);
		}
		
		public function getALLAnalysisOutPatientSpecificDiseasePeriod(orgID:Number,beginDate:String):void
		{
			token=service.getALLAnalysisOutPatientSpecificDiseasePeriod(orgID,beginDate);
			token.addResponder(responder);
		}
		
		public function getAllDrugManagement(drugNum:String,drugRecordDate:String):void
		{
			token=service.getAllDrugManagement(drugNum,drugRecordDate);
			token.addResponder(responder);
		}
		
		public function getAllItemManagement(itemNum:String,itemRecordDate:String):void
		{
			token=service.getAllItemManagement(itemNum,itemRecordDate);
			token.addResponder(responder);
		}
		
		public function getAllMedicalCareSales(orgID:Number,orgDrugCode:String,beginDate:String,endDate:String,pageNO:int,pageSize:int):void
		{
			token=service.getAllMedicalCareSales(orgID,orgDrugCode,beginDate,endDate,pageNO,pageSize);
			token.addResponder(responder);
		}
		
		public function getAllMedicalCareSaleCount(orgID:Number,orgDrugCode:String,beginDate:String,endDate:String,pageNO:int,pageSize:int):void
		{
			token=service.getAllMedicalCareSaleCount(orgID,orgDrugCode,beginDate,endDate,pageNO,pageSize);
			token.addResponder(responder);
		}
		
		public function getAllMedicalCareSalesDetails(orgID:Number,orgDrugCode:String,beginDate:String,endDate:String):void
		{
			token=service.getAllMedicalCareSalesDetails(orgID,orgDrugCode,beginDate,endDate);
			token.addResponder(responder);
		}
		
		public function getAllWorkRelatedInjuriesReimbursement(orgID:Number,beginDate:String,endDate:String):void
		{
			token=service.getAllWorkRelatedInjuriesReimbursement(orgID,beginDate,endDate);
			token.addResponder(responder);
		}
		
		public function getAllMedicalCareFeeCompareVO(arg:QueryArgVO):void
		{
			token=service.getAllMedicalCareFeeCompareVO(arg);
			token.addResponder(responder);
		}
		
		public function getAllMedicalCareFeeCompareVODetails(orgID:Number,beginDate:String,endDate:String):void
		{
			token=service.getAllMedicalCareFeeCompareVODetails(orgID,beginDate,endDate);
			token.addResponder(responder);
		}
		//shao
		public function getAllMedicalCareFeeCompareVODetailsByTjrq(orgID:Number,beginDate:String,endDate:String):void
		{
			token=service.getMedicalCareFeeCompareVOByTjrq(orgID,beginDate,endDate);
			token.addResponder(responder);
		}
		
		public function getAllMedicalCareFeeFenBuVO(arg:QueryArgVO):void
		{
			token=service.getAllMedicalCareFeeFenBuVO(arg);
			token.addResponder(responder);
		}
		
		public function getAllMedicalCareFeeFenBuVOSimple(arg:QueryArgVO):void
		{
			token=service.getAllMedicalCareFeeFenBuVOSimple(arg);
			token.addResponder(responder);
		}
		
		public function getAllMedicalCareFeeFenBuVOByType(orgID:Number,beginDate:String,endDate:String,rylb:String):void
		{
			token=service.getAllMedicalCareFeeFenBuVOByType(orgID,beginDate,endDate,rylb);
			token.addResponder(responder);
		}
		
		
//		public function getAllMedicalCareFeeFenBuVOByTypeZY(beginDate:String,endDate:String,fyfldm:String,fylb:String):void
//		{
//			token=service.getAllMedicalCareFeeFenBuVOByType(beginDate,endDate,fyfldm,fylb,'zy');
//			token.addResponder(responder);
//		}
		
		
		public function getFeePieByMonth(arg:QueryArgVO):void
		{
			token=service.getFeePieByMonth(arg);
			token.addResponder(responder);
		}
		public function getFeeColByMonthAndDm(ym:String,dm:String):void
		{
			token=service.getFeeColByMonthAndDm(ym,dm);
			token.addResponder(responder);
		}
		public function getFeeCol2ByMonthAndDm(ym:String,dm:String):void
		{
			token=service.getFeeColByMonthAndDm(ym,dm);
			token.addResponder(responder);
		}
		public function getFeeCol1ByMonthAndDm(arg:QueryArgVO):void
		{
			token=service.getFeeColByMonthAndDmTotal(arg);
			token.addResponder(responder);
		}
		public function getFeeDgByMonthAndDm(ym:String,dm:String):void
		{
			token=service.getFeeDgByMonthAndDm(ym,dm);
			token.addResponder(responder);
		}
		public function getAllMedicalCareFeeFenBuGridVO(arg:QueryArgVO):void
		{
			token=service.getAllMedicalCareFeeFenBuGridVO(arg);
			token.addResponder(responder);
		}
		
		public function getAllAnalysisKC21Data(date:String,tableName:String, yydm:String, columnName:String, jylx:String):void
		{
			token=serviceProcess.getAllAnalysisKC21Data(date,tableName,yydm,columnName,jylx);
			token.addResponder(responder);
		}
		
		public function getAllAnalysisKC22Data(date:String,tableName:String, yydm:String, columnName:String, jylx:String):void
		{
			token=service.getAllAnalysisKC22Data(date,tableName,yydm,columnName,jylx);
			token.addResponder(responder);
		}
		
		public function getAllAnalysisWarningByType(date:String,type:String,content:String):void
		{
			token=service.getAllAnalysisWarningByType(date,type,content);
			token.addResponder(responder);
		}	
		
		public function findAnalysisWarningsForDisease(argVO:QueryArgVO):void
		{
			token=service.findAnalysisWarningsForDisease(argVO);
			token.addResponder(responder);
		}	
		
	}
}