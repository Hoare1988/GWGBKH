package com.winning.bi.model.domain
{
	import mx.collections.ArrayCollection;
	
	import com.winning.bi.model.bean.LVBean;
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="com.winning.bi.domain.DbConn")]
	[Bindable]
	public class DbConn extends LightEntity
	{
		public function DbConn()
		{
		}
		public var code:String;
	    public var name:String;
	    public var drivername:String;
	    public var username:String;
	    public var password:String;
	    public var url:String;
	    public var type:int;
	    public var enable:int;
	    public var updateDate:Date;
	    
	    public static const TYPE_MSSQL:int = 1;//mssql
	    //public static const TYPE_ORCLE:int = 2;//oracle
	    
	    public static function getDbConnType():ArrayCollection{
			var ac:ArrayCollection=new ArrayCollection();
			ac.addItem(new LVBean("MSSQL2005",TYPE_MSSQL));
			return ac;
		}
		
		public static function getTypeLabel(type:int):String{
	    	var s:String;
	    	switch(type){
	    		case TYPE_MSSQL:
	    			s="MSSQL2005";
	    			break;
	    		default:
	    			s="";
	    			break;
	    	}
	    	return s;
	    }

	}
}