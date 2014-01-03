package org.just.xch.model.domain
{
	import org.just.xch.model.bean.LVBean;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class FAIndex
	{
		private static var ID:int=1;//ID
		public function FAIndex(name:String,type:Number=1,children:ArrayCollection=null,superpositions:ArrayCollection=null,splits:ArrayCollection=null)
		{
			this.id=ID++;
			this.name=name;
			this.children=children;
			this.superpositions=superpositions;
			this.splits=splits;
			this.type=type;
			this.splitTyle=1;
		}
		public var id:Number;
		public var name:String;
		public var type:Number;//1柱状2曲线
		public var splitTyle:Number;//1门住
		public var children:ArrayCollection;
		public var superpositions:ArrayCollection;
		public var splits:ArrayCollection;
		
		public static function getFAIndexTree01():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
			
			
			/*（医保）总费用
			（自费）总费用
			（医保）人次数
			（自费）人次数
			（医保）均次（费用/人次）
			（自费）均次（费用/人次）
			（医保）药占比（药品费/总费用）
			（自费）药占比（药品费/总费用）
			（医保）人数比（人数/人次数）
			平均住院率（住院人次/所有就诊人次）
			门诊住院率（住院人次/门诊人次）
			参保人均住院率（住院人数/参保总人数）*/
				
				
				
				/*基金运营
				医保基金支出（总费用-现金支出）=（统筹基金支出+个人账户支出）
				自理费用（乙类项目个人应承担部分费用）
				自费费用（丙类项目费用）
				自付费用（门槛费+统筹段自理费用）
				现金支付（自理费用+自费费用+自付费用-个人账户支出）
				统筹基金（统筹支付+公补支付+企补支付）
				个人账户（个人账户+公补账户+企补账户）
				居民医保费用（参保类型为居民医保）
				基金支付率（医保基金/总费用）
				基金范围支付率（医保基金/（总费用-自费费用））
				个人负担率（自理金额/总费用）*/
			
			
			var lv1:FAIndex=new FAIndex('就诊类别(门诊/住院)',0);
			
			
			var ac1:ArrayCollection=new ArrayCollection();
			var fa1_1:FAIndex=new FAIndex('基金支出');
			fa1_1.superpositions=new ArrayCollection();
			fa1_1.superpositions.addItem(new FAIndex('统筹基金'));
			fa1_1.superpositions.addItem(new FAIndex('个人账户'));
			fa1_1.superpositions.addItem(new FAIndex('自理费用'));
			fa1_1.superpositions.addItem(new FAIndex('自费费用'));
			fa1_1.superpositions.addItem(new FAIndex('自付费用'));
			fa1_1.superpositions.addItem(new FAIndex('现金支付'));
			
			
			var fa1_2:FAIndex=new FAIndex('个人账户');
			var fa1_3:FAIndex=new FAIndex('统筹基金');
			var fa1_4:FAIndex=new FAIndex('自理费用');
			var fa1_5:FAIndex=new FAIndex('自费费用');
			var fa1_6:FAIndex=new FAIndex('自付费用');
			var fa1_7:FAIndex=new FAIndex('现金支付');
			var fa1_8:FAIndex=new FAIndex('居民医保费用');
			var fa1_9:FAIndex=new FAIndex('基金支付率',2);
			var fa1_10:FAIndex=new FAIndex('基金范围支付率',2);
			var fa1_11:FAIndex=new FAIndex('个人负担率',2);
			
			ac1.addItem(fa1_1);
			ac1.addItem(fa1_2);
			ac1.addItem(fa1_3);
			ac1.addItem(fa1_4);
			ac1.addItem(fa1_5);
			ac1.addItem(fa1_6);
			ac1.addItem(fa1_7);
			ac1.addItem(fa1_8);
			ac1.addItem(fa1_9);
			ac1.addItem(fa1_10);
			ac1.addItem(fa1_11);
			
			var ac2:ArrayCollection=new ArrayCollection();
			var fa2_1:FAIndex=new FAIndex('医疗费用');
			fa2_1.superpositions=new ArrayCollection();
			fa2_1.superpositions.addItem(new FAIndex('基金支出'));
			fa2_1.splits=new ArrayCollection();
			fa2_1.splits.addItem(lv1);
			var fa2_2:FAIndex=new FAIndex('就诊人次');
			fa2_2.splits=new ArrayCollection();
			fa2_2.splits.addItem(lv1);
			var fa2_3:FAIndex=new FAIndex('医疗药费');
			fa2_3.splits=new ArrayCollection();
			fa2_3.splits.addItem(lv1);
			var fa2_4:FAIndex=new FAIndex('均次费用',2);
			fa2_4.splits=new ArrayCollection();
			fa2_4.splits.addItem(lv1);
			fa2_4.superpositions=new ArrayCollection();
			fa2_4.superpositions.addItem(new FAIndex('均次药费',2));
			var fa2_5:FAIndex=new FAIndex('均次药费',2);
			fa2_5.splits=new ArrayCollection();
			fa2_5.splits.addItem(lv1);
			var fa2_6:FAIndex=new FAIndex('药占比',2);
			fa2_6.splits=new ArrayCollection();
			fa2_6.splits.addItem(lv1);
			var fa2_7:FAIndex=new FAIndex('就诊人数');
			fa2_7.splits=new ArrayCollection();
			fa2_7.splits.addItem(lv1);
			var fa2_8:FAIndex=new FAIndex('平均住院率',2);
			var fa2_9:FAIndex=new FAIndex('门诊住院率',2);
			var fa2_10:FAIndex=new FAIndex('参保人均住院率',2);
			var fa2_11:FAIndex=new FAIndex('人数比',2);
			
			
			ac2.addItem(fa2_1);
			ac2.addItem(fa2_2);
			ac2.addItem(fa2_3);
			ac2.addItem(fa2_4);
			ac2.addItem(fa2_5);
			ac2.addItem(fa2_6);
			ac2.addItem(fa2_7);
			ac2.addItem(fa2_8);
			ac2.addItem(fa2_9);
			ac2.addItem(fa2_10);
			ac2.addItem(fa2_11);
			
			var ac3:ArrayCollection=new ArrayCollection();
			var fa3_1:FAIndex=new FAIndex('医疗费用(自费)');
			fa3_1.splits=new ArrayCollection();
			fa3_1.splits.addItem(lv1);
			var fa3_2:FAIndex=new FAIndex('医疗药费(自费)');
			fa3_2.splits=new ArrayCollection();
			fa3_2.splits.addItem(lv1);
			var fa3_3:FAIndex=new FAIndex('均次费用(自费)',2);
			fa3_3.splits=new ArrayCollection();
			fa3_3.splits.addItem(lv1);
			var fa3_4:FAIndex=new FAIndex('均次药费(自费)',2);
			fa3_4.splits=new ArrayCollection();
			fa3_4.splits.addItem(lv1);
			var fa3_5:FAIndex=new FAIndex('药占比(自费)',2);
			fa3_5.splits=new ArrayCollection();
			fa3_5.splits.addItem(lv1);
			var fa3_6:FAIndex=new FAIndex('人次(自费)');
			fa3_6.splits=new ArrayCollection();
			fa3_6.splits.addItem(lv1);
			var fa3_7:FAIndex=new FAIndex('人数(自费)');
			fa3_7.splits=new ArrayCollection();
			fa3_7.splits.addItem(lv1);
			
			ac3.addItem(fa3_1);
			ac3.addItem(fa3_2);
			ac3.addItem(fa3_3);
			ac3.addItem(fa3_4);
			ac3.addItem(fa3_5);
			ac3.addItem(fa3_6);
			ac3.addItem(fa3_7);
			
			ac.addItem(new FAIndex('基金指标',0,ac1));
			ac.addItem(new FAIndex('医疗指标(医保)',0,ac2));
			ac.addItem(new FAIndex('医疗指标(自费)',0,ac3));
			return ac;
		}
		
	
		
		
		public static function getFAIndexTree02():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
			
			var ac1:ArrayCollection=new ArrayCollection();
			ac1.addItem(new FAIndex('基金支出'));
			ac1.addItem(new FAIndex('个人账户'));
			ac1.addItem(new FAIndex('统筹基金'));
			ac1.addItem(new FAIndex('医疗费用'));
			ac1.addItem(new FAIndex('医疗药费'));
			ac1.addItem(new FAIndex('均次费用'));
			ac1.addItem(new FAIndex('均次药费'));
			ac1.addItem(new FAIndex('药占比'));
			ac1.addItem(new FAIndex('就诊人次'));
			
			ac.addItem(new FAIndex('ROOT',0,ac1));
			return ac;
		}
		
		
		public static function getFAIndexTree03():ArrayCollection
		{
			var ac:ArrayCollection=new ArrayCollection();
			
			var ac1:ArrayCollection=new ArrayCollection();
			ac1.addItem(new FAIndex('就诊类别(门诊/住院)'));
			//ac1.addItem(new FAIndex('医院级别'));
			//ac1.addItem(new FAIndex('人员类别'));
			
			ac.addItem(new FAIndex('拆分类别',0,ac1));
			return ac;
		}
		
	}
}