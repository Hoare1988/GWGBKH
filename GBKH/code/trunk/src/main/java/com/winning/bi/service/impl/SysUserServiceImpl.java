package com.winning.bi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.winning.bi.dao.sys.SysUserDao;
import com.winning.bi.domain.sys.SysModule;
import com.winning.bi.domain.sys.SysRole;
import com.winning.bi.domain.sys.SysUser;
import com.winning.bi.service.intf.SysUserService;
import com.winning.exception.BusinessException;
import com.winning.utils.Constant;
import com.winning.utils.DpUtil;
import com.winning.utils.FlexSessionUtil;
import com.winning.utils.NewwinningUtil;

public class SysUserServiceImpl implements SysUserService
{
	private SysUserDao sysUserDao;

	public SysUser login(String username, String password)
	{
		Map<String, Object> condition = DpUtil.getConMap();
		condition.put("userName", username);
		condition.put("password", password);
		SysUser user = sysUserDao.login(condition);
		if (user != null)
		{
			List<SysRole> roles = user.getRoles();
			if (roles != null && roles.size() > 0)
			{
				for (SysRole role : roles)
				{
					role.setModules(buildValidModuleTree(1, role.getId()));
				}
			}
			sysUserDao.updateAfterLogin(user.getId());
			FlexSessionUtil.setAttribute(Constant.SESSION_SYSUSER, user);
			
			//1.登录成功后设置用户会话超时时间=30分钟
			if(null!=Constant.MEMCACHED_CLIENT){
				if(null!=Constant.getResultByMemcache(user.getUserName()+user.getPassword())){
					Constant.replaceResultByMemcache(user.getUserName()+user.getPassword(), Constant.SESSION_TIMEOUT,user);
				}else{
					Constant.setResultByMemcache(user.getUserName()+user.getPassword(), Constant.SESSION_TIMEOUT,user);
				}
			}
			
		}
		return user;
	}

	public List<SysUser> queryUsersByCondition(String userName,
			String realName, String py)
	{
		Map<String, Object> condition = DpUtil.getConMap();
		if (NewwinningUtil.isNotNull(userName))
		{
			condition.put("userName", userName);
		}
		if (NewwinningUtil.isNotNull(realName))
		{
			condition.put("realName", realName);
		}
		if (NewwinningUtil.isNotNull(py))
		{
			condition.put("py", py);
		}
		return sysUserDao.queryUsersByCondition(condition);
	}

	public List<SysUser> queryPmUsers(String userName, String realName,
			String py)
	{
		Map<String, Object> condition = DpUtil.getConMap();
		if (NewwinningUtil.isNotNull(userName))
		{
			condition.put("userName", userName);
		}
		if (NewwinningUtil.isNotNull(realName))
		{
			condition.put("realName", realName);
		}
		if (NewwinningUtil.isNotNull(py))
		{
			condition.put("py", py);
		}
		return sysUserDao.queryPmUsers(condition);
	}

	public SysUser insertSysUser(SysUser sysUser) throws BusinessException
	{
		if (sysUser != null)
		{
			Map<String, Object> condition = DpUtil.getConMap();
			condition.put("userName", sysUser.getUserName());
			List<SysUser> list = sysUserDao.findUsersByCondition(condition);
			if (list != null && list.size() > 0)
			{
				throw new BusinessException("用户名[" + sysUser.getUserName()
						+ "]已存在!");
			}
			sysUserDao.insertSysUser(sysUser);
			return sysUserDao.findSysUserById(sysUser.getId());
		}
		return null;
	}

	public SysUser savePmUserRoles(SysUser sysUser)
	{
		if (sysUser != null)
		{
			sysUserDao.deleteAllSysUsersRolesMapping(sysUser.getId());
			Map<String, Object> condition = new HashMap<String, Object>();
			for (SysRole sysRole : sysUser.getRoles())
			{
				if (sysRole.getIsSelected() == 1)
				{
					condition.clear();
					condition.put("uid", sysUser.getId());
					condition.put("rid", sysRole.getId());
					condition.put("isdefault", sysRole.getIsDefault());
					sysUserDao.insertSysUsersRolesMapping(condition);
				}
			}
		}
		return sysUser;
	}

	public SysUser updateSysUser(SysUser sysUser)
	{
		if (sysUser != null)
		{
			sysUserDao.updateSysUser(sysUser);
			return sysUserDao.findSysUserById(sysUser.getId());
		}
		return null;
	}

	public void updatePassword(SysUser sysUser, String oldPwd, String newPwd)
			throws Exception
	{
		if (!NewwinningUtil.isNotNull(newPwd))
		{
			throw new Exception("新密码不能为空！");
		}
		if (sysUser != null)
		{
			SysUser returnUser = sysUserDao.findSysUserById(sysUser.getId());
			if (returnUser == null)
			{
				throw new Exception("未找到用户" + sysUser.getUserName());
			}
			if (returnUser.getPassword() != null
					&& !returnUser.getPassword().equals(oldPwd))
			{
				throw new Exception("旧密码输入有误，请重新输入！");
			}
			Map<String, Object> condition = new HashMap<String, Object>();
			condition.put("id", sysUser.getId());
			condition.put("password", newPwd);
			sysUserDao.updatePassword(condition);
		}
		else
		{
			throw new Exception("用户为空！");
		}
	}

	private List<SysModule> buildValidModuleTree(int m_id, int r_id)
	{
		Map<String, Object> condition = DpUtil.getConMap();
		condition.put("m_id", m_id);
		condition.put("r_id", r_id);
		List<SysModule> result = sysUserDao
				.selectValidModulesForRole(condition);
		if (result != null && result.size() > 0)
		{
			for (SysModule module : result)
			{
				module.setChildren(buildValidModuleTree(module.getId(), r_id));
			}
		}
		return result;
	}

	public void setSysUserDao(SysUserDao sysUserDao)
	{
		this.sysUserDao = sysUserDao;
	}

	public void existSystem()
	{
		FlexSessionUtil.clearSession();
	}

}
