/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package org.mmbase.applications.te;

/**
 * @author keesj
 * @version $Id$
 */
public class Templates extends Containers {
	public Templates(){
		super();
	}
	
	public Template getTemplate(int index){
		return (Template)get(index);
	}
	
	public Template getTemplateByName(String name){
		return (Template)getContainerByName(name);
	}
}
