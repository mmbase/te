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
public class MagazinesNavigation extends AbstractNavigation {
    //TODO:EpisodeNavigation and ItemsNavigation need to be made generic
    private static Logger log = Logging.getLoggerInstance(MagazinesNavigation.class);
    String name = "Artikelen";
    String id = "magazines";

    public MagazinesNavigation() {
        super();
        setProperty("type", "magazinespage");
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
                    StaticNavigation nav = new StaticNavigation(number, number);
                    nav.setProperty("type", "newspage");
                    nav.setProperty("nodemanager", "news");
                    nav.setProperty("number", number);
                    addChild(nav);
                }
            } catch (NumberFormatException e) {

            }
            path.previous();
        }
        return super.resolveNavigation(path);
    }
}
