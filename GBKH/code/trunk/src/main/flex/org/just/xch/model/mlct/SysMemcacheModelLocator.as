package org.just.xch.model.mlct
{
	import com.adobe.cairngorm.model.ModelLocator;
	import org.just.xch.model.domain.Disease;
	import org.just.xch.model.domain.SysMemcache;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class SysMemcacheModelLocator implements ModelLocator
	{
		public var searchDisInitACFunction:Function=null;
		public var sysMemcacheAC:ArrayCollection=new ArrayCollection();
		public var sysMemcache:SysMemcache;
		
		public function SysMemcacheModelLocator()
		{
		}
		
		static private var instance:SysMemcacheModelLocator=null;
		static public function getInstance():SysMemcacheModelLocator{
			if(instance==null){
				instance=new SysMemcacheModelLocator();
			}
			return instance;
		}
		
		public function clearSysMemcacheModel():void{
			sysMemcacheAC=null;
		}
	}
}