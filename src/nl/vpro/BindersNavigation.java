/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import org.mmbase.util.logging.*;
import org.mmbase.bridge.*;
import te.*;

/**
 * @author keesj
 * @version $Id$
 */
public class BindersNavigation extends AbstractNavigation {
    //TODO:EpisodeNavigation and ItemsNavigation need to be made generic
    private static Logger log = Logging.getLoggerInstance(BindersNavigation.class);
    String name = "Dossiers";
    String id = "binders";

    public BindersNavigation() {
        super();
        setProperty("type", "binderspage");
    }

    public String getID() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Navigation resolveNavigation(Path path) {
        //the current nav
        if (path.hasCurrent()) {
            String name = path.current();
            if (!name.equals(getURLString())) {
                return null;
            }
        }

        //the item number
        if (path.hasNext()) {
            String number = path.next();
            try {
                Integer.parseInt(number);
                if (getChildByName(number) == null) {
                    try {
                        Cloud cloud = ContextProvider.getDefaultCloudContext().getCloud("mmbase");
                        Node node = cloud.getNode(number);
						StaticNavigation nav = new StaticNavigation(number, number);
						nav.setGUIName(node.getStringValue("title"));
						nav.setProperty("type", "binderpage");
						nav.setProperty("nodemanager", "binders");
						nav.setProperty("number", number);
						addChild(nav);
                    } catch (Throwable t) {
                        log.warn("invalid node number" + number);
                    }
                }
                log.debug("current binder = " + number);
            } catch (NumberFormatException e) {

            }
            path.previous();
        }
        return super.resolveNavigation(path);
    }
}
