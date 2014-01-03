package org.just.xch.domain.sys;

import java.util.Date;

/**
 * 系统缓存配置
 * @author：yuxiangtong
 * @date：下午1:21:53 2013-2-5
 */
public class SysMemcache {

	private long id;
	private String code; //代码=dao类的全名称+方法名称
	private String name; //备注
	private int hasCache; //是否缓存
	private int seconds; //缓存的时间，以秒为单位
	private Date createDate; //创建时间
	private int creatorId; //创建者id
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHasCache() {
		return hasCache;
	}
	public void setHasCache(int hasCache) {
		this.hasCache = hasCache;
	}
	public int getSeconds() {
		return seconds;
	}
	public void setSeconds(int seconds) {
		this.seconds = seconds;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getCreatorId() {
		return creatorId;
	}
	public void setCreatorId(int creatorId) {
		this.creatorId = creatorId;
	}
	
	
}
