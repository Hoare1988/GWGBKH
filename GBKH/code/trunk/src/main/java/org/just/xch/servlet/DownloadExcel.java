package org.just.xch.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.beanlib.provider.finder.ProtectedReaderMethodFinder;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.just.utils.ExcelUtil;
import org.just.utils.NewwinningUtil;
import org.just.xch.domain.sys.ExeItem;
import org.just.xch.domain.sys.ExeItemVO;
import org.just.xch.domain.sys.Item;
import org.just.xch.domain.sys.SysUser;
import org.just.xch.service.intf.ExeItemService;


public class DownloadExcel extends HttpServlet
{

	/**
	 * Constructor of the object.
	 */
	public DownloadExcel()
	{
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy()
	{
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		OutputStream outputStream= response.getOutputStream();
		String rootExeItemID=request.getParameter("rootExeID");
		String beAccessedID=request.getParameter("beAccessedID");
		String itemID=request.getParameter("itemID");

		if(exeItemService!=null)
		{
			ExeItem exeItem=new ExeItem();
			exeItem.setId(Long.getLong(rootExeItemID));
			SysUser beAccessed=new SysUser();
			beAccessed.setId(Long.valueOf(beAccessedID));
			Item item=new Item();
			item.setId(Integer.parseInt(itemID));
			
			List<ExeItem>roots= exeItemService.findExeItemsByCondition(item, beAccessed, null, null, 1);
			if(roots!=null&&roots.size()>0){
				exeItem=roots.get(0);
				
				List<ExeItemVO> exeItemVOList= exeItemService.getExamExcelItems(exeItem);
				List<Object[]> objectsList=new ArrayList<Object[]>();
				for(ExeItemVO exeItemVO:exeItemVOList)
				{
					Object[] objTemp=new Object[7];
				   objTemp[0]=exeItemVO.getItemAndWeight();
				   objTemp[1]=exeItemVO.getFirstIndex();
				   objTemp[2]=exeItemVO.getSecondIndex();
				   //添加换行
				   objTemp[3]=NewwinningUtil.lineFeed(exeItemVO.getEvaluationStandard(),15);
				   
				   objTemp[4]=exeItemVO.getSocre();
				   objTemp[5]=exeItemVO.getPoint();
				   objTemp[6]=exeItemVO.getResource();
				   objectsList.add(objTemp);
				}
				ExcelUtil excelUtil=new ExcelUtil();
				excelUtil.createExcelToOutputStream(outputStream, exeItem, objectsList);
			}
		}

	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException
	{
		// Put your code here
	}
	
	@Resource
	protected ExeItemService exeItemService;

}
