package org.just.xch.view.component.renderer
{
	import org.just.xch.model.domain.AuditTaskRuleList;
	import org.just.xch.model.domain.MHeader;
	import org.just.xch.view.component.titlewin.AuditTaskRuleCheckBoxHeaderColumn;
	
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.CheckBox;
	import mx.controls.DataGrid;
	import mx.events.CollectionEvent;
	import mx.events.DataGridEvent;

	public class AuditTaskRuleCheckBoxHeaderRenderer extends CheckBox
	{

		public function AuditTaskRuleCheckBoxHeaderRenderer()
		{
			super();
			//addEventListener("click", clickHandler);
		}
		private var _data:AuditTaskRuleCheckBoxHeaderColumn;

		override public function get data():Object
		{
			return _data;
		}

		override public function set data(value:Object):void
		{
			_data=value as AuditTaskRuleCheckBoxHeaderColumn;
			DataGrid(listData.owner).addEventListener(DataGridEvent.HEADER_RELEASE, sortEventHandler);
			selected=_data.selected;
		}

		private function sortEventHandler(event:DataGridEvent):void
		{
			if (event.itemRenderer == this)
				event.preventDefault();
		}

		override protected function clickHandler(event:MouseEvent):void
		{
			super.clickHandler(event);
			data.selected=selected;
			if (listData)
			{
				var dg:DataGrid=DataGrid(listData.owner);
				//for each (var mm:MHeader in dg.dataProvider as ArrayCollection)
				for each (var mm:Object in dg.dataProvider as ArrayCollection)
				{
					mm.ischecked=selected;
				}
			}

		}



	}
}