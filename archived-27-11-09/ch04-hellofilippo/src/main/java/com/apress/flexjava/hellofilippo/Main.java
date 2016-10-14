package com.apress.flexjava.hellofilippo;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		ApplicationContext context =
			new ClassPathXmlApplicationContext("ApplicationBeans.xml");

		HelloFilippo helloFilippo =
			(HelloFilippo) context.getBean("helloFilippo");

		HelloFilippoForConstructorInjection helloFilippoForConstructorInjection =
			(HelloFilippoForConstructorInjection) context.getBean("helloFilippoForConstructorInjection");

		HelloFilippoForAmbiguityConstructor helloFilippoForAmbiguityConstructor =
			(HelloFilippoForAmbiguityConstructor) context.getBean("helloFilippoForAmbiguityConstructor");

		HelloFilippoForAmbiguityConstructor helloFilippoForAmbiguityConstructor2 =
			(HelloFilippoForAmbiguityConstructor) context.getBean("helloFilippoForAmbiguityConstructor2");

		HelloFilippoForBothSetterAndConstructiorInjection helloFilippoForBothSetterAndConstructiorInjection =
			(HelloFilippoForBothSetterAndConstructiorInjection) context.getBean("helloFilippoForBothSetterAndConstructiorInjection");

		HelloFilippo helloFilippoForInnerBean =
			(HelloFilippo) context.getBean("helloFilippoForInnerBean");

		HelloFilippoForCollectionInjection helloFilippoForCollectionInjection =
			(HelloFilippoForCollectionInjection) context.getBean("helloFilippoForCollectionInjection");

		HelloFilippoForCollectionMapInjection helloFilippoForCollectionMapInjection =
			(HelloFilippoForCollectionMapInjection) context.getBean("helloFilippoForCollectionMapInjection");

		HelloFilippoForCollectionPropertiesInjection helloFilippoForCollectionPropertiesInjection =
			(HelloFilippoForCollectionPropertiesInjection) context.getBean("helloFilippoForCollectionPropertiesInjection");

		HelloFilippoForAutowired helloFilippoForAutowired =
			(HelloFilippoForAutowired) context.getBean("helloFilippoForAutowired");

		HelloFilippoForResource helloFilippoForResource =
			(HelloFilippoForResource) context.getBean("helloFilippoForResource");

		HelloFilippoForInitMethod helloFilippoForInitMethod =
			(HelloFilippoForInitMethod) context.getBean("helloFilippoForInitMethod");

		HelloFilippoForPreConstruct helloFilippoForPreConstruct =
			(HelloFilippoForPreConstruct) context.getBean("helloFilippoForPreConstruct");

		HelloFilippoForProperties helloFilippoForProperties =
			(HelloFilippoForProperties) context.getBean("helloFilippoForProperties");

		helloFilippo.hello();

		helloFilippoForConstructorInjection.hello();

		helloFilippoForAmbiguityConstructor.hello();

		helloFilippoForAmbiguityConstructor2.hello();

		helloFilippoForBothSetterAndConstructiorInjection.hello();

		helloFilippoForInnerBean.hello();

		helloFilippoForCollectionInjection.hello();

		helloFilippoForCollectionMapInjection.hello();

		helloFilippoForCollectionPropertiesInjection.hello();

		helloFilippoForAutowired.hello();

		helloFilippoForResource.hello();

		helloFilippoForInitMethod.hello();

		helloFilippoForPreConstruct.hello();

		helloFilippoForProperties.hello();
	}

}
