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

    public MapsNavigation(Node node) {
        this.node = node;
        if (node.getStringValue("title").startsWith("Mag")) {
			setProperty("type", "magshomepage");
        } else if (node.getStringValue("title").startsWith("Madi")) {
            setProperty("type", "weekhomepage");
        } else {
            setProperty("type", "episodeshomepage");
        }
        setProperty("nodemanager", "maps");
        setProperty("number", "" + node.getNumber());

        addChild(new EpisodesNavigation());
        addChild(new BindersNavigation());
        addChild(new StaticNavigation("search", "zoeken")).setProperty("type", "searchpage");

    }

    public String getID() {
        return node.getStringValue("number");
    }

    public String getName() {
        return node.getStringValue("title");
    }

}
