/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import org.mmbase.bridge.Node;

import te.*;

import org.mmbase.util.logging.*;
import java.util.*;

/**
 * @author keesj
 * @version $Id$
 */
public class MapsNavigation extends AbstractNavigation implements NavigationResolver {
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

        /*
                    NodeList list = node.getCloud().getList(getID(), //startnodes     
                "maps,posrel,programs", //nodepath
                "maps.number,maps.number,posrel.number,posrel.pos,programs.number,programs.title", // fields
                "", //constraints
                "posrel.pos", //orderby
                "down", //directions
                "BOTH", //searchdir
                false // distrinct
            );
            	Navigations navigations= new Navigations();
            	for (int x =0 ; x < list.size() ; x++){
            		Node node = list.getNode(x);
            		StaticNavigation nav = new StaticNavigation(node.getStringValue("programs.number"),node.getStringValue("programs.title"));
            		nav.setProperty("pos",node.getStringValue("posrel.pos"));
            		navigations.add(nav);
            	}
            	return navigations;
            	*/
        return retval;
    }

    /* (non-Javadoc)
     * @see te.NavigationResolver#resolveNavigation(java.lang.String, te.WhiteBoard)
     */
    public Navigation resolveNavigation(String path, WhiteBoard wb) {
        log.debug(getFullURLString() + " resolving " + path);
        StringTokenizer st = new StringTokenizer(path, NavigationControl.PATH_SEPARATOR);

        Navigation currentNavigation = this;
        log.debug("setting current maps (program){" + node.getStringValue("title") + "} in whiteboard.");
        wb.getHttpServletRequest().setAttribute("maps", node);
        while (st.hasMoreTokens()) {
            String currentPath = st.nextToken();
            Navigations navigations = currentNavigation.getChildNavigations();
            for (int x = 0; x < navigations.size(); x++) {
                AbstractNavigation navigation = navigations.getNavigation(x);
                if (navigation.getURLString().equals(currentPath)) {
                    if (navigation instanceof NavigationResolver) {
                        StringTokenizer newTokenizer = new StringTokenizer(path, NavigationControl.PATH_SEPARATOR, true);
                        if (newTokenizer.countTokens() > 2) {
                            newTokenizer.nextToken(); // the current nav
                            newTokenizer.nextToken(); // the delimiter
                            StringBuffer newPath = new StringBuffer();
                            while (newTokenizer.hasMoreTokens()) {
                                newPath.append(newTokenizer.nextToken());
                            }
                            return ((NavigationResolver) navigation).resolveNavigation(newPath.toString(), wb);
                        }
                    }
                    currentNavigation = navigation;
                    break;
                }
            }
        }
        return currentNavigation;
    }
}
