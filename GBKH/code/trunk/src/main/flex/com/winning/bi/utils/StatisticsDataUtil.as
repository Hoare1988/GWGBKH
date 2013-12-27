package com.winning.bi.utils
{
	import mx.charts.series.ColumnSeries;
	import mx.charts.series.LineSeries;
	import mx.collections.ArrayCollection;
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.formatters.DateFormatter;
	import mx.graphics.GradientEntry;
	import mx.graphics.RadialGradient;
	import mx.graphics.Stroke;

	import com.winning.bi.model.vo.StatisticsData;


	public class StatisticsDataUtil
	{
		public function StatisticsDataUtil()
		{
			df.formatString="YYYY-MM-DD";
		}

		private static var df:DateFormatter=new DateFormatter();


		/* 构造比较数据 */
		public static function displayRecordInChart(sd:StatisticsData, qswz:int):ArrayCollection
		{
			var dataAC:ArrayCollection=new ArrayCollection();
			//add records object to chart source Array Collection
			for (var i:int=qswz; i < sd.titles.length; i++)
			{
				var chartObj:Object=new Object();
				chartObj['date']=sd.titles[i];
				dataAC.addItem(chartObj);
			}

			//set properties to chart obj
			//data 0-code 1-name...
			var len:int=sd.datas.length;
			for (var i:int=qswz; i < len; i++)
			{
				var chartObj:Object=dataAC.getItemAt(i - qswz);
				var serData:ArrayCollection=sd.datas.getItemAt(i) as ArrayCollection;
				for (var j:int=0; j < serData.length; j++)
				{
					var serStr:String='ser' + j.toString();
					chartObj[serStr]=serData.getItemAt(j);
				}
			}
			dataAC.refresh();
			return dataAC;
		}

		/* 构造Linechart线 */
		public static function addLineSeries(sd:StatisticsData, dnwz:int):Array
		{
			//set chart series
			var array:Array=[];
			var len:int=sd.datas.length;
			var displayNamesAC:ArrayCollection=sd.datas.getItemAt(dnwz) as ArrayCollection;
			for (var i:int=0; i < sd.datas.getItemAt(0).length; ++i)
			{
				var serStr:String='ser' + i.toString();
				var displayName:String=displayNamesAC.getItemAt(i) as String;
				var line:LineSeries=new LineSeries();
				line.yField=serStr;
				line.displayName=displayName;
				//line.name=displayName;
				//line.setStyle("form", "curve");
				//line.setStyle("itemRenderer",ir);
				array.push(line);
			}
			return array;
		}

		/* 构造Columnchart */
		public static function addColumnSeries(sd:StatisticsData, dnwz:int):Array
		{
			//set chart series
			var array:Array=[];
			var len:int=sd.datas.length;
			var displayNamesAC:ArrayCollection=sd.datas.getItemAt(dnwz) as ArrayCollection;
			for (var i:int=0; i < sd.datas.getItemAt(0).length; ++i)
			{
				var serStr:String='ser' + i.toString();
				var displayName:String=displayNamesAC.getItemAt(i) as String;
				var column:ColumnSeries=new ColumnSeries();
				column.yField=serStr;
				column.displayName=displayName;
				if (i < (Constant.COLORS.length))
				{
					var rd:RadialGradient=new RadialGradient();
					rd.entries=[new GradientEntry(0xffffff, 0, 1), new GradientEntry(Constant.COLORS[i], 1, 1)];
					column.setStyle("fill", rd);
					column.setStyle("stroke", new Stroke(Constant.COLORS[i], 1, 1));
				}
				array.push(column);
			}
			return array;
		}


		public static function generateAC(_statisticsData:StatisticsData):ArrayCollection
		{
			var returnBean:ArrayCollection=new ArrayCollection();
			for (var i:int=0; i < _statisticsData.datas.getItemAt(0).length; ++i)
			{
				returnBean.addItem(new Object());
			}
			for (var i:int=1; i < _statisticsData.datas.length; ++i)
			{
				var colDateFiledIndexString='col' + (i - 1).toString();
				var data:Object=new Object();
				for (var j:int=0; j < _statisticsData.datas.getItemAt(i).length; ++j)
				{
					var value:Object=(_statisticsData.datas.getItemAt(i) as ArrayCollection).getItemAt(j);
					if (value is Number)
					{
						if (isNaN(Number(value)))
						{
							value=0;
						}
					}
					returnBean.getItemAt(j)[colDateFiledIndexString]=value;
				}
			}
			for (var j:int=0; j < _statisticsData.datas.getItemAt(0).length; j++)
			{
				returnBean.getItemAt(j)['code']=(_statisticsData.datas.getItemAt(0) as ArrayCollection).getItemAt(j);
			}
			return returnBean;
		}


		/**
		   public static function generateDdKssAC(_statisticsData:StatisticsData):ArrayCollection{
		   var returnBean:ArrayCollection = new ArrayCollection();
		   for(var i:int=0;i<_statisticsData.datas.getItemAt(0).length;++i){
		   returnBean.addItem(new Object());
		   }
		   for (var i:int=1;i< _statisticsData.datas.length ;++i){
		   var colDateFiledIndexString = 'col' + (i-1).toString();
		   var data:Object = new Object();
		   for(var j:int=0;j<_statisticsData.datas.getItemAt(i).length;++j){
		   var value:Object = (_statisticsData.datas.getItemAt(i) as ArrayCollection).getItemAt(j);
		   if(value is Number){
		   if(isNaN(Number(value))){
		   value = 0;
		   }
		   }
		   returnBean.getItemAt(j)[colDateFiledIndexString] = value;
		   }
		   }
		   for(var j:int=0;j<_statisticsData.datas.getItemAt(0).length;j++){
		   returnBean.getItemAt(j)['dm'] =  (_statisticsData.datas.getItemAt(0) as ArrayCollection).getItemAt(j);
		   }
		   return returnBean;
		 }*/

		public static function addDataGridColumn(_statisticsData:StatisticsData):Array
		{
			var columns:Array=[];
			for (var i:int=1; i < _statisticsData.titles.length; i++)
			{
				var colDateFiledIndexString:String='col' + (i - 1).toString();
				var dgc:DataGridColumn=new DataGridColumn(colDateFiledIndexString);
				dgc.headerText=_statisticsData.titles.getItemAt(i).toString();
				columns.push(dgc);
			}
			return columns;
		}

		//合并StatisticsData
		public static function unionSd(sdOld:StatisticsData, sdNew:StatisticsData):StatisticsData
		{
			if (sdOld == null)
			{
				return sdNew;
			}
			else
			{
				for (var i:int=0; i < sdOld.datas.length; i++)
				{
					for (var j:int=0; j < sdNew.datas.getItemAt(0).length; j++)
					{
						(sdOld.datas.getItemAt(i) as ArrayCollection).addItem((sdNew.datas.getItemAt(i) as ArrayCollection).getItemAt(j));
					}
				}
				return sdOld;
			}
		}


		/* 将日期转化为定制格式 */
		public static function parseDateToString(date:Date):String
		{
			df.formatString="YYYY-MM-DD";
			return df.format(date);
		}

	}
}