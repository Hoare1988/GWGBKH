package org.just.xch.model.domain
{
	import mx.collections.ArrayCollection;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="org.just.xch.domain.sys.SysRole")]
	[Bindable]
	public class SysRole extends LightEntity
	{
		public function SysRole()
		{
		}
		public var id:int;
	    public var name:String;
	    public var description:String;
	    public var sysOrg:SysOrg;
	    public var modules:ArrayCollection;
	    public var isSelected:int;
    	public var isDefault:int;

	}
}