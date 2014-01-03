package org.just.xch.model.domain
{
	import net.sf.gilead.pojo.actionscript.LightEntity;
	
	[RemoteClass(alias="org.just.xch.domain.RptGridColumn")]
	[Bindable]
	public class RptGridColumn extends LightEntity
	{
		public function RptGridColumn()
		{
		}
		
		public var id:int;
	    public var rptGrid:RptGrid;
	    public var colName:String;
	    public var colProperty:String;
	    public var colIndex:int;
	    public var colType:String;
	    public var colVisible:int;
	    public var colExport:int;
	    public var updateDate:Date;

	}
}