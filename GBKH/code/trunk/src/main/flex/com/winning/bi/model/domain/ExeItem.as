package com.winning.bi.model.domain
{
	import mx.collections.ArrayCollection;
	[RemoteClass(alias="com.winning.bi.domain.sys.ExeItem")]
	[Bindable]
	public class ExeItem extends BaseDomain
	{
		public static const  EXEITEM_TYPE_YEAR=1;
		public static const  EXEITEM_TYPE_QUARTER=2;
		
		public function ExeItem()
		{
		}
		/**
		 * 关联的项目
		 */
		public var item:Item;
		/**
		 * 项目得分
		 */
		public var scoreResult:Number;
		/***
		 * 被考核人   根节点才会有
		 */
		public var beAccessedUser:SysUser;
		/***
		 * 1 年度考核，2：季度考核           根节点才会有
		 */
		public var type:int;
		/**
		 * type=1   2013
		 * type=2   4 
		 *                     根节点才会有
		 * **/
		public var typeValue:String;
		
		/**
		 * 是否是根节点  1： 
		 */
		public var isRootExeItem:int;
		
		/**
		 * 根节点
		 */
		public var rootExeItem:ExeItem;
		/**
		 * 子级项目
		 */
		public var childExeItems:ArrayCollection=new ArrayCollection();
		/**
		 **/
		public var parentExeItem:ExeItem;
		
		public var children:ArrayCollection=new ArrayCollection();
	}
}