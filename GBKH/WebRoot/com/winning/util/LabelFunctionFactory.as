package com.winning.util
{
	import com.winning.bi.model.domain.Blacklist;
	import com.winning.bi.model.domain.Indicator;
	import com.winning.bi.model.domain.ItemDrug;
	import com.winning.bi.model.domain.MHeader;
	import com.winning.bi.model.domain.MMapping;
	import com.winning.bi.model.domain.MRule;
	import com.winning.hra.model.vo.MonitorVO;
	import com.winning.persistence.domain.Disease;
	import com.winning.persistence.domain.Organization;
	
	import mx.charts.HitData;
	import mx.charts.chartClasses.IAxis;
	import mx.charts.series.LineSeries;
	import mx.controls.Alert;
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.formatters.DateFormatter;
	import mx.formatters.NumberFormatter;

	[Bindable]
	public class LabelFunctionFactory
	{
		public function LabelFunctionFactory()
		{
		}

		private static var dfs:DateFormatter=new DateFormatter();
		private static var df:DateFormatter=new DateFormatter();
		private static var nf:NumberFormatter=new NumberFormatter();

		public static var dgDisease=function(item:Object):String
		{
			var disease:Disease=item as Disease;
			var s:String=null;
			if (null != disease)
			{
				s=disease.diseaseName + '[疾病]:' + disease.diseaseNum + '条';
			}
			return s;
		}
		
		public static var dgProDrugPublicInfo=function(item:Object):String
		{
			var monitorVO:MonitorVO=item as MonitorVO;
			var s:String=null;
			if (null != monitorVO)
			{
				s=monitorVO.drugName + '[问题药品]:' + monitorVO.perDrugTypeNum + '条';
			}
			return s;
		}
			
		public static var dgDadDrugPublicInfo=function(item:Object):String
		{
			var monitorVO:MonitorVO=item as MonitorVO;
			var s:String=null;
			if (null != monitorVO)
			{
				s=monitorVO.drugName + '[不良反应药品]:' + monitorVO.perDrugTypeNum + '条';
			}
			return s;
		}
		
		public static var dgDrugUnqualified=function(item:Object):String
		{
			var monitorVO:MonitorVO=item as MonitorVO;
			var s:String=null;
			if (null != monitorVO)
			{
				s=monitorVO.drugName + '[不合格药品]:' + monitorVO.perDrugTypeNum + '条';
			}
			return s;
		}
			
		public static var dgDrugPublic=function(item:Object):String
		{
			var monitorVO:MonitorVO=item as MonitorVO;
			var s:String=null;
			if (null != monitorVO)
			{
				s=monitorVO.drugName + ':' + monitorVO.perDrugTypeNum + '条';
			}
			return s;
		}
			
		public static var dgNewAddAdvert=function(item:Object):String
		{
			var monitorVO:MonitorVO=item as MonitorVO;
			var s:String=null;
			if (null != monitorVO)
			{
				s=monitorVO.drugName + ':' + monitorVO.drugManufacturer;
			}
			return s;
		}
			
		public static var dgDrugInteract=function(item:Object):String
		{
			var monitorVO:MonitorVO=item as MonitorVO;
			var s:String=null;
			if (null != monitorVO)
			{
				s=monitorVO.drugName + '[相互作用药品]:' + monitorVO.perDrugTypeNum + '条';
			}
			return s;
		}
		
		public static var dgOrganizationArea=function(item:Object):String
		{
			var organization:Organization=item as Organization;
			var s:String=null;
			if (null != organization)
			{
				s=organization.area + '[违规]:' + organization.organizationNum + '条';
			}
			return s;
		}
			
		public static var dgOrganizationName=function(item:Object):String
		{
			var organization:Organization=item as Organization;
			var s:String=null;
			if (null != organization)
			{
				s=organization.name + '[违规]:' + organization.organizationNum + '条';
			}
			return s;
		}
			
		public static var dgMonitorVO=function(item:Object):String
		{
			var monitorVO:MonitorVO=item as MonitorVO;
			var s:String=null;
			if (null != monitorVO)
			{
				s=monitorVO.ruleName + '[违规]:' + monitorVO.ruleIllegalNum + "(" + (monitorVO.ruleIllegalNum.toString() == '0' ? '0' : ((monitorVO.ruleIllegalNum / monitorVO.totalRuleIllegalNum * 100).toFixed(2) + "%")) + ")";
			}
			return s;
		}

	}
}