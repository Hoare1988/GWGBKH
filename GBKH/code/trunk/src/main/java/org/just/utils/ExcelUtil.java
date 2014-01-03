package org.just.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.formula.FormulaParseException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Comment;
import org.apache.poi.ss.usermodel.Hyperlink;
import org.apache.poi.ss.usermodel.RichTextString;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.Region;
import org.just.xch.domain.sys.ExeItem;
import org.just.xch.domain.sys.ExeItemVO;

/**
 * Excel
 * 
 * @author XCH
 * 
 */
public class ExcelUtil
{
	// HSSFCellStyle Excle样式
	public HSSFCellStyle cellStyle = null;

	// 内容为空时左边框样式
	public HSSFCellStyle leftBorderCellStyle = null;
	// 内容为空时右边框样式
	public HSSFCellStyle rightBorderCellStyle = null;
	// 内容为空时下边边框样式
	public HSSFCellStyle bottomBorderCellStyle = null;
	// 内容为空时上边框样式
	public HSSFCellStyle upBorderCellStyle = null;
	// 内容为空时右下
	public HSSFCellStyle rightBottomBorderCellStyle = null;
	// 内容为空时左下
	public HSSFCellStyle leftBottomBorderCellStyle = null;
	// 内容为空时左右
	public HSSFCellStyle leftRightBorderCellStyle = null;

	// 标题
	private HSSFCellStyle titleCellStyle = null;
	// 副标题
	private HSSFCellStyle chiefTitleCellStyle = null;

	private static final SimpleDateFormat sdf = new SimpleDateFormat(
			"yyyy-MM-dd");
	private static final String VALUE_TRUE = "Yes";
	private static final String VALUE_FALSE = "No";

	// 默认行高
	private static final int DEFAULT_ROW_HEIGHT = 250;

	/**
	 * 创建Excel文件
	 * 
	 * @param fileName
	 *            文件名
	 * @param spreadsheetBeanList
	 *            电子表格程序
	 */
	public void createExcelFile(String fileName, ExeItem rootExeItem,
			List<Object[]> dataList)
	{
		HSSFWorkbook workbook = new HSSFWorkbook();
		createCellStyle(workbook);

		insertToHSSFWorkbook(workbook, rootExeItem, dataList);
		saveExcelFile(fileName, workbook);
	}

	public void createExcelToOutputStream(OutputStream outputStream,
			ExeItem rootExeItem, List<Object[]> dataList)
	{
		HSSFWorkbook workbook = new HSSFWorkbook();
		createCellStyle(workbook);

		insertToHSSFWorkbook(workbook, rootExeItem, dataList);
		try
		{
			workbook.write(outputStream);
			outputStream.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	public void createCellStyle(HSSFWorkbook workbook)
	{
		cellStyle = workbook.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		// 自动换行
		cellStyle.setWrapText(true);

		cellStyle.setBorderBottom(HSSFCellStyle.BORDER_DOTTED);// 下边框
		cellStyle.setBorderLeft(HSSFCellStyle.BORDER_DOTTED);// 左边框
		cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);// 右边框
		cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);// 上边框
		/****************************************/
		HSSFFont font = workbook.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); // 字体加粗
		font.setFontHeight((short) 300); // 设置字体大小
		font.setFontName("宋体"); // 设置单元格字体

