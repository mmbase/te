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
        return new Navigations();
    }

    public Navigation resolveNavigation(String path, WhiteBoard wb) {
        StringTokenizer st = new StringTokenizer(path, NavigationControl.PATH_SEPARATOR);

        if (st.hasMoreTokens()) {
            String name = st.nextToken();
            if (!name.equals(getURLString())) {
                return null;
            }
        }
        if (st.hasMoreTokens()) {

            String number = st.nextToken();
            try {
                Integer.parseInt(number);
                log.debug("current episode = " + number);
                wb.getHttpServletRequest().setAttribute("episodes", number);
            } catch (NumberFormatException e) {
            }

        }
        return this;
        //return super.resolveNavigation(path, wb);
    }

}
