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
 * @author Kees Jongenburger
 */
public class EditNavigationControl extends NavigationControl {
    Navigation navigation;

    public EditNavigationControl() {
        navigation = new Navigation("edit", "edit");
        navigation.setNavigationControl(this);
        Navigation configure = new Navigation("configure", "configure");
        configure.setProperty("template","/te/edit/configure.jsp");
        navigation.addChild(configure);

    }

    public Navigation getNavigation() {
        return navigation;
    }

    public Template getTemplate(Navigation navigation) {
    	if (navigation.getProperty("template") != null){
			return new JSPTemplate(navigation.getProperty("template"),null);
    	}
        return new EditTemplate();
        //return new JSPTemplate("/te/template/notimplemented.jsp",null);
    }
}
