/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.edit;

import te.*;

/**
 * @author Kees Jongenburger
 */
public class EditNavigationControl extends NavigationControl {
	Navigation navigation;
    
    public EditNavigationControl(){
		navigation = new Navigation(null,"sadf","edit");
		navigation.setNavigationControl(this);
    }

    public Navigation getNavigation() {
    	return navigation;
    }

    public Template getTemplate(Navigation navigation) {
    	return new EditTemplate(); 
    	//return new JSPTemplate("/te/template/notimplemented.jsp",null);
    }
}
