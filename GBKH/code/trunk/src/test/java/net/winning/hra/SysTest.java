package net.winning.hra;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.winning.bi.dao.sys.ExeItemDao;
import com.winning.bi.dao.sys.ItemDao;
import com.winning.bi.domain.sys.DataLog;
import com.winning.bi.domain.sys.ExeItem;
import com.winning.bi.domain.sys.ExeItemVO;
import com.winning.bi.domain.sys.Item;
import com.winning.bi.domain.sys.ItemPermission;
import com.winning.bi.domain.sys.SysOrg;
import com.winning.bi.domain.sys.SysRole;
import com.winning.bi.domain.sys.SysUser;
import com.winning.bi.service.impl.ExeItemServiceImpl;
import com.winning.bi.service.impl.ItemServiceImpl;
import com.winning.bi.service.intf.DataLogService;
import com.winning.bi.service.intf.ExeItemService;
import com.winning.bi.service.intf.ItemService;
import com.winning.bi.service.intf.SysOrgService;
import com.winning.bi.service.intf.SysRoleService;
import com.winning.bi.service.intf.SysUserService;

public class SysTest {

	private static ItemService itemService;
	private static SysOrgService sysOrgService;
	private static ItemDao itemDao;
	private static ExeItemDao exeItemDao;
	private static SysRoleService roleService;
	private static ExeItemService exeItemService;
	private static SysUserService sysUserService;
	private static DataLogService dataLogService;

	public static void setUpBeforeClass() throws Exception {
		String APPLICATION_CONTEXT_PATH = "/com/winning/property/*Context.xml";
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				APPLICATION_CONTEXT_PATH);
		itemService = (ItemServiceImpl) applicationContext
				.getBean("itemServiceImpl");
		itemDao = (ItemDao) applicationContext.getBean("itemDao");
		sysOrgService = (SysOrgService) applicationContext
				.getBean("sysOrgServiceImpl");
		roleService = (SysRoleService) applicationContext
				.getBean("sysRoleServiceImpl");
		exeItemService = (ExeItemServiceImpl) applicationContext
				.getBean("exeItemServiceImpl");
		sysUserService = (SysUserService) applicationContext
				.getBean("sysUserServiceImpl");
		exeItemDao = (ExeItemDao) applicationContext.getBean("exeItemDao");
		
		dataLogService= (DataLogService) applicationContext.getBean("dataLogServiceImpl");
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			setUpBeforeClass();
//			testFindExeItemss();
			testUpdateExeItem();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public static void testSaveDataLog()
	{
		
		if(dataLogService!=null)
		{
			SysUser createBy=new SysUser();
			createBy.setId(861L);
			
			DataLog dataLog=new DataLog();
			dataLog.setType(DataLog.TYPE_EXE_ITEM);
			dataLog.setServiceID(""+12);
			dataLog.setValue("20");
			dataLog.setCreateBy(createBy);
			dataLog.setUpdateBy(createBy);
			dataLogService.saveDataLog(dataLog);
			
		}
		
		
	}
	
	
	public static void testgetExamSumScor()
	{
		ExeItem rootExeItem=new ExeItem();
		Item rootItem=new Item();
		rootItem.setScore(100);
		rootExeItem.setItem(rootItem);
		rootExeItem.setIsRootExeItem(1);
		//B2
		ExeItem b2Exe=new ExeItem();
		Item b2Item=new Item();
		b2Item.setScore(100);
		b2Item.setPercentage(80);
		b2Item.setIsBottom(1);
		b2Exe.setItem(b2Item);
		b2Exe.setScoreResult(90);
		//---B1
		ExeItem b1Exe=new ExeItem();
		Item b1Item=new Item();
		b1Item.setIsBottom(0);
		b1Item.setScore(100);
		b1Item.setPercentage(20);
		b1Exe.setItem(b1Item);
		//C1
		ExeItem c1Exe=new ExeItem();
		Item c1Item=new Item();
		c1Item.setScore(80);
		c1Item.setIsBottom(1);
		c1Exe.setItem(c1Item);
		c1Exe.setScoreResult(80);
		//C2
		ExeItem c2Exe=new ExeItem();
		Item c2Item=new Item();
		c2Item.setIsBottom(1);
		c2Item.setScore(10);
		c2Exe.setItem(c2Item);
		c2Exe.setScoreResult(5);
		//C3
		ExeItem c3Exe=new ExeItem();
		Item c3Item=new Item();
		c3Item.setIsBottom(1);
		c3Item.setScore(10);
		c3Exe.setItem(c3Item);
		c3Exe.setScoreResult(10);
		
		List<ExeItem> b1Childs=new ArrayList<ExeItem>();
		b1Childs.add(c1Exe);
		b1Childs.add(c2Exe);
		b1Childs.add(c3Exe);
		b1Exe.setChildExeItems(b1Childs);
		
		List<ExeItem> rootChilds=new ArrayList<ExeItem>();
		rootChilds.add(b1Exe);
		rootChilds.add(b2Exe);
		
		rootExeItem.setChildExeItems(rootChilds);
		
		if(exeItemService!=null)
		{
			double sum=exeItemService.getExeItemSum(rootExeItem,true);
			System.out.println(sum);
		}
	}
	
	public static void testfindItemPermissionsByItem()
	{
		if(itemService!=null)
		{
			Item item=new Item();
			item.setId(2);
			
			List<ItemPermission> itemPermits=itemService.findItemPermissionsByItem(item);
			System.out.println(itemPermits);
			
		}
		
	}

