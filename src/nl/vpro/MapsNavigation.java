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
public class MapsNavigation extends AbstractResolvingNavigation  {
    private static Logger log = Logging.getLoggerInstance(MapsNavigation.class);
    public Node node;
    public MapsNavigation(Node node) {
        this.node = node;
        setProperty("type", "episodeshomepage");
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
        Navigation navigation = new StaticNavigation("edit", "edit");
        navigation.setProperty("template", "/te/edit/index.jsp");
        navigation.setNavigationControl(getNavigationControl());
        navigation.setParentNavigation(this);
        retval.add(navigation);

        Navigation archive = new StaticNavigation("episodes", "afleveringen");
        archive.setProperty("type", "episodepage");
        archive.setNavigationControl(getNavigationControl());
        archive.setParentNavigation(this);

        Navigation x = new StaticNavigation("edit", "edit");
        x.setProperty("template", "/te/edit/index.jsp");
        x.setNavigationControl(getNavigationControl());
        x.setParentNavigation(archive);
        ((StaticNavigation) archive).addChild(x);

        retval.add(archive);

        return retval;
    }

    /* (non-Javadoc)
     * @see te.NavigationResolver#resolveNavigation(java.lang.String, te.WhiteBoard)
     */
    public Navigation resolveNavigation(String path, WhiteBoard wb) {
        log.debug(getFullURLString() + " resolving " + path);
        
        log.debug("setting current maps (program){" + node.getStringValue("title") + "} in whiteboard.");
        wb.getHttpServletRequest().setAttribute("maps", node);
        return super.resolveNavigation(path,wb);
    }
}
