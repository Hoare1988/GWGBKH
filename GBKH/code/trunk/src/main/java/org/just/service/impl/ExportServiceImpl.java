package org.just.service.impl;

import java.io.File;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.just.service.intf.IExportService;
import org.just.utils.Constants;
import org.just.utils.NewwinningUtil;


public class ExportServiceImpl implements IExportService
{
	@Override
	public boolean exportXls(List<Object> dataList, String[] headers,
			String fileName)
	{
		boolean remainer = false;
		if (dataList == null || dataList.isEmpty() || headers == null
				|| headers.length == Constants.ZERO
				|| !NewwinningUtil.isNotNull(fileName))
		{
			return remainer;
		}

		OutputStream out;
		try
		{
			File file = new File(Constants.WEBAPP_REAL_PATH + "\\xls\\");
			if (!file.exists())
			{
				file.mkdirs();
			}
			out = new FileOutputStream(Constants.WEBAPP_REAL_PATH + "\\xls\\"
					+ fileName + ".xls");
			remainer = exportXls("病患病症", headers, dataList, out);
			if (out != null)
			{
				out.close();
				remainer = true;
			}
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
			return remainer;
		}
		catch (IOException e)
		{
			e.printStackTrace();
			return remainer;
		}
		return remainer;
	}

	public boolean exportXls(String title, String[] headers, List<Object> data,
			OutputStream out)
	{
		boolean remainer = false;
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet(title);
		sheet.setDefaultColumnWidth(15);

		// create header row
		HSSFRow row = sheet.createRow(0);
		HSSFCellStyle headerStyle = workbook.createCellStyle();
		headerStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		headerStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
		createHeader(row, headerStyle, headers);

		// create data body
		HSSFCellStyle bodyStyle = workbook.createCellStyle();
		bodyStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		bodyStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
		bodyStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
		bodyStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		bodyStyle.setAlignment(HSSFCellStyle.ALIGN_RIGHT);// 居右对齐
		bodyStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_TOP); // 顶部对齐
		bodyStyle.setWrapText(true);
		HSSFFont font = workbook.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setFontName("宋体");
		font.setFontHeightInPoints((short) 11);
		bodyStyle.setFont(font);
		Iterator<Object> it = data.iterator();
		int index = 0;
		while (it.hasNext())
		{
			index++;
			row = sheet.createRow(index);
			Object t = (Object) it.next();
			Field[] fields = t.getClass().getDeclaredFields();
			for (int i = 0; i < fields.length; i++)
			{
				HSSFCell cell = row.createCell(i);
				cell.setCellStyle(bodyStyle);
				Field field = fields[i];
				String fieldName = field.getName();
				if (!fieldName.equals("logger")
						&& !fieldName.equals("copyright")
						&& !fieldName.equals("SCC_BRANCH")
						&& !fieldName.equals("SCC_LAST_MODIFICATION_DATE")
						&& !fieldName.equals("SCC_LAST_MODIFIER_NAME")
						&& !fieldName.equals("SCC_REVISION"))
				{
					String getMethodName = "get"
							+ fieldName.substring(0, 1).toUpperCase()
							+ fieldName.substring(1);
					try
					{
						Class tCls = t.getClass();
						Method getMethod = tCls.getMethod(getMethodName,
								new Class[] {});
						Object value = getMethod.invoke(t, new Object[] {});
						String textValue = getTextValue(value);
						if (textValue != null)
						{
							Pattern p = Pattern.compile("^\\d+(\\.\\d+)?$");
							Matcher matcher = p.matcher(textValue);
							if (matcher.matches())
							{
								cell.setCellValue(Double.parseDouble(textValue));
							}
							else if (textValue.equals("NaN"))
							{
								row.removeCell(cell);
							}
							else
							{
								HSSFRichTextString richString = new HSSFRichTextString(
										textValue);
								cell.setCellValue(richString);
							}
						}
					}
					catch (SecurityException e)
					{
						e.printStackTrace();
					}
					catch (NoSuchMethodException e)
					{
						e.printStackTrace();
					}
					catch (IllegalArgumentException e)
					{
						e.printStackTrace();
					}
					catch (IllegalAccessException e)
					{
						e.printStackTrace();
					}
					catch (InvocationTargetException e)
					{
						e.printStackTrace();
					}
					finally
					{
						remainer = true;
					}
				}
			}
		}
		// freeze header
		sheet.createFreezePane(0, 1);
		// unite region
		// addMergedRegion (sheet, unite);

		try
		{
			workbook.write(out);
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		return remainer;
	}

	private void createHeader(HSSFRow row, HSSFCellStyle style, String[] headers)
	{
		for (int i = 0; i < headers.length; i++)
		{
			HSSFCell cell = row.createCell(i);
			HSSFRichTextString text = new HSSFRichTextString(headers[i]);
			cell.setCellStyle(style);
			cell.setCellValue(text);
		}
	}

	private String getTextValue(Object value)
	{

		if (value == null)
		{
			return null;
		}

		String textValue = null;
		if (value instanceof Boolean)
		{
			boolean bValue = (Boolean) value;
			textValue = bValue ? VALUE_TRUE : VALUE_FALSE;
		}
		else if (value instanceof Date)
		{
			Date date = (Date) value;
			textValue = sdf.format(date);
		}
		else if (value instanceof byte[])
		{
		}
		else
		{
			textValue = value.toString();
		}
		return textValue;
	}

	// private void addMergedRegion (HSSFSheet sheet, int[][] unite)
	// {
	// if (unite == null)
	// {
	// return;
	// }
	// for (int[] i : unite)
	// {
	// if (i != null && i.length == 4)
	// {
	// sheet.addMergedRegion (new CellRangeAddress (i[0], i[1], i[2], i[3]));
	// }
	// }
	// }

	private static final SimpleDateFormat sdf = new SimpleDateFormat(
			Constants.DATE_PATTERN);
	private static final String VALUE_TRUE = "Yes";
	private static final String VALUE_FALSE = "No";

}
