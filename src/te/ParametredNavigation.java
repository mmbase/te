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
 * paramerted navigation is a navigation that consists of 2 path items
 * the first is the real name of the navigation. the second is a parameter
 * example /episodes/345632
 */
public class ParametredNavigation extends AbstractNavigation {

	private String name;
	private String id;
	
    public String getID() {
    	return id;
    }

    public String getName() {
        return name;
    }
}
