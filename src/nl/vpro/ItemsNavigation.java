/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import org.mmbase.util.logging.*;

import te.*;

/**
 * @author keesj
 * @version $Id$
 */
public class ItemsNavigation extends AbstractNavigation {
    //TODO:EpisodeNavigation and ItemsNavigation need to be made generic
    private static Logger log = Logging.getLoggerInstance(ItemsNavigation.class);
    String name = "items";
    String id = "items";
    Navigations childNavigation = new Navigations();

    public ItemsNavigation() {
        super();
    }

    public String getID() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Navigations getChildNavigations() {
        return childNavigation;
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
                if (childNavigation.getNavigationByName(number) == null) {
                    StaticNavigation nav = new StaticNavigation(number, number);
                    nav.setParentNavigation(this);
                    nav.setProperty("type", "itempage");
					nav.setProperty("nodemanager", "items");
					nav.setProperty("number", number);
                    nav.setParentNavigation(this);
                    childNavigation.add(nav);
                }
                log.debug("current item = " + number);
                
            } catch (NumberFormatException e) {
            }
            path.previous();
        }
        return super.resolveNavigation(path);
    }
}
