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
    StaticNavigation navigation;

    public EditNavigationControl() {
        navigation = new StaticNavigation("edit", "edit");
        navigation.setNavigationControl(this);
        AbstractNavigation configure = new StaticNavigation("configure", "configure");
        configure.setProperty("template","/te/edit/configure.jsp");
        navigation.addChild(configure);

    }

    public AbstractNavigation getNavigation() {
        return navigation;
    }

    public Template getTemplate(AbstractNavigation navigation) {
    	if (navigation.getProperty("template") != null){
			JSPTemplate t =  new JSPTemplate(navigation.getProperty("template"),null);
			t.setMapRenderRelativeToRender(true);
			return t;
    	}
        return new EditTemplate();
        //return new JSPTemplate("/te/template/notimplemented.jsp",null);
    }
}
