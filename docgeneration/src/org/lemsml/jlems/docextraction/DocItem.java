package org.lemsml.jlems.docextraction;

import java.util.ArrayList;

import org.lemsml.jlems.core.xml.XMLElement;


public class DocItem {

	
	String info;
	
	String section;
	
	Class<? extends Object> cls;
	
 	
	ArrayList<AttItem> attItems = new ArrayList<AttItem>();
	
	ArrayList<ListItem> listItems = new ArrayList<ListItem>();
	
	public DocItem(Class<? extends Object> cl) {
		cls = cl;

	}		 
	
	 

	public void setInfo(String s) {
		info = s;
	 
	}


	public void addListAttribute(String name, String tnm, String info) {
		listItems.add(new ListItem(name, tnm, info));
	}



	public void addAttribute(String name, String tnm, String info) {
		attItems.add(new AttItem(name, tnm, info));
	}


	private String shortName(Class<?> cls) {
		String ret = cls.getName();
		ret = ret.substring(ret.lastIndexOf(".") + 1, ret.length());
		return ret;
	}

	
	public XMLElement makeXMLElement() {
		XMLElement ret = new XMLElement("ElementType");
		ret.addAttribute("name", shortName(cls));
		if (section != null) {
			ret.addAttribute("section", section);
		}
		
		if (info != null) {
			ret.addBodiedElement("Info", info);
		}
		for (AttItem ai : attItems) {
			ret.add(ai.makeXMLElement());
		}
		
		for (ListItem ai : listItems) {
			ret.add(ai.makeXMLElement());
		}
		
		
		return ret;
	}



	public void setSection(String s) {
		 section = s;
	}

}
