/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import org.mmbase.bridge.Node;

import te.*;

/**
 * @author keesj
 * @version $Id$
 */
public class MapsNavigation extends AbstractNavigation {
    public Node node;
    public MapsNavigation(Node node) {
        this.node = node;
        setProperty("nodemanager", node.getNodeManager().getName());

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
}
