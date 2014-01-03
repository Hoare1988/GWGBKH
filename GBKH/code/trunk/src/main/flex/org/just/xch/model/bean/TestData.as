package org.just.xch.model.bean
{
	import org.just.xch.demo.sqd.DpFactory;
	
	import mx.collections.ArrayCollection;
	
	import net.sf.gilead.pojo.actionscript.LightEntity;

	[Bindable]
	public class TestData extends LightEntity
	{
		public function TestData(col1:String='', col2:String='', col3:String='', col4:String='', col5:String='', col6:String='', col7:String='', col8:String='', col9:String='', col10:String='', num1:Number=0, num2:Number=0, num3:Number=0, num4:Number=0, num5:Number=0, num6:Number=0, num7:Number=0, num8:Number=0, num9:Number=0, num10:Number=0)
		{
			this.col1=col1;
			this.col2=col2;
			this.col3=col3;
			this.col4=col4;
			this.col5=col5;
			this.col6=col6;
			this.col7=col7;
			this.col8=col8;
			this.col9=col9;
			this.col10=col10;

			this.num1=num1;
			this.num2=num2;
			this.num3=num3;
			this.num4=num4;
			this.num5=num5;
			this.num6=num6;
			this.num7=num7;
			this.num8=num8;
			this.num9=num9;
			this.num10=num10;
		}
		public var col1:String;
		public var col2:String;
		public var col3:String;
		public var col4:String;
		public var col5:String;
		public var col6:String;
		public var col7:String;
		public var col8:String;
		public var col9:String;
		public var col10:String;

		public var num1:Number;
		public var num2:Number;
		public var num3:Number;
		public var num4:Number;
		public var num5:Number;
		public var num6:Number;
		public var num7:Number;
		public var num8:Number;
		public var num9:Number;
		public var num10:Number;
		
		public static function getTestData01():ArrayCollection
		{
			/*安国医院
			锡山医院
			一0一医院
			中医院
			荣军医院
			无锡八院
			虹桥医院
			人民医院
			江原医院
			同仁医院*/
			
			/*医保基金支出
			统筹基金支出
			个人账户支出
			现金支付
			自理费用
			自费费用
			自付费用
			统筹支付
			公补支付
			企补支付
			个人账户*
				公补账户
				企补账户
				门槛费
				统筹段自理费用
				基金支付率
				基金范围支付率
				个人负担率
				医疗总费用
				药品总费用
				就诊人次
				就诊人数
				均次费用
				均次药费
				药占比
				人数比
				平均住院率
				门诊住院率
				参保人均住院率*/


			/*-30-30*/
			var ac:ArrayCollection=new ArrayCollection();
			ac.addItem(new TestData("锡山医院","统筹基金支出","住院","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getL30(),getU30()));
			ac.addItem(new TestData("一0一医院","均次费用","门诊","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getU30(),getU30()));
			ac.addItem(new TestData("锡山医院","个人账户支出","住院","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getL30(),getL30()));
			ac.addItem(new TestData("荣军医院","药占比","住院","季20124","高","环比, 同比跌幅超正常范围","","","","",getU30(),getU30()));
			ac.addItem(new TestData("一0一医院","个人账户支出","门诊","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getU30(),getL30()));
			ac.addItem(new TestData("锡山医院","统筹基金支出","住院","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getU30(),getU30()));
			ac.addItem(new TestData("荣军医院","个人账户支出","门诊","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getL30(),getU30()));
			ac.addItem(new TestData("荣军医院","药占比","住院","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getU30(),getL30()));
			ac.addItem(new TestData("锡山医院","均次费用","门诊","季20124","高","环比, 同比跌幅超正常范围","","","","",getL30(),getU30()));
			ac.addItem(new TestData("一0一医院","统筹基金支出","住院","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getL30(),getL30()));
			ac.addItem(new TestData("锡山医院","药占比","住院","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getU30(),getU30()));
			ac.addItem(new TestData("荣军医院","个人账户支出","住院","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getL30(),getU30()));
			ac.addItem(new TestData("锡山医院","药占比","门诊","季20124","高","环比, 同比跌幅超正常范围","","","","",getL30(),getU30()));
			ac.addItem(new TestData("一0一医院","统筹基金支出","住院","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getL30(),getL30()));
			ac.addItem(new TestData("锡山医院","个人账户支出","门诊","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getL30(),getU30()));
			ac.addItem(new TestData("一0一医院","药占比","门诊","季20124","高","环比, 同比跌幅超正常范围","","","","",getU30(),getU30()));
			ac.addItem(new TestData("锡山医院","均次费用","住院","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getL30(),getL30()));
			ac.addItem(new TestData("荣军医院","统筹基金支出","住院","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getU30(),getU30()));
			ac.addItem(new TestData("锡山医院","个人账户支出","门诊","季20124","高","环比, 同比跌幅超正常范围","","","","",getU30(),getL30()));
			ac.addItem(new TestData("一0一医院","统筹基金支出","住院","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getL30(),getU30()));
			ac.addItem(new TestData("锡山医院","药占比","住院","月2012-12","高","环比, 同比跌幅超正常范围","","","","",getL30(),getU30()));
			return ac;
			
		}
		
		public static function getN30():Number{
			return DpFactory.getOneNum10()%2==0?DpFactory.getOneNum10()+DpFactory.getOneNumPoit2():((0-DpFactory.getOneNum10())+DpFactory.getOneNumPoit2());
		}
		
		public static function getL30():Number{
			return (0-(30+DpFactory.getOneNum10()))+DpFactory.getOneNumPoit2();
		}
		
		public static function getU30():Number{
			return 30+DpFactory.getOneNum10()+DpFactory.getOneNumPoit2();
		}
	}
}