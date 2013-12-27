package com.winning.bi.view.component.titlewin
{
	import mx.controls.dataGridClasses.DataGridColumn;

	[Event(name="click", type="flash.events.MouseEvent")]
	public class AuditTaskRuleCheckBoxHeaderColumn extends DataGridColumn
	{
		public function AuditTaskRuleCheckBoxHeaderColumn(columnName:String=null)
		{
			super(columnName);
			addEventListener("click",clickHandle);
		}
		
		private function clickHandle():void{
			
		}
		
		/**is the checkbox selected**/
		public var selected:Boolean=false;

	}
}