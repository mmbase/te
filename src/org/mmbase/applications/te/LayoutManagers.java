/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package org.mmbase.applications.te;

import java.util.Vector;

/**
 * @author keesj
 * @version $Id$
 */
public class LayoutManagers extends Vector {
	public LayoutManagers(){
		super();
	}
	
	public LayoutManager getLayoutManager(int index){
		return (LayoutManager)get(index);
	}
	
	public LayoutManager getLayoutManagerByName(String name){
		for (int x = 0 ; x < size() ; x++){
			LayoutManager lm = getLayoutManager(x);
			if (lm.getName().equals(name)) return lm;
		}
		return null;
	} 
}