		titleCellStyle = workbook.createCellStyle();
		titleCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		titleCellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		titleCellStyle.setFont(font);
		/********/
		HSSFFont chiefTitlefont = workbook.createFont();
		chiefTitlefont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); // 字体加粗
		chiefTitlefont.setFontHeight((short) 260); // 设置字体大小
		chiefTitlefont.setFontName("宋体"); // 设置单元格字体

		chiefTitleCellStyle = workbook.createCellStyle();
		chiefTitleCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		chiefTitleCellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		chiefTitleCellStyle.setFont(chiefTitlefont);

		leftBorderCellStyle = workbook.createCellStyle();
		leftBorderCellStyle.setBorderLeft(HSSFCellStyle.BORDER_DOTTED);

		rightBorderCellStyle = workbook.createCellStyle();
		rightBorderCellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);

		bottomBorderCellStyle = workbook.createCellStyle();
		bottomBorderCellStyle.setBorderBottom(HSSFCellStyle.BORDER_DOTTED);

		// 右下
		rightBottomBorderCellStyle = workbook.createCellStyle();
		rightBottomBorderCellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
		rightBottomBorderCellStyle.setBorderBottom(HSSFCellStyle.BORDER_DOTTED);
		// 左下
		leftBottomBorderCellStyle = workbook.createCellStyle();
		leftBottomBorderCellStyle.setBorderLeft(HSSFCellStyle.BORDER_DOTTED);
		leftBottomBorderCellStyle.setBorderBottom(HSSFCellStyle.BORDER_DOTTED);
		// 左右
		leftRightBorderCellStyle = workbook.createCellStyle();
		leftRightBorderCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
		leftRightBorderCellStyle
				.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
		leftRightBorderCellStyle.setBorderLeft(HSSFCellStyle.BORDER_DOTTED);
		leftRightBorderCellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
	}

	/**
	 * 在电子簿中插入数据
	 * 
	 * @param workbook
	 *            电子版
	 * @param spreadsheetBeanList
	 *            电子表格程序
	 */
	public void insertToHSSFWorkbook(HSSFWorkbook workbook,
			ExeItem rootExeItem, List<Object[]> dataList)
	{
		HSSFSheet sheet = workbook.createSheet(rootExeItem.getItem().getName());
		insertToSheet(sheet, rootExeItem, dataList);
	}

	/**
	 * 插入工作表
	 * 
	 * @param sheet
	 *            工作表
	 * @param titles
	 *            行标题
	 * @param dataList
	 *            数据
	 */
	public void insertToSheet(HSSFSheet sheet, ExeItem rootExeItem,
			List<Object[]> dataList)
	{
		// 设置标题和副标题栏
		HSSFRow titleRow = sheet.createRow(0);
		HSSFCell titleCell = titleRow.createCell(0);
		titleCell.setCellValue(new HSSFRichTextString(rootExeItem.getItem()
				.getName().trim()));
		titleCell.setCellStyle(titleCellStyle);

		HSSFRow chiefTitleRow = sheet.createRow(1);
		HSSFCell chiefTitlecell = chiefTitleRow.createCell(0);

		String chiefTitle = "";
		chiefTitle += "考核年份:" + rootExeItem.getTypeValue().trim();
		chiefTitle += "  被考核人:"
				+ rootExeItem.getBeAccessedUser().getRealName().trim()
				+ "   得分:"
				+ String.format("%.2f", rootExeItem.getScoreResult());
		chiefTitlecell.setCellValue(new HSSFRichTextString(chiefTitle));
		chiefTitlecell.setCellStyle(chiefTitleCellStyle);
		// *****************合并单元格**************************************
		sheet.addMergedRegion(new Region((short) 0, (short) 0, (short) 0,
				(short) 6));
		sheet.addMergedRegion(new Region((short) 1, (short) 0, (short) 1,
				(short) 6));
		// *******************************************************

		int rowIndex = 2;
		for (Object[] rowData : dataList)
		{
			HSSFRow row = sheet.createRow(rowIndex);
			if (rowData != null)
			{
				row.setHeight((short) (this.DEFAULT_ROW_HEIGHT * (((String) rowData[3])
						.length() / ExeItemVO.EVALUATION_STANDARD_DEFAULT_WIDTH + 1)));
			}

			Object[] lastRecord = null;
			if (rowIndex > 2)
			{
				lastRecord = dataList.get(rowIndex - 3);
			}

			/***********************************/
			for (int colIndex = 0; colIndex < rowData.length; colIndex++)
			{
				HSSFCell cell_Sh = row.createCell(colIndex);
				if ((colIndex < 2 || colIndex > 5)
						&& lastRecord != null
						&& lastRecord[colIndex] != null
						&& rowData[colIndex] != null
						&& (((String) lastRecord[colIndex]).trim()
								.equals(((String) rowData[colIndex]).trim())))
				{
					insertToCell(cell_Sh, "");

					sheet.addMergedRegion(new Region((short) rowIndex - 1,
							(short) colIndex, (short) rowIndex,
							(short) colIndex));
					if ((rowIndex == dataList.size() + 2) && colIndex == 6)
					{
						cell_Sh.setCellStyle(rightBottomBorderCellStyle);
					}
					else if ((rowIndex == dataList.size() + 2) && colIndex == 0)
					{
						cell_Sh.setCellStyle(leftBottomBorderCellStyle);
					}
					else if (colIndex == 0)
					{
						cell_Sh.setCellStyle(leftBorderCellStyle);
					}
					else if (colIndex == 6)
					{
						cell_Sh.setCellStyle(bottomBorderCellStyle);
					}
					else
					{
						cell_Sh.setCellStyle(leftRightBorderCellStyle);
					}
					continue;
				}

				if (cellStyle != null)
				{
					cell_Sh.setCellStyle(cellStyle);
				}
				insertToCell(cell_Sh, rowData[colIndex]);
			}
			rowIndex++;
		}

		sheet.autoSizeColumn(3);
		sheet.autoSizeColumn(6);
	}

	/**
	 * 插入单元格
	 * 
	 * @param cell
	 *            单元格
	 * @param data
	 *            数据
	 */
	public static void insertToCell(Cell cell, Object data)
	{
		if (data != null)
		{
			if (data instanceof String)
			{
				cell.setCellValue(new HSSFRichTextString(data.toString()));
			}
			else if (data instanceof Integer)
			{
				cell.setCellValue(((Integer) data).intValue());
			}
			else if (data instanceof Double)
			{
				cell.setCellValue(((Double) data).doubleValue());
			}
			else if (data instanceof Float)
			{
				cell.setCellValue(((Float) data).floatValue());
			}
			else if (data instanceof Date)
			{
				cell.setCellValue(sdf.format((Date) data));
			}
			else if (data instanceof Boolean)
			{
				cell.setCellValue(((Boolean) data) ? VALUE_TRUE : VALUE_FALSE);
			}
			else
			{
				cell.setCellValue(new HSSFRichTextString(data.toString()));
			}
		}
	}

	/**
	 * 保存Excel文件
	 * 
	 * @param fileName
	 *            文件名
	 * @param workbook
	 *            工作簿
	 */
	private static void saveExcelFile(String fileName, Workbook workbook)
	{
		try
		{
			FileOutputStream out = new FileOutputStream(new File(fileName));
			workbook.write(out);
			out.close();
		}
		catch (FileNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}

}
