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
    private Node node;
    Navigations childs = new Navigations();
    public MapsNavigation(Node node) {
        this.node = node;
        if (node.getStringValue("title").startsWith("Madi")) {
            setProperty("type", "weekhomepage");
        } else {
            setProperty("type", "episodeshomepage");
        }
        setProperty("nodemanager", "maps");
        setProperty("number", "" + node.getNumber());

        Navigation archive = new EpisodesNavigation();
        archive.setNavigationControl(getNavigationControl());
        archive.setParentNavigation(this);
        childs.add(archive);

        Navigation binders = new BindersNavigation();
        binders.setProperty("type", "binderpage");
        binders.setNavigationControl(getNavigationControl());
        binders.setParentNavigation(this);
        childs.add(binders);

        Navigation search = new StaticNavigation("search", "zoeken");
        search.setProperty("type", "searchpage");
        search.setNavigationControl(getNavigationControl());
        search.setParentNavigation(this);
        childs.add(search);

    }

    public String getID() {
        return node.getStringValue("number");
    }

    public String getName() {
        return node.getStringValue("title");
    }
    

    public Navigations getChildNavigations() {
    	return childs;
    }
}
