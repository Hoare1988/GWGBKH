package com.winning.util
{
	import mx.collections.ArrayCollection;
	
	public class CodeHelper
	{
		[Bindable]
		public static var CodeTypeAC:ArrayCollection=new ArrayCollection();
		[Bindable]
		public static var CodeAnesthesiaAC:ArrayCollection=new ArrayCollection();
		[Bindable]
		public static var CodeFrequencyAC:ArrayCollection=new ArrayCollection();
		[Bindable]
		public static var AllCodeFrequencyAC:ArrayCollection=new ArrayCollection();
		[Bindable]
		public static var CodeUseWayAC:ArrayCollection=new ArrayCollection();
		[Bindable]
		public static var CodeDosageUnitAC:ArrayCollection=new ArrayCollection();
		[Bindable]
		public static var specimanAC:ArrayCollection=new ArrayCollection();
		[Bindable]
		public static var othersAC:ArrayCollection=new ArrayCollection();
		

		public function CodeHelper()
		{
		}

		public static function lookUpElementByCode(elements:*, code:*):*
		{
			for each (var element:* in elements)
			{
				if (code == element.code.toString())
				{
					return element;
				}
			}
		}

		public static function lookUpElementByValue(elements:*, value:*):*
		{
			for each (var element:* in elements)
			{
				if (value == element.value.toString())
				{
					return element;
				}
			}
		}

		public static function lookUpValue(elements:*, code:*):*
		{
			for each (var element:* in elements)
			{
				if (code == element.code)
				{
					return element.value;
				}
			}
		}

		public static function lookUpCode(elements:*, value:*):*
		{
			for each (var element:* in elements)
			{
				if (value == element.value.toString())
				{
					return element.code;
				}
			}
		}

		public static function lookUpProperty(elements:*, code:*, propertyName:*):*
		{
			for each (var element:* in elements)
			{
				if (code == element.code.toString())
				{
					return element.child(propertyName);
				}
			}
		}

		public static function lookUpPropertyByProperty(elements:*, propertyValue:*, srcProperty:*, targetProperty:*):*
		{
			for each (var element:* in elements)
			{
				if (element.child(srcProperty) == propertyValue)
				{
					return element.child(targetProperty);
				}
			}
		}

		public static function lookUpName(elements:*, id:*):*
		{
			for each (var element:* in elements)
			{
				if (id == element.id.toString())
				{
					return element.name;
				}
			}
		}
		
		
	}
}