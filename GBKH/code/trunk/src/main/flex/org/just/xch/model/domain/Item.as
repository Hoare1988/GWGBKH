package org.just.xch.model.domain
{
	import mx.collections.ArrayCollection;
	
	[RemoteClass(alias="org.just.xch.domain.sys.Item")]
	[Bindable]
	public class Item extends BaseDomain
	{
		public function Item()
		{
		}
		
		/**
		 * 名称
		 */
		public var name:String;
		/**
		 * 拼音
		 */
		public var  py:String;
		/**
		 * 分值
		 */
		public var score:Number;
		
		public var percentage:Number;
		/**
		 * 评分标准
		 */
		public var evaluationStandard:String;
		/**
		 * 是否是顶级项目（考核名称）
		 */
		public var isRoot:int;
		/**
		 * 数据来源
		 */
		public var resource:String;
		
		/**
		 * 是否是叶子项目
		 */
		public var isBottom:int;
		/**
		 * 父级项目
		 */
		public var parentItem:Item;
		/**
		 * 子级项目
		 */
		public var childItems:ArrayCollection=new ArrayCollection();
		/**
		 * 同级目录下的序号 从1开始
		 */
		public var sortNum:int;
		/**
		 * 是否可编辑 :  
		 **/
		public var editable:Boolean;
		
		public var children:ArrayCollection=new ArrayCollection();
		/***用于标识CheckTree的状态****/
		public var state:Number=0;
		
		public var isSelected:Boolean=false;
		
		public var isModified:Boolean=false;
		
		/**
		 * 1:新增   2：作废
		 **/
		public var editType:int;
		
		/**
		 * 当前子孩子的总分
		 **/
		public function getChildScore():Number
		{
			var sum:Number=0;
			var vilCilds:ArrayCollection=childItems;
			if(vilCilds==null||vilCilds.length==0)
			{
				vilCilds=children;
			}
			
			for(var i:int=0;i<vilCilds.length;i++)
			{
				sum+=(vilCilds[i] as Item).score;
			}
			return sum;
		}
		
		/**
		 * 子孩子中sortNum 最大值
		 */
		public function getMaxSortNumFromChild():int
		{
			var max:int=0;
			var vilCilds:ArrayCollection=childItems;
			if(vilCilds==null||vilCilds.length==0)
			{
				vilCilds=children;
			}
			
			for(var i:int=0;i<vilCilds.length;i++)
			{
				if((vilCilds[i] as Item).sortNum>max)
				{
					max=(vilCilds[i] as Item).sortNum;
				}
			}
			return max;
		}
		
	}
}