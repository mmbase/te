/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;
import org.mmbase.bridge.*;
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
public class MMBaseNavigation extends AbstractNavigation implements ParamNavigation {
    private static Logger log = Logging.getLoggerInstance(MMBaseNavigation.class);
    private String config = null;
    private Node node;
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
        return "" + node.getNumber();
    }

    public String getName() {
        return null;//"MMBASE_PARAM_NAVIGATION";
    }

    public String getGUIName() {
        if (guifield == null) {
            return getName();
        }
        return node.getStringValue(guifield);
    }

	
    /* (non-Javadoc)
     * @see te.ParamNavigation#setConfig(java.lang.String)
     */
    public void setConfig(String config) {
       this.config = config;
       XMLElement xmle = new XMLElement();
       xmle.parseString(config);
       this.type = xmle.getProperty("type");
       this.field  = xmle.getProperty("field");
       this.guifield= xmle.getProperty("guifield"); 
       log.warn("initialised " + type  + " " + field);
    }
    /* (non-Javadoc)
     * @see te.NavigationResolver#resolveNavigation(te.Path)
     */
    public Navigation resolveNavigation(Path path) {
        log.debug("params resolving" + path.current());
        Navigation st = new StaticNavigation("hoi","hoi");
        Navigations n = NavigationLoader.parseXML(config).getChildNavigations();
        for (int x = 0 ; x < n.size() ; x++){
                st.addChild(n.getNavigation(x));
        }
        getParentNavigation().addChild(st);
        return st;
    }

}
