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

import org.mmbase.util.logging.*;
import java.util.*;
/**
 * @author Kees Jongenburger
 */
public class ProgrammasitesNavigationControl extends NavigationControl {
	private static Logger log = Logging.getLoggerInstance(ProgrammasitesNavigationControl.class);
	
    StaticNavigation navigation;
    private Cloud _cloud;
    public ProgrammasitesNavigationControl() {
        Cloud cloud = ContextProvider.getDefaultCloudContext().getCloud("mmbase");
        NodeManager nodeManager = cloud.getNodeManager("maps");
        NodeList list = nodeManager.getList("number =3302425 or number = 8884132 or number= 3517269 or number = 14055733", null, null);
        navigation = new StaticNavigation("1", "root");
        navigation.setVisible(false);
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
        String templateName = navigation.getProperty("type");
        return getTemplate(templateName);
    }

    private Template getTemplate(String name) {
        Cloud cloud = getCloud();
        NodeManager nm = cloud.getNodeManager("templates");
        NodeList list = nm.getList("name = '" + name + "' ", null, null);
        if (list.size() == 1) {
            String content = list.getNode(0).getStringValue("content");
            XMLStorage store = new XMLStorage();
            Component c = store.stringToComponent(content);
            return (Template) c;
        } else {
    		log.error("can not find template with name {"+ name+"} navigation");    	
            return null;
        }
    }

    private Cloud getCloud() {
        if (_cloud == null || !_cloud.getUser().isValid()) {
            CloudContext cloudContext = ContextProvider.getCloudContext("rmi://localhost:1111/templates");
            HashMap user = new HashMap();
            user.put("username", "admin");
            user.put("password", "admin2k");
            _cloud = cloudContext.getCloud("mmbase", "name/password", user);
        }
        return _cloud;
    }
}
