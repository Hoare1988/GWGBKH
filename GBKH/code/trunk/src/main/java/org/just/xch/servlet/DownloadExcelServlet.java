package org.just.xch.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.just.utils.ExcelUtil;
import org.just.utils.NewwinningUtil;
import org.just.xch.domain.sys.ExeItem;
import org.just.xch.domain.sys.ExeItemVO;
import org.just.xch.domain.sys.Item;
import org.just.xch.domain.sys.SysUser;
import org.just.xch.service.intf.ExeItemService;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class DownloadExcelServlet extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		OutputStream outputStream = response.getOutputStream();
		String rootExeItemID = request.getParameter("rootExeID");

		if (exeItemServiceImpl != null)
		{
			ExeItem exeItem =null;

			List<ExeItem> roots = exeItemServiceImpl.findExeItemByProperty(
					"id", Long.valueOf(rootExeItemID));
			if (roots != null && roots.size() > 0)
			{
				exeItem = roots.get(0);

				List<ExeItemVO> exeItemVOList = exeItemServiceImpl
						.getExamExcelItems(exeItem);
				List<Object[]> objectsList = new ArrayList<Object[]>();
				if (exeItemVOList != null && exeItemVOList.size() > 0)
				{
					Object[] title = new Object[7];
					title[0] = "考核项目及权重";
					title[1] = "一级指标";
					title[2] = "二级指标";
					title[3] = "评分标准";
					title[4] = "分值";
					title[5] = "得分";
					title[6] = "数据来源";
					objectsList.add(title);
					
					for (ExeItemVO exeItemVO : exeItemVOList)
					{
						Object[] objTemp = new Object[7];
						objTemp[0] = exeItemVO.getItemAndWeight();
						objTemp[1] = exeItemVO.getFirstIndex();
						objTemp[2] = exeItemVO.getSecondIndex();
						// 添加换行
						objTemp[3] = NewwinningUtil.lineFeed(
								exeItemVO.getEvaluationStandard(), ExcelUtil.EVALUATION_STANDARD_DEFAULT_WIDTH);

						objTemp[4] = exeItemVO.getSocre();
						objTemp[5] = exeItemVO.getPoint();
						objTemp[6] = exeItemVO.getResource();
						objectsList.add(objTemp);
					}
					ExcelUtil excelUtil = new ExcelUtil();
					excelUtil.createExcelToOutputStream(outputStream, exeItem,
							objectsList);
				}
			}
		}

	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	@Override
	public void init() throws ServletException
	{
		ServletContext context = getServletContext();
		WebApplicationContext applicationContext = WebApplicationContextUtils
				.getWebApplicationContext(context);
		exeItemServiceImpl = (ExeItemService) applicationContext
				.getBean("exeItemServiceImpl");
	}

	private ExeItemService exeItemServiceImpl;

}
