/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.test;

import te.*;

/**
 * @author Kees Jongenburger
 */
public class TestFacadeImpl extends Facade {
	NavigationControl navigationComponent;

	public TestFacadeImpl(){
		navigationComponent = new XMLNavigationControl();
	}

    public NavigationControl getNavigationControl() {
        return navigationComponent;
    }

}
