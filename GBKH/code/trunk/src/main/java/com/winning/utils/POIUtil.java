package com.winning.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class POIUtil {
	private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private static final String VALUE_TRUE="Yes";
	private static final String VALUE_FALSE="No";
	private final static String SBC_SPACE="　";
	
	//HSSFCellStyle Excle样式
	public HSSFCellStyle cellStyle=null;
	
	/**
	 * <ul>
	 * <li>Description:[根据文件名读取excel文件]</li>
	 * <ul>
	 * 
	 * @param fileName 文件名
	 * @return
	 * @throws Exception
	 */
	public static Map<String, List<List<String>>> read(String fileName) {
		Map<String, List<List<String>>> dataMap = null;
		/** */
		/** 检查文件名是否为空或者是否是Excel格式的文件 */
		if (fileName == null || !fileName.matches("^.+\\.(?i)((xls)|(xlsx))$")) {
			return dataMap;
		}

		boolean isExcel2003 = true;
		/** */
		/** 对文件的合法性进行验证 */
		if (fileName.matches("^.+\\.(?i)(xlsx)$")) {
			isExcel2003 = false;
		}

		/** */
		/** 检查文件是否存在 */
		File file = new File(fileName);
		if (file == null || !file.exists()) {
			return dataMap;
		}

		try {
			/** */
			/** 调用本类提供的根据流读取的方法 */
			dataMap = read(new FileInputStream(file), isExcel2003);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		/** */
		/** 返回最后读取的结果 */
		return dataMap;
	}
	
	/**
	 * 根据文件名和输入流读取excel文件
	 * @param fileName 文件名
	 * @param inputStream 输入流
	 * @return 返回最后读取的结果
	 */
	public static Map<String, List<List<String>>> read(String fileName,InputStream inputStream) {
		Map<String, List<List<String>>> dataMap = null;
		/** */
		/** 检查文件名是否为空或者是否是Excel格式的文件 */
		if (fileName == null || !fileName.matches("^.+\\.(?i)((xls)|(xlsx))$")) {
			return dataMap;
		}

		boolean isExcel2003 = true;
		/** */
		/** 对文件的合法性进行验证 */
		if (fileName.matches("^.+\\.(?i)(xlsx)$")) {
			isExcel2003 = false;
		}
		
		try {
			/** */
			/** 调用本类提供的根据流读取的方法 */
			dataMap = read(inputStream, isExcel2003);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		/** */
		/** 返回最后读取的结果 */
		return dataMap;
	}

	/** */
	/**
	 * <ul>
	 * <li>Description:[根据流读取Excel文件]</li>
	 * <ul>
	 * 
	 * @param inputStream 输入流
	 * @param isExcel2003 是否是Excel2003
	 * @return 返回最后读取的结果
	 * @throws IOException 输入输出异常
	 */
	private static Map<String, List<List<String>>> read(InputStream inputStream,
			boolean isExcel2003) throws IOException {
		Map<String, List<List<String>>> dataMap = null;
		/** */
		/** 根据版本选择创建Workbook的方式 */
		Workbook wb = isExcel2003 ? new HSSFWorkbook(inputStream)
				: new XSSFWorkbook(inputStream);
		dataMap = read(wb);
		return dataMap;
	}

	/** */
	/**
	 * <ul>
	 * <li>Description:[读取工作簿]</li>
	 * <ul>
	 * 
	 * @param wb 工作簿
	 * @return 返回最后读取的结果
	 */
	private static Map<String, List<List<String>>> read(Workbook wb) {
		Map<String, List<List<String>>> dataMap = new HashMap<String, List<List<String>>>();

		int sheetNum = wb.getNumberOfSheets();
		for (int s = 0; s < sheetNum; s++) {
			Sheet sheet = wb.getSheetAt(s);
			List<List<String>> dataLst = readSheet(sheet);
			dataMap.put(sheet.getSheetName(), dataLst);
		}
		return dataMap;
	}
	/**
	 * <ul>
	 * <li>Description:[根据文件名读取excel文件]</li>
	 * <ul>
	 * 
	 * @param fileName 文件名
	 * @param sheetNum 工作表编号
	 * @return 返回最后读取的结果 
	 */
	public static List<List<String>> read(String fileName, int sheetNum) {
		List<List<String>> list = null;
		/** */
		/** 检查文件名是否为空或者是否是Excel格式的文件 */
		if (fileName == null || !fileName.matches("^.+\\.(?i)((xls)|(xlsx))$")) {
			return list;
		}

		boolean isExcel2003 = true;
		/** */
		/** 对文件的合法性进行验证 */
		if (fileName.matches("^.+\\.(?i)(xlsx)$")) {
			isExcel2003 = false;
		}

		/** */
		/** 检查文件是否存在 */
		File file = new File(fileName);
		if (file == null || !file.exists()) {
			return list;
		}

		try {
			InputStream inputStream = new FileInputStream(file);
			Workbook wb = isExcel2003 ? new HSSFWorkbook(inputStream): new XSSFWorkbook(inputStream);
			list = readWorkbook(wb,sheetNum);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		/** */
		/** 返回最后读取的结果 */
		return list;
	}
	
	/** */
	/**
	 * <ul>
	 * <li>Description:[读取工作簿]</li>
	 * <ul>
	 * 
	 * @param wb 工作簿
	 * @param sheetNum 工作表编号
	 * @return 返回最后读取的结果
	 */
	private static List<List<String>> readWorkbook(Workbook wb, int sheetNum) {
		Sheet sheet = wb.getSheetAt(sheetNum);
		List<List<String>> dataLst = readSheet(sheet);
		return dataLst;
	}
	
	/** */
	/**
	 * <ul>
	 * <li>Description:[读取表]</li>
	 * <ul>
	 * 
	 * @param sheet 表
	 * @return 返回最后读取的结果
	 */
	public static List<List<String>> readSheet(Sheet sheet) {
		List<List<String>> dataLst = new ArrayList<List<String>>();
		Iterator<Row> rows = sheet.rowIterator();
		/** */
		/** 循环Excel的行 */
		while (rows.hasNext()) {
			Row row = rows.next();
			if (row == null) {
				continue;
			}
			List<String> rowLst = new ArrayList<String>();
			short last=row.getLastCellNum();
			for(short i=0;i<last;i++)
			{
				Cell cell = row.getCell(i);
				String cellValue=readCell(cell);
				rowLst.add(cellValue);
			}
			dataLst.add(rowLst);
		}
		return dataLst;
	
	}
	
	/**
	 * 读取单元格
	 * @param cell 单元格
	 * @return 返回最后读取的结果
	 */
	private static String readCell(Cell cell)
	{
		String cellValue = "";
		if(cell==null)
		{
			return cellValue;
		}
		/** */
		/** 处理数字型的,自动去零 */
		if (Cell.CELL_TYPE_NUMERIC == cell.getCellType()) {
			/** */
			/** 在excel里,日期也是数字,在此要进行判断 */
			if (HSSFDateUtil.isCellDateFormatted(cell)) {
				cellValue = DateHelper.formatDateToString(
						cell.getDateCellValue(),
						Constants.DATE_PATTERN_TWO);
			} else {
				cellValue = getRightStr(cell.getNumericCellValue()
						+ "");
			}
		}
		/** */
		/** 处理字符串型 */
		else if (Cell.CELL_TYPE_STRING == cell.getCellType()) {
			cellValue = cell.getStringCellValue().trim();
			cellValue=cellValue.replaceAll(SBC_SPACE, "");
		}
		/** */
		/** 处理布尔型 */
		else if (Cell.CELL_TYPE_BOOLEAN == cell.getCellType()) {
			cellValue = cell.getBooleanCellValue() + "";
		}
		/** */
		/** 其它的,非以上几种数据类型 */
		else {
			cellValue = cell.toString() + "";
		}
		return cellValue;
	}
	/** */
	/**
	 * <ul>
	 * <li>Description:[正确地处理整数后自动加零的情况]</li>
	 * <ul>
	 * 
	 * @param sNum 整数
	 * @return 返回处理后的整数
	 */
	private static String getRightStr(String sNum) {
		DecimalFormat decimalFormat = new DecimalFormat("#.000000");
		String resultStr = decimalFormat.format(new Double(sNum));
		if (resultStr.matches("^[-+]?\\d+\\.[0]+$")) {
			resultStr = resultStr.substring(0, resultStr.indexOf("."));
		}
		return resultStr;
	}
	
	/**
	 * 创建Excel文件
	 * @param fileName 文件名
	 * @param spreadsheetBeanList 电子表格程序
	 */
	public void createExcelFile(String fileName,List<SpreadsheetBean> spreadsheetBeanList)
	{
		HSSFWorkbook workbook = new HSSFWorkbook();
		cellStyle = workbook.createCellStyle(); 
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中  
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中 
		insertToHSSFWorkbook(workbook,spreadsheetBeanList);
		saveExcelFile(fileName,workbook);
	}

	/**
	 * 创建Excel文件
	 * @param fileName 文件名
	 * @param workbook 工作簿样式
	 * @param spreadsheetBeanList 电子表格程序
	 */
	public void createExcelFile(String fileName,HSSFWorkbook workbook,List<SpreadsheetBean> spreadsheetBeanList)
	{
		insertToHSSFWorkbook(workbook,spreadsheetBeanList);
		saveExcelFile(fileName,workbook);
	}

	/**
	 * 保存Excel文件
	 * @param fileName 文件名
	 * @param workbook 工作簿
	 */
	private static void saveExcelFile(String fileName,Workbook workbook)
	{
		try {
			FileOutputStream out = new FileOutputStream(new File(fileName));
			workbook.write(out);
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 在电子簿中插入数据
	 * @param workbook 电子版
	 * @param spreadsheetBeanList 电子表格程序
	 */
	public void insertToHSSFWorkbook(HSSFWorkbook workbook, List<SpreadsheetBean> spreadsheetBeanList)
	{
		 for(SpreadsheetBean spreadsheetBean : spreadsheetBeanList)
		 {
			 HSSFSheet sheet = workbook.createSheet(spreadsheetBean.getSheetName());
			 insertToSheet(sheet,spreadsheetBean.getTitles(),spreadsheetBean.getDataList());
		 }
	}
	
	/**
	 * 插入工作表
	 * @param sheet 工作表
	 * @param titles 行标题
	 * @param dataList 数据
	 */
	public void insertToSheet(HSSFSheet sheet,String[] titles,List<Object[]> dataList)
	{
		int colLen=titles.length;
		HSSFRow titleRow = sheet.createRow(0);
		for(int colIndex=0;colIndex<colLen;colIndex++)
		{
			HSSFCell cell = titleRow.createCell(colIndex);
			if(cellStyle!=null)
			{
				cell.setCellStyle(cellStyle);
			}
			insertToCell(cell,titles[colIndex]);
		}
		int rowIndex=1;
		for(Object[] rowData : dataList)
		{
			HSSFRow row = sheet.createRow(rowIndex);
			for(int colIndex=0;colIndex<rowData.length;colIndex++)
			{
				HSSFCell cell = row.createCell(colIndex);
				if(cellStyle!=null)
				{
					cell.setCellStyle(cellStyle);
				}
				insertToCell(cell,rowData[colIndex]);
			}
			rowIndex++;
		}
	}
	
	/**
	 * 插入单元格
	 * @param cell 单元格
	 * @param data 数据
	 */
	public static void insertToCell(Cell cell,Object data)
	{
		 if(data!=null){
             if(data instanceof String){
                 cell.setCellValue(new HSSFRichTextString(data.toString ()));
             }else if(data instanceof Integer){
                 cell.setCellValue(((Integer) data).intValue ());
             }else if(data instanceof Double){
                 cell.setCellValue(((Double) data).doubleValue ());
             }else if(data instanceof Float){
                 cell.setCellValue(((Float) data).floatValue ());
             }else if(data instanceof Date){
                 cell.setCellValue (sdf.format((Date)data));
             }else if(data instanceof Boolean){
                 cell.setCellValue (((Boolean)data)?VALUE_TRUE:VALUE_FALSE);
             }else{
                 cell.setCellValue(new HSSFRichTextString(data.toString ()));
             }
         }
	}
	
	/**
	 * 更新Excel文件
	 * @param fileName 文件名
	 * @param sheetNum 工作表编号
	 * @param dataList 数据
	 */
	public static void updateExcelFile(String fileName, int sheetNum, List<Map<Integer,Object>> dataList) {
		/** */
		/** 检查文件名是否为空或者是否是Excel格式的文件 */
		if (fileName == null || !fileName.matches("^.+\\.(?i)((xls)|(xlsx))$")) {
			return ;
		}

		boolean isExcel2003 = true;
		/** */
		/** 对文件的合法性进行验证 */
		if (fileName.matches("^.+\\.(?i)(xlsx)$")) {
			isExcel2003 = false;
		}

		/** */
		/** 检查文件是否存在 */
		File file = new File(fileName);
		if (file == null || !file.exists()) {
			return ;
		}

		try {
			InputStream inputStream = new FileInputStream(file);
			Workbook wb = isExcel2003 ? new HSSFWorkbook(inputStream): new XSSFWorkbook(inputStream);
			Sheet sheet = wb.getSheetAt(sheetNum);
			updateSheet(sheet,dataList);
			saveExcelFile(fileName,wb);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
	
	/**
	 * 更新工作表
	 * @param sheet 工作表
	 * @param dataList 数据
	 */
	public static void updateSheet(Sheet sheet,List<Map<Integer,Object>> dataList)
	{
		for(int i=0;i<dataList.size();i++)
		{
			Map<Integer,Object> map = dataList.get(i);
			if(map!=null)
			{
				Row row = sheet.getRow(i);
				for(Integer colIndex : map.keySet())
				{
					Cell cell = row.getCell(colIndex);
					if(cell==null)
					{
						cell = row.createCell(colIndex);
					}
					insertToCell(cell,map.get(colIndex));
				}
			}
			
		}
	}
	/**
	 * <ul>
	 * <li>Description:[根据文件名读取excel文件]</li>
	 * <ul>
	 * 
	 * @param fileName 文件名
	 * @return 返回最后读取的结果
	 * @throws Exception
	 */
	public static Workbook findWorkbook(String fileName) {
		Workbook wb = null;
		/** */
		/** 检查文件名是否为空或者是否是Excel格式的文件 */
		if (fileName == null || !fileName.matches("^.+\\.(?i)((xls)|(xlsx))$")) {
			return null;
		}

		boolean isExcel2003 = true;
		/** */
		/** 对文件的合法性进行验证 */
		if (fileName.matches("^.+\\.(?i)(xlsx)$")) {
			isExcel2003 = false;
		}

		/** */
		/** 检查文件是否存在 */
		File file = new File(fileName);
		if (file == null || !file.exists()) {
			return null;
		}

		try {
			InputStream inputStream = new FileInputStream(file);
			wb = isExcel2003 ? new HSSFWorkbook(inputStream): new XSSFWorkbook(inputStream);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		/** */
		/** 返回最后读取的结果 */
		return wb;
	}
}
