/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import org.mmbase.util.logging.*;

import te.*;
import org.mmbase.bridge.*;

/**
 * @author keesj
 * @version $Id$
 */
public class EpisodesNavigation extends AbstractNavigation {
    private static Logger log = Logging.getLoggerInstance(EpisodesNavigation.class);
    String name = "Afleveringen";
    String id = "episodes";

    public EpisodesNavigation() {
        super();
        setProperty("type", "episodespage");
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
                log.debug("current episode = " + number);
                //create a navigation item
                if (getChildByName(number) == null) {
                    try {
                        Cloud cloud = ContextProvider.getDefaultCloudContext().getCloud("mmbase");
                        Node node = cloud.getNode(number);

                        StaticNavigation nav = new StaticNavigation(number, number);
                        nav.setGUIName(node.getStringValue("title"));
                        nav.setProperty("type", "episodepage");
                        nav.setProperty("nodemanager", "episodes");
                        nav.setProperty("number", number);
						nav.addChild(new ItemsNavigation());                                                
                        addChild(nav);
                    } catch (Throwable t) {
                        log.warn("invalid node number" + number);
                    }
                }
            } catch (NumberFormatException e) {
            }
            path.previous();
        }
        return super.resolveNavigation(path);
    }
}
