/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.util;

import te.*;
import minixml.*;
import java.util.*;

/**
 * @author keesj
 * @version $Id$
 */
public class XMLStorage {

    public String componentToString(Component c) {
        return componentToXML(c).toString();
    }

    public XMLElement componentToXML(Component c) {
        XMLElement xmle = new XMLElement();
        if (c instanceof Template) {
            xmle.setTagName("template");
        } else if (c instanceof Container) {
            xmle.setTagName("container");
        } else {
            xmle.setTagName("component");
        }
        xmle.addProperty("name", "" + c.getName());
        Properties props = c.getProperties();
        Enumeration enum = props.keys();
        while (enum.hasMoreElements()) {
            String key = (String) enum.nextElement();
            String value = props.getProperty(key);
            XMLElement prop = new XMLElement();
            prop.setTagName("property");
            prop.addProperty("name", "" + key);
            prop.setContent(value);
            xmle.addChild(prop);
        }
        if (c instanceof Container) {
            Container cont = (Container) c;
            if (cont.getLayoutManager() != null) {
                xmle.addProperty("layout", "" + cont.getLayoutManager().getName());
            }
            Components childs = cont.getComponents();
            for (int x = 0; x < childs.size(); x++) {
                Component child = childs.getComponent(x);
                xmle.addChild(componentToXML(child));
            }
        }
        return xmle;
    }
    
    public String layoutManagerToString(LayoutManager lom){
    	return "";
    }
}
