/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;

import java.util.*;

import org.mmbase.util.logging.*;

import te.util.*;
import minixml.*;
/**
 * @author keesj
 * @version $Id$
 * paramerted navigation is a navigation that consists of 2 path items
 * the first is the real name of the navigation. the second is a parameter
 * example /episodes/345632
 */
public class MMBaseNavigation extends AbstractNavigation implements Configurable {
    private static Logger log = Logging.getLoggerInstance(MMBaseNavigation.class);
    private String config = null;
    private String type;
    private String field;
    private String guifield;

    public MMBaseNavigation() {
        super();
        setVisible(false);
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getID() {
        return "${" + type + ",number}";
    }

    public String getName() {
        return "${" + type + "," + field + "}";
    }

    public String getGUIName() {
        if (guifield == null) {
            return getName();
        }
        return "${" + type + "," + guifield + "}";
    }

    /* (non-Javadoc)
     * @see te.ParamNavigation#setConfig(java.lang.String)
     */
    public void setConfig(String config) {
        this.config = config;
        XMLElement xmle = new XMLElement();
        xmle.parseString(config);
        this.type = xmle.getProperty("type");
        this.field = xmle.getProperty("field");
        this.guifield = xmle.getProperty("guifield");
        log.warn("initialised " + type + " " + field);
    }
    /* (non-Javadoc)
     * @see te.NavigationResolver#resolveNavigation(te.Path)
     */
    public Navigation resolveNavigation(Path path) {
        String current = path.current();
        if (field.equals("number")) {

            if (current.charAt(0) >= '0' && current.charAt(0) <= '9') {} else {
                log.debug(current + " is not a number");
                return null;
            }
        } else if (field.equals("title")) {
            Hashtable hash = new Hashtable();
            hash.put("test1", "true");
            hash.put("test2", "true");
            hash.put("test3", "true");
            if (hash.get(current) == null) {
                log.debug(current + " is no valid");
                return null;
            }
        }
        Navigation st = new NavigationParam(path.current(), path.current(),field,guifield,type);
        Navigation g = NavigationLoader.parseXML(config);
        Enumeration enum  = g.getProperties().keys();
        while(enum.hasMoreElements()){
        	String key = (String)enum.nextElement();
        	st.setProperty(key,g.getProperty(key));
        }
        
        
        Navigations n = g.getChildNavigations();
        for (int x = 0; x < n.size(); x++) {
            st.addChild(n.getNavigation(x));
        }
        n = g.getParamChilds();
        for (int x = 0; x < n.size(); x++) {
            st.addParamChild(n.getNavigation(x));
        }

        log.debug("creating a new Navigation for " + path.current() + " result \n" + st.toString());

        getParentNavigation().addChild(st);
        return st.resolveNavigation(path);
    }
}
