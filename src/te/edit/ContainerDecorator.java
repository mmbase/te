/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.edit;
import te.*;
import te.jsp.*;
/**
 * @author keesj
 * @version $Id$
 */
public class ContainerDecorator extends JSPContainer{
	Container container;
	public ContainerDecorator(Container container){
		super("/te/edit/containerdecorator.jsp",container.getLayoutManager());
		this.container = container;
	}
	
	public Container getDecoratedContainer(){
		return container;
	}
}
