/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import te.*;
import org.mmbase.util.logging.*;
import java.util.*;

/**
 * @author keesj
 * @version $Id$
 */
public class BindersNavigation extends AbstractNavigation {
    //TODO:EpisodeNavigation and ItemsNavigation need to be made generic
    private static Logger log = Logging.getLoggerInstance(BindersNavigation.class);
    String name = "Dossiers";
    String id = "binders";
    Navigations childNavigation = new Navigations();

    public BindersNavigation() {
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
            return this;
        }

        //the item number
        if (st.hasMoreTokens()) {
            String number = st.nextToken();
            try {
                Integer.parseInt(number);
                if (childNavigation.getNavigationByName(number) == null) {
                    StaticNavigation nav = new StaticNavigation(number, number);
                    nav.setParentNavigation(this);
                    nav.setProperty("type", "binderpage");
                    nav.setParentNavigation(this);
                    childNavigation.add(nav);
                }
                log.debug("current binder = " + number);
                wb.getHttpServletRequest().setAttribute("binders", number);
            } catch (NumberFormatException e) {
            }
        }
        return super.resolveNavigation(path, wb);
    }
}
