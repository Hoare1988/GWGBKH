package org.just.xch.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.just.exception.BusinessException;
import org.just.utils.DpUtil;
import org.just.utils.NewwinningUtil;
import org.just.xch.dao.sys.SysModuleDao;
import org.just.xch.dao.sys.SysRoleDao;
import org.just.xch.dao.sys.SysUserDao;
import org.just.xch.domain.sys.SysModule;
import org.just.xch.domain.sys.SysRole;
import org.just.xch.domain.sys.SysUser;
import org.just.xch.service.intf.SysRoleService;

public class SysRoleServiceImpl implements SysRoleService {

	private SysRoleDao sysRoleDao;
	private SysModuleDao sysModuleDao;

	public SysRole insertSysRole(SysRole sysRole) throws BusinessException {
		if (sysRole != null) {
			Map<String, Object> condition = DpUtil.getConMap();
			condition.put("name", sysRole.getName());
			List<SysRole> list = sysRoleDao.findRolesByCondition(condition);
			if (list != null && list.size() > 0) {
				throw new BusinessException("角色名[" + sysRole.getName()
						+ "]已存在!");
			}
			/**
			 * String uniqueValue = null; try { uniqueValue =
			 * AppAssist.getUniqueCode ("index"); } catch (Exception e) { throw
			 * new BusinessException(e.getMessage ()); } sysRole.setDescription
			 * (uniqueValue);
			 */
			sysRoleDao.insertSysRole(sysRole);
			return sysRoleDao.findSysRoleById(sysRole.getId());
		}
		return null;
	}

	public SysRole updateSysRole(SysRole sysRole) {
		if (sysRole != null) {
			Map<String, Object> condition = DpUtil.getConMap();
			condition.put("name", sysRole.getName());
			condition.put("description", sysRole.getDescription());
			condition.put("id", sysRole.getId());
			sysRoleDao.updateSysRole(condition);
			return sysRoleDao.findSysRoleById(sysRole.getId());
		}
		return null;
	}

	public List<SysRole> queryRolesByCondition(String name) {
		Map<String, Object> condition = DpUtil.getConMap();
		if (name != null && name.trim().length() > 0) {
			condition.put("name", name);
		}
		return sysRoleDao.queryRolesByCondition(condition);
	}

	public List<SysRole> queryPmRoles(String name) {
		Map<String, Object> condition = DpUtil.getConMap();
		if (NewwinningUtil.isNotNull(name)) {
			condition.put("name", name);
		}
		List<SysRole> roles = sysRoleDao.queryRolesByCondition(condition);

		for (SysRole role : roles) {
			try {
				role.setModules(buildModuleTree(1, role.getId()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return roles;
	}

	public SysRole savePmRoleModules(SysRole sysRole) {
		if (sysRole != null) {
			sysRoleDao.deleteAllRolesModuleMap(sysRole.getId());
			for (SysModule module : sysRole.getModules()) {
				if (module != null && module.getIsSelected() == 1) {
					insertRoleModule(module, sysRole);
				}
			}
		}
		return null;
	}

	private List<SysModule> buildModuleTree(int m_id, int r_id) {
		Map<String, Object> condition = DpUtil.getConMap();
		condition.put("m_id", m_id);
		condition.put("r_id", r_id);
		List<SysModule> result = sysUserDao.selectAllModulesForRole(condition);
		if (result != null && result.size() > 0) {
			for (SysModule module : result) {
				module.setChildren(buildModuleTree(module.getId(), r_id));
			}
		}
		return result;
	}

	private void insertRoleModule(SysModule module, SysRole role) {
		if (module != null && module.getIsSelected() == 1) {
			Map<String, Object> condition = DpUtil.getConMap();
			condition.put("mid", module.getId());
			condition.put("rid", role.getId());
			condition.put("isdefault", 0);
			sysRoleDao.insertRolesModuleMap(condition);
			if (module.getChildren() != null && module.getChildren().size() > 0) {
				for (SysModule sm : module.getChildren()) {
					if (sm != null && sm.getIsSelected() == 1) {
						insertRoleModule(sm, role);
					}
				}
			}
		}
	}

	public List<SysRole> findRolesByUser(SysUser sysUser) {
		List<SysRole> result = null;
		if (sysUser != null) {
			result = sysRoleDao.findRolesByUserID(sysUser.getId());
		}
		return result;
	}

	public void setSysRoleDao(SysRoleDao sysRoleDao) {
		this.sysRoleDao = sysRoleDao;
	}

	public void setSysModuleDao(SysModuleDao sysModuleDao) {
		this.sysModuleDao = sysModuleDao;
	}
	
	@Resource
	private SysUserDao sysUserDao;
}
