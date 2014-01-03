package org.just.service.intf;

import java.util.List;

public interface IExportService {
	/**
	 * generate xls file
	 */
	public boolean exportXls(List<Object> dataList, String[] headers,
			String fileName);

}
