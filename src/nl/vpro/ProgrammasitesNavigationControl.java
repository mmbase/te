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
        for (int x = 0; x < list.size(); x++) {
            navigation.addChild(new MapsNavigation(list.getNode(x)));
        }

        //navigation = new StaticNavigation("3302425", "De Wandelende Tak");
        navigation.setNavigationControl(this);
    }

    public Navigation getNavigation() {
        return navigation;
    }

    public Template getTemplate(Navigation navigation) {
        if (navigation.getProperty("template") != null) {
            JSPTemplate t = new JSPTemplate(navigation.getProperty("template"), null);
            t.setMapRenderRelativeToRender(true);
            return t;
        }
        //return new EditTemplate();
        //return new JSPTemplate("/te/template/notimplemented.jsp", null);
        //Template t =  new JSPTemplate("/te/template/default.jsp",new ProgrammaSiteLayoutManager());

        // create a default page (with a list layout

        //this code needs to be in an xml
        Template t = new JSPTemplate("/te/template/default.jsp", new JSPLayoutManager("/te/layout/default.jsp"));
        //add page head
        t.addComponent(new JSPComponent("/te/component/page_head.jsp"), "page_head");
        //add the navigation
        t.addComponent(new ProgrammaSiteNavigationComponent(), "navigation");
        Container container = new JSPContainer("/te/container/default.jsp", new JSPLayoutManager("/te/layout/horizontal.jsp"));
        container.addComponent(new JSPComponent("/te/component/maps.jsp"), "maps intro");
        container.addComponent(new JSPContainer("/te/container/episodes.jsp",new JSPLayoutManager("/te/layout/vertical.jsp")), "episodes");
        container.addComponent(new JSPComponent("/te/component/related_news.jsp"), "news");
        t.addComponent(container);
        return t;
    }
}
