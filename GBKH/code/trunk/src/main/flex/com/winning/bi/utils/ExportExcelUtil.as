package com.winning.bi.utils
{
	import com.as3xls.xls.Cell;
	import com.as3xls.xls.ExcelFile;
	import com.as3xls.xls.Sheet;
	import com.winning.bi.model.domain.ExeItem;
	import com.winning.bi.view.component.AdvancedDataGrid.AdvancedDataGrid;
	import com.winning.bi.view.component.AdvancedDataGrid.SubClasses.AdvancedDataGridColumn;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;
	
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.controls.DataGrid;
	import mx.controls.dataGridClasses.DataGridColumn;

	public class ExportExcelUtil
	{
		public static function exportToExcelByDg(dg:DataGrid, xlsName:String="exportExcel"):FileReference
		{
			var _sheet:Sheet=new Sheet(); //Excel选项卡
			var _fields:Array=[]; //需要呈现的字段数组        
			var iList:IList=dg.dataProvider as IList; //DataGrid数据源
			if(iList!=null)
			{
			var rowCount:int=iList.length; //有多少行数据
			var columns:Array=dg.columns; //DataGrid有多少列
			_sheet.resize(rowCount + 1, dg.columnCount); //设置当前选项卡 有多少行多少列
			//循环所有列
			for (var i:uint=0; i < columns.length; i++)
			{
				var dgc:DataGridColumn=columns[i];
				_sheet.setCell(0, i, dgc.headerText); //设置单元格 参数:1、行号；2、列号；3、单元格的值
				_fields.push(dgc); //保存字段
			}

			//循环所有数据
			for (var r:int=0; r < rowCount; r++)
			{
				var record:Object=iList.getItemAt(r);
				//把数据写入某行某列
				for (var c:uint=0; c < _fields.length; c++)
				{
					if (_fields[c].dataField == null)
					{
						_sheet.setCell(r + 1, c, r + 1);
					}
					else
					{
						_sheet.setCell(r + 1, c, record[_fields[c].dataField]); //设置单元格 参数:1、行号；2、列号；3、单元格的值
					}
				}
			}

			var xls:ExcelFile=new ExcelFile();
			xls.sheets.addItem(_sheet); //把选项卡写入Excel文件中
			var bytes:ByteArray=xls.saveToByteArray();
			var fr:FileReference=new FileReference(); //保存对话框
			fr.addEventListener(Event.COMPLETE, downLoadCompleteHandle);
			fr.save(bytes, xlsName + ".xls");
			return fr;
			}
			return null;
		}
		
		
		public static function exportObjectToExcelByDg(dg:DataGrid, xlsName:String="exportExcel"):FileReference
		{
			var _sheet:Sheet=new Sheet(); //Excel选项卡
			var _fields:Array=[]; //需要呈现的字段数组        
			var iList:IList=dg.dataProvider as IList; //DataGrid数据源
			var rowCount:int=iList.length; //有多少行数据
			var columns:Array=dg.columns; //DataGrid有多少列
			_sheet.resize(rowCount + 1, dg.columnCount); //设置当前选项卡 有多少行多少列
			//循环所有列
			for (var i:uint=0; i < columns.length; i++)
			{
				var dgc:DataGridColumn=columns[i];
				_sheet.setCell(0, i, dgc.headerText); //设置单元格 参数:1、行号；2、列号；3、单元格的值
				_fields.push(dgc); //保存字段
			}
			
			//循环所有数据
			for (var r:int=0; r < rowCount; r++)
			{
				var record:Object=iList.getItemAt(r);
				//把数据写入某行某列
				for (var c:uint=0; c < _fields.length; c++)
				{
					if (_fields[c].dataField == null)
					{
						_sheet.setCell(r + 1, c, r + 1);
					}
					else
					{
						if((dg.columns[c] as DataGridColumn).labelFunction)
						{
							var str=(dg.columns[c] as DataGridColumn).labelFunction.call(null,record,dg.columns[c] as DataGridColumn);
							_sheet.setCell(r + 1, c, str); //设置单元格 参数:1、行号；2、列号；3、单元格的值
						}
						else
						{
							_sheet.setCell(r + 1, c, record[_fields[c].dataField]); //设置单元格 参数:1、行号；2、列号；3、单元格的值
						}						
					}
				}
			}
			
			var xls:ExcelFile=new ExcelFile();
			xls.sheets.addItem(_sheet); //把选项卡写入Excel文件中
			var bytes:ByteArray=xls.saveToByteArray();
			var fr:FileReference=new FileReference(); //保存对话框
			fr.addEventListener(Event.COMPLETE, downLoadCompleteHandle);
			fr.save(bytes, xlsName + ".xls");
			return fr;
		}

		private static function downLoadCompleteHandle(event:Event):void
		{
			Alert.okLabel="确认";
			Alert.show("导出成功!", "提示");
		}
		
		
		public static function exportExamToExcel(adg:AdvancedDataGrid,rootItem:ExeItem,xlsName:String):FileReference
		{
			var _sheet:Sheet=new Sheet(); //Excel选项卡
			var _fields:Array=[]; //需要呈现的字段数组        
			var iList:IList=adg.dataProvider as IList; //DataGrid数据源
			var rowCount:int=iList.length; //有多少行数据
			var columns:Array=adg.columns; //DataGrid有多少列
			var titleNum:int=4;//标题行
			_sheet.resize(rowCount + titleNum, adg.columnCount); //设置当前选项卡 有多少行多少列
			//设置标题行
			_sheet.setCell(0,columns.length/3,rootItem.item.name);
			_sheet.setCell(1,columns.length/3,"被考核人："+rootItem.beAccessedUser.realName);
			_sheet.setCell(1,columns.length/3+1,"考核年份："+rootItem.typeValue);
			_sheet.setCell(1,columns.length/3+2,"得分："+rootItem.scoreResult.toFixed(2));
			
			//循环所有列
			for (var i:uint=0; i < columns.length; i++)
			{
				var dgc:AdvancedDataGridColumn=columns[i];
				_sheet.setCell(2, i, dgc.headerText); //设置单元格 参数:1、行号；2、列号；3、单元格的值
				_fields.push(dgc); //保存字段
			}
			
			//循环所有数据
			for (var r:int=0; r < rowCount; r++)
			{
				var record:Object=iList.getItemAt(r);
				var lastRecord:Object=null;
				if(r>0)
				{
				  lastRecord=iList.getItemAt(r-1);
				}
				//把数据写入某行某列
				for (var c:uint=0; c < _fields.length; c++)
				{
					if(lastRecord!=null&&(record[_fields[c].dataField]==lastRecord[_fields[c].dataField]))
					{
						//重复指标为空
						_sheet.setCell(r + 3, c,""); //设置单元格 参数:1、行号；2、列号；3、单元格的值
						continue;
					}
					
					
					if (_fields[c].dataField == null)
					{
						_sheet.setCell(r +3, c, r + 1);
					}
					else
					{
						if((adg.columns[c] as AdvancedDataGridColumn).labelFunction)
						{
							var str=(adg.columns[c] as AdvancedDataGridColumn).labelFunction.call(null,record,adg.columns[c] as AdvancedDataGridColumn);
							_sheet.setCell(r + 3, c, str); //设置单元格 参数:1、行号；2、列号；3、单元格的值
						}
						else
						{
							_sheet.setCell(r + 3, c, record[_fields[c].dataField]); //设置单元格 参数:1、行号；2、列号；3、单元格的值
						}						
					}
				}
			}
			
			var xls:ExcelFile=new ExcelFile();
			xls.sheets.addItem(_sheet); //把选项卡写入Excel文件中
			var bytes:ByteArray=xls.saveToByteArray();
			var fr:FileReference=new FileReference(); //保存对话框
			fr.addEventListener(Event.COMPLETE, downLoadCompleteHandle);
			fr.save(bytes, xlsName + ".xls");
			return fr;
		}
		
	}
}