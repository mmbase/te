/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import java.util.*;

import minixml.*;

import org.mmbase.bridge.*;
import org.mmbase.util.logging.*;

import te.*;
import te.jsp.*;
import te.util.*;
/**
 * @author Kees Jongenburger
 */
public class ProgrammasitesNavigationControl extends NavigationControl implements Configurable {
    private static Logger log = Logging.getLoggerInstance(ProgrammasitesNavigationControl.class);

    Navigation navigation;
    String config = null;
    private Cloud _cloud;

    public ProgrammasitesNavigationControl() {
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

        Template t = getTemplate(templateName);
        //since the template is used in a differen faction then the template compoment
        //we set the name and description of the template again
        t.setName(templateName);
        return t;
    }

    private Template getTemplate(String name) {
        Cloud cloud = getCloud();
        NodeManager nm = cloud.getNodeManager("tetemplates");
        NodeList list = nm.getList("name = '" + name + "' ", null, null);
        if (list.size() == 1) {
            String content = list.getNode(0).getStringValue("content");
            XMLStorage store = new XMLStorage();
            Component c = store.stringToComponent(content);
            return (Template) c;
        } else {
            log.error("can not find template with name {" + name + "} navigation");
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

    /* (non-Javadoc)
     * @see te.Configurable#setConfig(java.lang.String)
     */
    public void setConfig(String config) {
        this.config = config;
        XMLElement e = new XMLElement();
        e.parseString(config);
        e.setTagName("navigation");
        e.addProperty("name", "test controler");
        e.addProperty("id", "testcontroler");
        navigation = NavigationLoader.parseXML(e.toString());
        navigation.setNavigationControl(this);
        navigation.setVisible(false);
        log.debug("Test navigation = " + navigation);
    }

    /* (non-Javadoc)
     * @see te.NavigationControl#resoveURL(te.Navigation, java.util.List)
     */
    public String resoveURL(Navigation currentNavigation, List params) {
        return getNavigation().getParentNavigation().getNavigationControl().resoveURL(currentNavigation, params);
    }
}
