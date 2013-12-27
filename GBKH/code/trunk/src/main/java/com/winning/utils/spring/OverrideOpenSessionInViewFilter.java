package com.winning.utils.spring;

//import org.hibernate.FlushMode;
import org.springframework.orm.hibernate3.support.OpenSessionInViewFilter;

public class OverrideOpenSessionInViewFilter extends OpenSessionInViewFilter {
	public OverrideOpenSessionInViewFilter(){
		this.setSessionFactoryBeanName("sessionFactoryForHibernate");
		this.setSingleSession(true);
//        this.setFlushMode( FlushMode.MANUAL);
	}
}
