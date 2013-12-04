package org.lemsml.jlems.docextraction;

import org.lemsml.jlems.core.xml.XMLElement;

public class AttItem {

	String name;
String typeName;
 	String info;
	
	public AttItem(String nm, String tnm, String si) {
		name = nm;
		typeName = tnm;
		info = si;
 
	}

	public XMLElement makeXMLElement() {
		 XMLElement ret= new XMLElement("Property");
		 ret.addAttribute("name", name);
		 ret.addAttribute("type", typeName);
		 ret.setBody(info);
		 return ret;
	}

	
}
