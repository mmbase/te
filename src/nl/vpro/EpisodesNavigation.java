/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import java.util.*;

import te.*;
import org.mmbase.util.logging.*;
/**
 * @author keesj
 * @version $Id$
 */
public class EpisodesNavigation extends AbstractNavigation {
    private static Logger log = Logging.getLoggerInstance(EpisodesNavigation.class);
    String name = "afleveringen";
    String id = "episodes";
    Navigations realChildNav = new Navigations();

    public EpisodesNavigation() {
        super();
    }

    public String getID() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Navigations getChildNavigations() {
        Navigations retval = new Navigations();

        retval.addAll(realChildNav);
        return retval;
    }

    public Navigation resolveNavigation(String path, WhiteBoard wb) {
        StringTokenizer st = new StringTokenizer(path, NavigationControl.PATH_SEPARATOR);

        //the current nav
        if (st.hasMoreTokens()) {
            String name = st.nextToken();
            if (!name.equals(getURLString())) {
                return null;
            }
        }
        //the separator
        if (! st.hasMoreTokens()) {
            //if there was not spearator .. this navigation is the current navigation
            return this;
        }

        //the episode number
        if (st.hasMoreTokens()) {
            String number = st.nextToken();
            try {
                Integer.parseInt(number);
                log.debug("current episode = " + number);
                //create a navigation item
                if (realChildNav.getNavigationByName(number) == null) {
                    StaticNavigation nav = new StaticNavigation(number, number);
                    nav.setParentNavigation(this);
                    nav.setProperty("type", "episodepage");

                    Navigation navigation = new ItemsNavigation(); //new StaticNavigation("items", "items");
                    navigation.setProperty("type", "itempage");
                    navigation.setNavigationControl(getNavigationControl());
                    navigation.setParentNavigation(nav);
                    nav.addChild(navigation);

                    realChildNav.add(nav);

                }
                //nav.setNavigationControl(getNavigationControl());
                wb.getHttpServletRequest().setAttribute("episodes", number);
            } catch (NumberFormatException e) {
            }
        }
        return super.resolveNavigation(path, wb);
    }
}
