package com.winning.bi.model.vo
{
	[RemoteClass="com.winning.bi.domain.sys.ExeItemVO"]
	[Bindable]
	public class ExeItemVO
	{
		public function ExeItemVO()
		{
		}
		
		/**
		 * 考核项目及权重
		 */
		public var itemAndWeight:String;
		/**
		 * 一级指标
		 */
		public var firstIndex:String;
		/**
		 * 二级指标
		 */
		public var secondIndex:String;
		/**
		 * 评分标准
		 */
		public  evaluationStandard:String;
		/**
		 * 分值
		 */
		public var  socre:String;
		/**
		 * 得分
		 */
		public var point:String;
		/**
		 * 数据来源
		 */
		public var resource:String;
	}
}