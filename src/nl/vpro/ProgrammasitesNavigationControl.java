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
        NodeList list = nodeManager.getList("number =3302425 or number = 8884132 or number= 3517269 or number = 14055733", null, null);
        navigation = new StaticNavigation("1", "root");
        for (int x = 0; x < list.size(); x++) {
            navigation.addChild(new MapsNavigation(list.getNode(x)));
        }

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
        String fileName = navigation.getProperty("type");
        
        XMLStorage store = new XMLStorage();
        BufferedReader br = new BufferedReader(new InputStreamReader(this.getClass().getResourceAsStream(fileName + ".xml")));
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
        Component c = store.stringToComponent(xmlData);
        return (Template) c;
    }
}
