/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;

/**
 * @author keesj
 * @version $Id$
 */
public class Containers extends Components {
	public Containers(){
		super();
	}
	
	public Container getContainer(int index){
		return (Container)get(index);
	}
	
	public Container getContainerByName(String name){
		return (Container)getComponentByName(name);
	}
}
