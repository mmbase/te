/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import org.mmbase.bridge.*;

import te.*;
import te.jsp.*;
import te.util.*;

import java.io.*;
/**
 * @author Kees Jongenburger
 */
public class ProgrammasitesNavigationControl extends NavigationControl {
    StaticNavigation navigation;

    public ProgrammasitesNavigationControl() {
        Cloud cloud = ContextProvider.getDefaultCloudContext().getCloud("mmbase");
        NodeManager nodeManager = cloud.getNodeManager("maps");
        NodeList list = nodeManager.getList("number =3302425 or number = 8884132", null, null);
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

		XMLStorage store = new XMLStorage();
		
        BufferedReader br = new BufferedReader(new InputStreamReader(this.getClass().getResourceAsStream("episodeshomepage.xml")));
        StringWriter sw = new StringWriter();
        String data = null;
        try {
            while ((data = br.readLine()) != null) {
                sw.write(data);
            }
        } catch (IOException e) {
            throw new RuntimeException("can not load xml");
        }
        String xmlData = sw.toString();
		
		Component c = store.StringToComponent(xmlData);
        return (Template)c;
        /*
        Facade facade = Engine.getFacade();
        ComponentRegistry reg = facade.getComponentRegistry();

        Template main = reg.getTemplate("default");
        main.addComponent(reg.getComponent("page_head"));
        main.addComponent(reg.getComponent("navigation"));

        Container container = reg.getContainer("horizontal");

        container.addComponent(reg.getComponent("maps"), "maps intro");
        //container.addComponent(new JSPContainer("/te/container/episodes.jsp", new JSPLayoutManager("/te/layout/vertical.jsp", "test", "test")), "episodes");
        container.addComponent(reg.getComponent("related_news"), "news");
        main.addComponent(container);
        return main;
        */
    }

}