	public static void testUpdateExeItem() {
		if (exeItemDao != null) 
		{
			SysUser createBy=new SysUser();
			createBy.setId(861L);
			ExeItem exeItem = new ExeItem();
			exeItem.setUpdateBy(createBy);
			
			exeItem.setId(141L);
			exeItem.setScoreResult(12.5D);
			exeItemDao.updateExeItem(exeItem);
		}

	}
	
	
	private static void testFindUserByOrgNameStationItemss() 
	{
		
		if(sysOrgService!=null)
		{
			List<SysUser> userList=sysOrgService.findUserByOrgAndStation("", 2);
			if(userList!=null)
			{
				System.out.println(userList.size());
			}
		}
	}

	private static void testFindExeItemss() {
		if (exeItemService != null) {
			Item item = new Item();
			item.setId(2);
			SysUser user = new SysUser();
			user.setId(932L);

			SysUser loginUser = new SysUser();
			SysOrg orgs = new SysOrg();
			orgs.setId(80);
			List<SysOrg> orgsList = new ArrayList<SysOrg>();
			orgsList.add(orgs);
			loginUser.setOrgs(orgsList);
			loginUser.setId(885L);
			List<ExeItem> exeItems = exeItemService.findAllExeItemsByCondition(
					item, user, "2013", null, 1, loginUser);
			System.out.println(exeItems);
			// if (exeItems != null) {
			// System.out.println(exeItems.size());
			// }
		}

	}

	private static void testFindItemByOrg() {
		SysOrg org = new SysOrg();
		org.setId(127);
		if (itemDao != null) {
			List<Item> items = itemDao.findItemFromPermitByOrg(org);
			System.out.println(items);
		}

	}

	private static void testFindUser() {
		if (sysUserService != null) {
			List<SysUser> users = sysUserService.queryPmUsers(null, null, null);
			System.out.println(users);
		}
	}

	private static void test_ExeItem_Save() {

		if (exeItemService != null) {
			ExeItem exeItem = new ExeItem();
			Item item = new Item();
			item.setId(2);
			SysUser user = new SysUser();
			user.setId(932L);
			exeItem.setItem(item);
			exeItem.setBeAccessedUser(user);
			exeItem.setCreateBy(user);
			exeItem.setUpdateBy(user);
			exeItem.setType(1);
			exeItem.setTypeValue("2013");
			exeItem.setIsRootExeItem(1);
			exeItem.setEnable(1);
			exeItemService.createAccessFormByRootItem(exeItem);
		}

	}

	private static void testFindExeItems() {
		if (exeItemService != null) {
			ExeItem rootExeItem=new ExeItem();
			rootExeItem.setId(121L);
			
			List<ExeItem> exeItems = exeItemService.findExeItemsByCondition(
					null, null, null, rootExeItem, 0);
			if (exeItems != null) {
				System.out.println(exeItems.size());
			}
		}
	}
	
	private static void testGetExamExcelItems() {
		if (exeItemService != null) {
			ExeItem rootExeItem=new ExeItem();
			rootExeItem.setId(121L);
			
			List<ExeItemVO> exeItems = exeItemService.getExamExcelItems(rootExeItem);
			if (exeItems != null) {
				System.out.println(exeItems.size());
			}
		}
	}
	
	

	private static void findRootItem() {

		if (itemService != null) {
			List<Item> items = itemService.findRootItems(1);
			System.out.println(items);
		}
	}

	private static void finditemByPare() {
		Item item = new Item();
		item.setId(2);
		if (itemDao != null) {
			List<Item> items = itemDao.findItemsByParentItem(item);
			System.out.println(items);
		}
	}

	private static void findOrg() {
		List<SysOrg> orgList = sysOrgService.queryOrgByCondition(null, null);
		System.out.println(orgList);

	}

	private static void insertItemPermit() {
		List<ItemPermission> itemList = new ArrayList<ItemPermission>();
		Item item = new Item();
		item.setId(2);
		SysUser user = new SysUser();
		user.setId(932L);
		SysOrg org = new SysOrg();
		org.setId(80);
		ItemPermission itemPer = new ItemPermission();
		itemPer.setItem(item);
		itemPer.setUser(user);
		itemPer.setCreateBy(user);
		itemPer.setUpdateBy(user);
		itemPer.setSysOrg(org);

		itemList.add(itemPer);
		itemService.intsertItemPermission(itemList);

	}

	private static void testInsertItem() {
		Item parItem = new Item();
		parItem.setId(2);
		parItem.setName("科研部门正职");

		Item item = new Item();
		item.setName("主要业务完成情况");
		item.setScore(70);
		item.setParentItem(parItem);
		if (itemService != null) {
			itemService.insertItem(item);
		}

	}

	private static void testFindRole() {
		if (roleService != null) {
			List<SysRole> rolsList = roleService.queryRolesByCondition("管理");
			if (rolsList != null) {
				System.out.println(rolsList.size());
			} else {
				System.out.println(rolsList);
			}
		}

	}

	private static void testFindItem() {

		if (itemService != null) {
			// List<Item> itemList = itemService.queryItemsByCondition(null,
			// null,
			// null, null, null, 1);
			// if (itemList != null)
			// {
			// System.out.println(itemList.size());
			// }

		}
	}

}
