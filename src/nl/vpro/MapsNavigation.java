/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import org.mmbase.bridge.*;
import org.mmbase.util.logging.*;

import te.*;

/**
 * @author keesj
 * @version $Id$
 */
public class MapsNavigation extends AbstractNavigation {
    private static Logger log = Logging.getLoggerInstance(MapsNavigation.class);
    public Node node;
    public MapsNavigation(Node node) {
        this.node = node;
        if (node.getStringValue("title").startsWith("Madi")) {
			setProperty("type", "weekhomepage");
        } else {
            setProperty("type", "episodeshomepage");
        }
        setProperty("maps", "" + node.getNumber());

    }

    public String getID() {
        return node.getStringValue("number");
    }

    public String getName() {
        return node.getStringValue("title");
    }

    public Navigations getChildNavigations() {
        Navigations retval = new Navigations();


        Navigation archive = new EpisodesNavigation();
        archive.setProperty("type", "episodepage");
        archive.setNavigationControl(getNavigationControl());
        archive.setParentNavigation(this);
        retval.add(archive);

		Navigation binders = new BindersNavigation();
		binders.setProperty("type", "binderpage");
		binders.setNavigationControl(getNavigationControl());
		binders.setParentNavigation(this);
		retval.add(binders);

        Navigation navigation = new StaticNavigation("edit", "edit");
        navigation.setProperty("template", "/te/edit/index.jsp");
        navigation.setNavigationControl(getNavigationControl());
        navigation.setParentNavigation(this);
        retval.add(navigation);

        return retval;
    }

    /* (non-Javadoc)
     * @see te.NavigationResolver#resolveNavigation(java.lang.String, te.WhiteBoard)
     */
    public Navigation resolveNavigation(String path, WhiteBoard wb) {

        Navigation nav = super.resolveNavigation(path, wb);
        if (nav != null) {
            log.debug("setting current maps (program){" + node.getStringValue("title") + "} in whiteboard.");
            wb.getHttpServletRequest().setAttribute("maps", "" + node.getNumber());
        }
        return nav;
    }
}
