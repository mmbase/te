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
    private Cloud _cloud;

    public ProgrammaSiteMMBaseNavigation() {
        super();
        type = "maps";
        field = "title";
    }

    public Navigation resolveNavigation(Path path) {

        log.debug("resolve " + path.current());
        String current = path.current();

        //get the list of sites managed for this entry (programmasites) and create a query 
        //for the maps object
        Hashtable siteMapsHash = new Hashtable();
        StringBuffer sb = new StringBuffer();
        Cloud templateCloud = getTemplateCloud();
        NodeList sites = templateCloud.getNodeManager("programmasites").getList("state <> 0", null, null);
        for (int x = 0; x < sites.size(); x++) {
            Node theNode = sites.getNode(x);
            sb.append("number = " + theNode.getIntValue("maps"));
            siteMapsHash.put(theNode.getStringValue("maps"), theNode);
            if (x + 1 < sites.size()) {
                sb.append(" OR ");
            }
        }

        String constraints = sb.toString();
        if (sites.size() == 0) {
            log.debug("not programmasites nodes found");
            return null;
        }

        Cloud cloud = getCloud();
        NodeManager nm = getCloud().getNodeManager("maps");
        NodeList nl = nm.getList(constraints, null, null);
        Node node = null;

        String navName = null;
        for (int x = 0; x < nl.size(); x++) {
            Node nodeFromList = nl.getNode(x);
            String nodeField = nodeFromList.getStringValue("title");
            log.debug("try to map " + nodeField + "/" + current);
            String oldPath = nodeFromList.getStringValue("path");
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
            if (current.equals(URLConverter.toURL(nodeField))) {
                log.debug("found node based on field" + field);
                navName = nodeField;
                node = nodeFromList;
                break;
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

        //find back the programmasite via the hash and select the right frontpage template
        Node siteNode = (Node) siteMapsHash.get("" + node.getNumber());
        Node templateNode = templateCloud.getNode(siteNode.getIntValue("frontpage"));
        st.setProperty("type", templateNode.getStringValue("name"));
        log.debug("creating a new Navigation for " + path.current() + " result style ={"+templateNode.getStringValue("name") +"} \n" + st.toString());
        st.setProperty("programmasites","" +siteNode.getNumber());
        getParentNavigation().addChild(st);
        return st.resolveNavigation(path);
    }

    private static Cloud getCloud() {
        return ContextProvider.getDefaultCloudContext().getCloud("mmbase");
        //return ContextProvider.getCloudContext("rmi://127.0.0.1:1111/remotecontext").getCloud("mmbase");
    }

    private Cloud getTemplateCloud() {
        if (_cloud == null || !_cloud.getUser().isValid()) {
            CloudContext cloudContext = ContextProvider.getCloudContext("rmi://localhost:1111/templates");
            HashMap user = new HashMap();
            user.put("username", "admin");
            user.put("password", "admin2k");
            _cloud = cloudContext.getCloud("mmbase", "name/password", user);
        }
        return _cloud;
    }
}
