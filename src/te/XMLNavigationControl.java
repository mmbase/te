/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;

import java.io.*;

import te.jsp.*;
import te.jsp.JSPTemplate;
import te.util.NavigationLoader;

/**
 * @author Kees Jongenburger
 */
public class XMLNavigationControl extends NavigationControl {

    Navigation navigation;
    
    public XMLNavigationControl() {
        BufferedReader br = new BufferedReader(new InputStreamReader(this.getClass().getResourceAsStream("navigation.xml")));
        StringWriter sw = new StringWriter();
        String data = null;
        try {
            while ((data = br.readLine()) != null) {
                sw.write(data);
            }
        } catch (IOException e) {
            throw new RuntimeException("can not load xml");
        }
        navigation = NavigationLoader.parseXML(sw.toString());
        navigation.setNavigationControl(this);
    }

    public Navigation getNavigation() {
        return navigation;
    }

    public Template getTemplate(Navigation navigation) {
        NavigationControl control = navigation.getNavigationControl();
        if (control == this) {
            //			return new JSPTemplate("/site/index.jsp?id=" + navigation.getID());
            
            LayoutManager layout = new JSPLayoutManager("/te/layout/default.jsp");
            
            Template t = new JSPTemplate("/te/template/default.jsp", layout);

            Component c = new JSPComponent("/te/component/navigation.jsp");
            c.setProperty("style", "breadcrum");
            t.addComponent(c, "breadcrum");

            Component c2 = new JSPComponent("/te/component/navigation.jsp");
            c2.setProperty("style", "sitenavigation");
            t.addComponent(c2, "sitenavigation");
            return t;
        } else {
            return control.getTemplate(navigation);
        }
    }
}
