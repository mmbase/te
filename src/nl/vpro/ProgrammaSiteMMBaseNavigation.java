/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import java.util.*;

import org.mmbase.bridge.*;
import org.mmbase.util.logging.*;

import te.*;
import te.util.*;
/**
 * @author keesj
 * @version $Id$
 */
public class ProgrammaSiteMMBaseNavigation extends MMBaseNavigation {
    private static Logger log = Logging.getLoggerInstance(MMBaseNavigation.class);
    public ProgrammaSiteMMBaseNavigation() {
        super();
        type = "maps";
        field = "title";
    }

    public Navigation resolveNavigation(Path path) {
        log.debug("resolve " + path.current());
        String current = path.current();
        Cloud cloud = getCloud();

        NodeManager nm = getCloud().getNodeManager("maps");
        NodeList nl = nm.getList("number = 14194448 or number = 14195688 or number =  14055733 or number = 3517269", null, null);
        Node node = null;
        
        String navName= null;
        for (int x = 0; x < nl.size(); x++) {
            Node nodeFromList = nl.getNode(x);
            String nodeField = nodeFromList.getStringValue("title");
            String oldPath = nodeFromList.getStringValue("path");
            if (current.equals(URLConverter.toURL(nodeField))) {
                log.debug("found node based on field" + field);
                navName = nodeField;
                node = nodeFromList;                
                break;
            } else {
                StringTokenizer st = new StringTokenizer(oldPath, "/");
                String lastPath = null;
                while (st.hasMoreTokens()) {
                    lastPath = st.nextToken();
                }
                if (lastPath != null) {
                    if (current.equals(lastPath)) {
						log.debug("found node based on path field in navigation" + field);
                        node = nodeFromList;
                        navName = current;
                        break;
                    }
                }
            }
        }

        if (node == null) {
            return null;
        }

        Navigation st = new NavigationParam("" + node.getNumber(), navName, field, guifield, type);
        if (guifield != null) {
            st.setGUIName(node.getStringValue(guifield));
        }
        Navigation g = NavigationLoader.parseXML(config);
        Enumeration enum = g.getProperties().keys();
        while (enum.hasMoreElements()) {
            String key = (String) enum.nextElement();
            st.setProperty(key, g.getProperty(key));
        }

        Navigations n = g.getChildNavigations();
        for (int x = 0; x < n.size(); x++) {
            st.addChild(n.getNavigation(x));
        }
        n = g.getParamChilds();
        for (int x = 0; x < n.size(); x++) {
            st.addParamChild(n.getNavigation(x));
        }

        log.debug("creating a new Navigation for " + path.current() + " result \n" + st.toString());

        getParentNavigation().addChild(st);
        return st.resolveNavigation(path);
    }

    private static Cloud getCloud() {
        return ContextProvider.getDefaultCloudContext().getCloud("mmbase");
        //return ContextProvider.getCloudContext("rmi://127.0.0.1:1111/remotecontext").getCloud("mmbase");
    }

}
