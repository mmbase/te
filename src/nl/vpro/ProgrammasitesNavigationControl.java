/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import te.*;
import te.jsp.*;
import org.mmbase.bridge.*;
/**
 * @author Kees Jongenburger
 */
public class ProgrammasitesNavigationControl extends NavigationControl {
    StaticNavigation navigation;

    public ProgrammasitesNavigationControl() {
        Cloud cloud = ContextProvider.getDefaultCloudContext().getCloud("mmbase");
        NodeManager nodeManager = cloud.getNodeManager("maps");
        NodeList list = nodeManager.getList("number =3302425 ", null, null);
        navigation = new StaticNavigation("1", "root");
        for (int x = 0; x < list.size() ;x++) {
            navigation.addChild(new MapsNavigation(list.getNode(x)));
        }
        //navigation = new StaticNavigation("3302425", "De Wandelende Tak");
        navigation.setNavigationControl(this);
    }

    public AbstractNavigation getNavigation() {
        return navigation;
    }

    public Template getTemplate(AbstractNavigation navigation) {
        if (navigation.getProperty("template") != null) {
            JSPTemplate t = new JSPTemplate(navigation.getProperty("template"), null);
            t.setMapRenderRelativeToRender(true);
            return t;
        }
        //return new EditTemplate();
        //return new JSPTemplate("/te/template/notimplemented.jsp", null);
        return new JSPTemplate("/te/template/maps.jsp", null);
    }
}
