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
public class EpisodesNavigation extends AbstractNavigation {
    private static Logger log = Logging.getLoggerInstance(EpisodesNavigation.class);
    String name = "afleveringen";
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
                    StaticNavigation nav = new StaticNavigation(number, number);
                    nav.setProperty("type", "episodepage");
                    nav.setProperty("nodemanager", "episodes");
                    nav.setProperty("number", number);

                    Navigation navigation = new ItemsNavigation(); //new StaticNavigation("items", "items");
                    navigation.setProperty("type", "itempage");
                    nav.addChild(navigation);
                    addChild(nav);
                }
            } catch (NumberFormatException e) {
            }
            path.previous();
        }
        return super.resolveNavigation(path);
    }
}
