package com.winning.bi.model.mlct
{
	import com.adobe.cairngorm.model.ModelLocator;
	import com.winning.bi.model.vo.MedicalCareFeeFenBuVO;
	import com.winning.bi.view.component.titlewin.LoadingProgressPopUp;
	
	import mx.collections.ArrayCollection;
	
	
	[Bindable]
	public class AnalysisModelLocator implements ModelLocator
	{		
		
		/*木偶变量*/
		private var $rr:MedicalCareFeeFenBuVO; 
		
		
		/*分析交互变量*/
		public var analysisHosAvgFeeAC:ArrayCollection=new ArrayCollection();
		public var analysisMZAvgFeeAC:ArrayCollection=new ArrayCollection();
		public var analysisHosAvgFeeSimpleAC:ArrayCollection=new ArrayCollection();
		public var analysisMZAvgFeeSimpleAC:ArrayCollection=new ArrayCollection();
		public var analysisHosAvgFeeMZAC:ArrayCollection=new ArrayCollection();
		public var analysisHosAvgFeeSimpleMZAC:ArrayCollection=new ArrayCollection();
		public var analysisPharmacyTransDis:ArrayCollection=new ArrayCollection();
		public var analysisPharmacyTransDisContent:ArrayCollection=new ArrayCollection();
		public var analysisPharmacyTransDisDetails:ArrayCollection=new ArrayCollection();
		public var analysisPharmacyTransDetailVOAC:ArrayCollection=new ArrayCollection();
		public var analysisOutPatientSpecificDiseaseAC:ArrayCollection=new ArrayCollection();
		public var analysisOutPatientSpecificDiseasePeriodAC:ArrayCollection=new ArrayCollection();
		
		public var drugManagementAC:ArrayCollection=new ArrayCollection();
		public var itemManagementAC:ArrayCollection=new ArrayCollection();
		public var medicalCareSalesAC:ArrayCollection=new ArrayCollection();
		public var medicalCareSaleCount:int=0;
		public var medicalCareSalesDetailsAC:ArrayCollection=new ArrayCollection();
		public var workRelatedInjuriesReimbursementAC:ArrayCollection=new ArrayCollection();
		
		public var medicalCareFeeCompareVOAC:ArrayCollection=new ArrayCollection();
		public var medicalCareFeeCompareVODetailsAC:ArrayCollection=new ArrayCollection();
		public var medicalCareFeeCompareVODetailsByTjrqAC:ArrayCollection=new ArrayCollection();
		public var medicalCareFeeCompareVOGroupByRylbAC:ArrayCollection=new ArrayCollection();
		public var medicalCareFeeCompareVODetailAC:ArrayCollection=new ArrayCollection();
		
		public var medicalCareFeeFenBuVOAC:ArrayCollection=new ArrayCollection();
		public var medicalCareFeeFenBuVOGridAC:ArrayCollection=new ArrayCollection();
		public var medicalCareFeeFenBuVOMZAC:ArrayCollection=new ArrayCollection();
		public var medicalCareFeeFenBuVOZYAC:ArrayCollection=new ArrayCollection();		
		public var medicalCareFeeFenBuVOZFMZAC:ArrayCollection=new ArrayCollection();
		public var medicalCareFeeFenBuVOZFZYAC:ArrayCollection=new ArrayCollection();
		public var medicalCareFeeFenBuVOYBMZAC:ArrayCollection=new ArrayCollection();
		public var medicalCareFeeFenBuVOYBZYAC:ArrayCollection=new ArrayCollection();
		//药店
		public var AnalysisWarningPharmacyAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningPharmacyTransMoneyDisAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningPharmacyTransPopulationDisAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningPharmacyTransSumDisAC:ArrayCollection=new ArrayCollection();
		//社会门诊
		public var AnalysisWarningSocialHospitalAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningSocialHospitalTransMoneyDisAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningSocialHospitalTransPopulationDisAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningSocialHospitalTransSumDisAC:ArrayCollection=new ArrayCollection();
		//二级三级医院
		public var AnalysisWarningThirdHospitalAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningThirdHospitalTransMoneyDisAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningThirdHospitalTransPopulationDisAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningThirdHospitalTransSumDisAC:ArrayCollection=new ArrayCollection();
		//二级公立医院
		public var AnalysisWarningSecondHospitalAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningSecondHospitalTransMoneyDisAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningSecondHospitalTransPopulationDisAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningSecondHospitalTransSumDisAC:ArrayCollection=new ArrayCollection();
		//民营医院
		public var AnalysisWarningPersonalHospitalAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningPersonalHospitalTransMoneyDisAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningPersonalHospitalTransPopulationDisAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningPersonalHospitalTransSumDisAC:ArrayCollection=new ArrayCollection();
		//社区中心
		public var AnalysisWarningSocialCenterAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningSocialCenterTransMoneyDisAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningSocialCenterTransPopulationDisAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningSocialCenterTransSumDisAC:ArrayCollection=new ArrayCollection();
		//企业医疗机构
		public var AnalysisWarningCorporateMedicalInstitutionAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningCorporateMedicalInstitutionTransMoneyDisAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningCorporateMedicalInstitutionTransPopulationDisAC:ArrayCollection=new ArrayCollection();
		public var AnalysisWarningCorporateMedicalInstitutionTransSumDisAC:ArrayCollection=new ArrayCollection();
		
		//qpp
		public var feePieAC:ArrayCollection=new ArrayCollection();
		public var feePieMZAC:ArrayCollection=new ArrayCollection();
		public var feePieZYAC:ArrayCollection=new ArrayCollection();
		public var feePieQTAC:ArrayCollection=new ArrayCollection();
		public var feeCol1AC:ArrayCollection=new ArrayCollection();
		public var feeCol2AC:ArrayCollection=new ArrayCollection();
		public var feeDg1AC:ArrayCollection=new ArrayCollection();
		public var feeDg2AC:ArrayCollection=new ArrayCollection();
		public var hbz1:Number=NaN;
		public var hbz2:Number=NaN;
		
		public var loadingProgressBar:LoadingProgressPopUp;
		
		
		//AnalysisWarning 
		public var analysis_warning_pharmacy_date:String=null;
		public var analysis_warning_pharmacy_orgCode:String=null;
		
		public var analysis_warning_social_hospital_date:String=null;
		public var analysis_warning_social_hospital_orgCode:String=null;
		
		public var analysis_warning_disease_ac:ArrayCollection;
		
		//数据质量
		public var AnalysisKC21DataAC:ArrayCollection=new ArrayCollection();
		public var AnalysisKC21DataDTAC:ArrayCollection=new ArrayCollection();
		public var AnalysisKC22DataAC:ArrayCollection=new ArrayCollection();
		public var AnalysisKC22DataDTAC:ArrayCollection=new ArrayCollection();
		
		public function AnalysisModelLocator()
		{
		}
		
		static private var instance:AnalysisModelLocator=null;
		static public function getInstance():AnalysisModelLocator
		{
			if(instance == null)
			{
				instance=new AnalysisModelLocator();
			}
			return instance;
		}
		
		public function clearStatisticsMedicalCareSalesProvider():void
		{
			medicalCareSalesAC=null;
			medicalCareSalesDetailsAC=null;
		}
		
		public function clearAnalysisPharmacyTransDisProvider():void
		{
			analysisPharmacyTransDis=null;
			analysisPharmacyTransDisContent=null;
			analysisPharmacyTransDisDetails=null;
			analysisPharmacyTransDetailVOAC=null;
		}
		
		public function clearAnalysisOutPatientSpecificDiseaseProvider():void
		{
			analysisOutPatientSpecificDiseaseAC=null;
			analysisOutPatientSpecificDiseasePeriodAC=null;
			
		}
		
		public function clearAnalysisMedicalCareFeeFenBuProvider():void
		{
			medicalCareFeeFenBuVOAC=null;
			medicalCareFeeFenBuVOGridAC=null;
			medicalCareFeeFenBuVOMZAC=null;
			medicalCareFeeFenBuVOZYAC=null;		
			medicalCareFeeFenBuVOZFMZAC=null;
			medicalCareFeeFenBuVOZFZYAC=null;
			medicalCareFeeFenBuVOYBMZAC=null;
			medicalCareFeeFenBuVOYBZYAC=null;
		}
		
		public function clearAnalysisMedicalCareFeeCompareProvider():void
		{
			medicalCareFeeCompareVOAC=null;
			medicalCareFeeCompareVODetailsAC=null;
			medicalCareFeeCompareVODetailAC=null;
			
		}
		
		public function clearAnalysisHosAvgFeeProvider():void
		{
			analysisHosAvgFeeAC=null;
			analysisHosAvgFeeSimpleAC=null;
			analysisHosAvgFeeMZAC=null;
			analysisHosAvgFeeSimpleMZAC=null;
			
		}
		
		public function clearDrugProjectManagementProvider():void
		{
			drugManagementAC=null;
			itemManagementAC=null;
		}
		
		public function clearStatisticsWorkRelatedInjuryProvider():void
		{
			workRelatedInjuriesReimbursementAC=null;
		}
		
		
		
		
		public function clearAnalysisFeeCategory():void
		{
			feePieAC=null;
			feePieMZAC=null;
			feePieZYAC=null;
			feeCol1AC=null;
			feeCol2AC=null;
			feeDg1AC=null;
			feeDg2AC=null;
			hbz1=NaN;
			hbz2=NaN;
		}
		
		public function clearAnalysisWarning():void
		{
			AnalysisWarningPharmacyTransMoneyDisAC =null;
			AnalysisWarningPharmacyTransPopulationDisAC =null;
			AnalysisWarningPharmacyTransSumDisAC=null;
			
			AnalysisWarningSocialHospitalTransMoneyDisAC =null;
			AnalysisWarningSocialHospitalTransPopulationDisAC =null;
			AnalysisWarningSocialHospitalTransSumDisAC=null;
			
			AnalysisWarningThirdHospitalTransMoneyDisAC=null;
			AnalysisWarningThirdHospitalTransPopulationDisAC=null;
			AnalysisWarningThirdHospitalTransSumDisAC=null;
			//二级公立医院
			AnalysisWarningSecondHospitalTransMoneyDisAC=null;
			AnalysisWarningSecondHospitalTransPopulationDisAC=null;
			AnalysisWarningSecondHospitalTransSumDisAC=null;
			//民营医院
			AnalysisWarningPersonalHospitalTransMoneyDisAC=null;
			AnalysisWarningPersonalHospitalTransPopulationDisAC=null;
			AnalysisWarningPersonalHospitalTransSumDisAC=null;
			//社区中心
			AnalysisWarningSocialCenterTransMoneyDisAC=null;
			AnalysisWarningSocialCenterTransPopulationDisAC=null;
			AnalysisWarningSocialCenterTransSumDisAC=null;
			//企业医疗机构
			AnalysisWarningCorporateMedicalInstitutionTransMoneyDisAC=null;
			AnalysisWarningCorporateMedicalInstitutionTransPopulationDisAC=null;
			AnalysisWarningCorporateMedicalInstitutionTransSumDisAC=null;
			
			analysis_warning_pharmacy_date=null;
			analysis_warning_pharmacy_orgCode=null;
			
			analysis_warning_social_hospital_date=null;
			analysis_warning_social_hospital_orgCode=null;
		}
		
		public function clearAnalysisDataQuality():void
		{
			AnalysisKC21DataAC=null;
			AnalysisKC22DataAC=null;
			AnalysisKC21DataDTAC=null;
			AnalysisKC22DataDTAC=null;
		}
		
		//事件交互控制变量
		public var sendable:Boolean=true;
	}
}