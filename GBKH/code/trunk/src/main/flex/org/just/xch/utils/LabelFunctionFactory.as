package org.just.xch.utils
{
	import org.just.xch.model.domain.Blacklist;
	import org.just.xch.model.domain.Indicator;
	import org.just.xch.model.domain.ItemDrug;
	import org.just.xch.model.domain.MHeader;
	import org.just.xch.model.domain.MMapping;
	import org.just.xch.model.vo.MonitorVO;
	
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

		public static var dgEnableFunc=function(item:Object, column:DataGridColumn):String
			{
				var s:String;
				switch (column.dataField)
				{
					case "enable":
						s=DpUtil.getEnableLabel(item[column.dataField]);
						break;
					case "status":
						s=DpUtil.getEnableLabel(item[column.dataField]);
						break;
					case "flag":
						s=DpUtil.getSuccessLabel(item[column.dataField]);
						break;
					case "visible":
						s=DpUtil.getYesOrNoLabel(item[column.dataField]);
						break;
					default:
						break;
				}
				return s;
			}

		public static var dgCommFunc=function(item:Object, column:DataGridColumn):String
			{
				var s:String;
				switch (column.dataField)
				{
					case "frequency":
						s=DpUtil.getFrequencyLabel(item[column.dataField]);
						break;
						break;
					default:
						break;
				}
				return s;
			}

		public static var dgDateFunc=function(item:Object, column:DataGridColumn):String
			{
				dfs.formatString="YYYY-MM-DD JJ:NN:SS";
				df.formatString="YYYY-MM-DD";
				var s:String;
				switch (column.dataField)
				{
					case "lastSyncDate":
						s=dfs.format(item[column.dataField]);
						break;
					case "startDate":
						s=dfs.format(item[column.dataField]);
						break;
					case "endDate":
						s=dfs.format(item[column.dataField]);
						break;
					case "createDate":
						s=dfs.format(item[column.dataField]);
						break;
					default:
						break;
				}
				return s;
			}

		public static var dgCodeFunc=function(item:Object, column:DataGridColumn):String
			{
				var s:String=null;
				if (item[column.dataField])
				{
					s=item[column.dataField]["code"];
				}
				return s;
			}
		public static var dgNameFunc=function(item:Object, column:DataGridColumn):String
			{
				var s:String=null;
				if (item[column.dataField])
				{
					s=item[column.dataField]["name"];
				}
				return s;
			}
		public static var dgDescFunc=function(item:Object, column:DataGridColumn):String
			{
				var s:String=null;
				if (item[column.dataField])
				{
					s=item[column.dataField]["description"];
				}
				return s;
			}

		public static var dgIndicatorFunc=function(item:Object, column:DataGridColumn):String
			{
				var s:String;
				switch (column.dataField)
				{
					case "status":
						s=Indicator.getStatusLabel(item[column.dataField]);
						break;
					default:
						break;
				}
				return s;
			}

		////////////////////////////////////////////////////////////////////////////////////////////
		//2012-08-07
		//////////////////////

		public static var dgMRecordJgmc=function(item:Object, column:DataGridColumn):String
			{
				var s:String=null;
				if (item[column.dataField])
				{
					s=item[column.dataField]["jgmc"];
				}
				return s;
			}
		public static var dgMRecordHzmc=function(item:Object, column:DataGridColumn):String
			{
				var s:String=null;
				if (item[column.dataField])
				{
					s=item[column.dataField]["hzmc"];
				}
				return s;
			}
			
		public static var dgMRecordYllb=function(item:Object, column:DataGridColumn):String
		{
			var s:String=null;
			if (item[column.dataField])
			{
				s=item[column.dataField]["yllb"];
			}
			return s;
		}
		public static var dgMRecordKsmc=function(item:Object, column:DataGridColumn):String
			{
				var s:String=null;
				if (item[column.dataField])
				{
					s=item[column.dataField]["ksmc"];
				}
				return s;
			}
		public static var dgMRecordCh=function(item:Object, column:DataGridColumn):String
		{
			var s:String=null;
			if (item[column.dataField])
			{
				s=item[column.dataField]["ch"];
			}
			return s;
		}
		public static var dgMRecordCyzdmc=function(item:Object, column:DataGridColumn):String
			{
				var s:String=null;
				if (item[column.dataField])
				{
					s=item[column.dataField]["cyzddm"]+item[column.dataField]["cyzdmc"];
				}
				return s;
			}
		public static var dgMRecordYsmc=function(item:Object, column:DataGridColumn):String
		{
			var s:String=null;
			if (item[column.dataField])
			{
				s=item[column.dataField]["ysmc"];
			}
			return s;
		}
		public static var dgMRecordZfy=function(item:Object, column:DataGridColumn):String
			{
				var s:String=null;
				if (item[column.dataField])
				{
					s=item[column.dataField]["zje"];
				}
				return s;
			}
		public static var dgMMappingZt=function(item:Object, column:DataGridColumn):String
			{
				var s:String=null;
				if (item[column.dataField])
				{
					s=MMapping.getZtLabel(item[column.dataField]);
				}
				return s;
			}
		public static var dgMRecordRyrq=function(item:Object, column:DataGridColumn):String
		{
			var s:String=null;
			if (item[column.dataField])
			{
				dfs.formatString="YYYY-MM-DD JJ:NN:SS";
				s=dfs.format(item[column.dataField]["ryrq"]);
			}
			return s;
		}
		public static var dgMRecordCyrq=function(item:Object, column:DataGridColumn):String
			{
				var s:String=null;
				if (item[column.dataField])
				{
					dfs.formatString="YYYY-MM-DD JJ:NN:SS";
					s=dfs.format(item[column.dataField]["cyrq"]);
				}
				return s;
			}

		public static var dgMRuleMC=function(item:Object, column:DataGridColumn):String
			{
				var s:String=null;
				if (item[column.dataField])
				{
					s=item[column.dataField]['mc'];
				}
				return s;
			}

		public static var dgBlackList=function(item:Object):String
			{
				var blackList:Blacklist=item as Blacklist;
				var s:String=null;
				if (blackList != null)
				{
					s=blackList.mc + '-' + blackList.dm + '-违规' + blackList.ljwg + '次';
				}
				return s;
			}

		public static var dgMonitorVO=function(item:Object):String
			{
				var monitorVO:MonitorVO=item as MonitorVO;
				var s:String=null;
				if (null != monitorVO)
				{
					s=monitorVO.mrule.mc + '[违规]:' + monitorVO.wgNum + "(" + (monitorVO.zwgNum.toString() == '0' ? '0' : ((monitorVO.wgNum / monitorVO.zwgNum * 100).toFixed(2) + "%")) + ")";
				}
				return s;
			}

		public static var yesOrNo=function(item:Object, column:DataGridColumn):String
			{
				var ss:String;
				var s:String=item[column.dataField] as String;

				if (s == '0')
				{

					ss='否';
				}
				if (s == '1')
				{
					ss='是';
				}
				return ss;

			}


		public static var jkdx=function	(item:Object, column:DataGridColumn):String
		{
			var s:String;
			switch(item[column.dataField] as int){
				case Constant.DX_1:
					s='参保人';
					break;
				case Constant.DX_2:
					s='医疗机构';
					break;
				case Constant.DX_3:
					s='定点药房';
					break;
				case Constant.DX_4:
					s='服务提供者';
					break;
			}
			return s;
		}	
			
		public static var fullTimeLabelFunction=function(item:Object, column:DataGridColumn):String
		{
			var s:String=null;
			if (item[column.dataField])
			{
				dfs.formatString="YYYY-MM-DD JJ:NN:SS";
				s=dfs.format(item[column.dataField]);
			}
			return s;
		}	
			
		public static var headerLabelHzmc=function(item:Object, column:DataGridColumn):String
		{
			var s:String=null;
			if(item[column.dataField])
			{
				s=item[column.dataField]['hzmc'];
			}	
			return s;
		}	
			
		public static var headerLabelJgmc=function(item:Object, column:DataGridColumn):String
		{
			var s:String=null;
			if(item[column.dataField])
			{
				s=item[column.dataField]['jgmc'];
			}	
			return s;
		}		
			
		public static var headerLabelId=function(item:Object, column:DataGridColumn):String
		{
			var s:String=null;
			if(item[column.dataField])
			{
				s=item[column.dataField]['id'];
			}	
			return s;
		}		
			
		public static var headerLabelRq=function(item:Object, column:DataGridColumn):String
		{
			var s:String=null;
			if(item[column.dataField])
			{
				s=item[column.dataField]['rq'];
			}	
			return s;
		}	
			
		public static var headerLabelSsly=function(item:Object, column:DataGridColumn):String
		{
			var s:String=null;
			if(item[column.dataField])
			{
				s=item[column.dataField]['ssly'];
			}	
			return s;
		}		
			
		
			
		public static var headerLabelSszt=function(item:Object, column:DataGridColumn):String
		{
			var s:String=null;
			if(item[column.dataField])
			{
			   switch(item[column.dataField]['sszt']){
				   case  MHeader.SSZT_0:
					   s = '待确认';
					   break;
				   case  MHeader.SSZT_1:
					   s = '已确认';
					   break;
				   case  MHeader.SSZT_2:
					   s = '申诉中';
					   break;
				   case  MHeader.SSZT_3:
					   s = '申诉成功';
					   break;
				   case  MHeader.SSZT_4:
					   s = '申诉失败';
					   break;
				   default:
					   break;
			   }
			}	
			return s;
		}		
			
			
	}
}