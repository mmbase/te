/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;

import java.io.*;
import java.util.*;

import minixml.*;

import org.mmbase.util.logging.*;
import org.mmbase.bridge.*;
import te.jsp.*;
import te.util.*;
/**
 * @author Kees Jongenburger
 */
public class XMLNavigationControl extends NavigationControl {
    private static Logger log = Logging.getLoggerInstance(XMLNavigationControl.class);
    Navigation navigation;

    public XMLNavigationControl() {
        XMLElement xmle = new XMLElement();
        try {
            xmle.parseFromReader(new InputStreamReader(this.getClass().getResourceAsStream("navigation.xml")));
        } catch (XMLParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        navigation = NavigationLoader.parseXML(xmle.toString());

        navigation.setNavigationControl(this);
        initPaths(xmle);
    }

    public Navigation getNavigation() {
        return navigation;
    }

    public Template getTemplate(Navigation navigation) {
        NavigationControl control = navigation.getNavigationControl();

        if (navigation.getProperty("template") != null) {
            JSPTemplate t = new JSPTemplate(navigation.getProperty("template"), null);
            t.setMapRenderRelativeToRender(true);
            return t;
        }

        if (control == this) {
            return new JSPTemplate("/te/index.jsp?id=" + navigation.getID(), null);
        } else {
            return control.getTemplate(navigation);
        }
    }

    public static void main(String[] argv) {
        Logging.configure("/home/keesj/mmsite/WEB-INF/config/log/log.xml");
        XMLNavigationControl c = new XMLNavigationControl();
        System.err.println(c.getNavigation());
        Navigation nav = c.resolveNavigation(new Path("de_wandelende_tak/"));
        //createpath maps[number]/episodes

        //Navigation nav = c.resolveNavigation(new Path("admin"));
        if (nav != null) {
            System.err.println(nav.toString());
            System.err.println(nav.getFullURLString());
            System.err.println(nav.getProperties());
        } else {
        }
        System.err.println("\n" + c.getNavigation());
        log.debug("finished");
    }

    private Paths _paths = new Paths();

    public Paths getPaths() {
        return _paths;
    }

    /**
     * @param xmle the xml configuration
     */
    private void initPaths(XMLElement xmle) {
        if (xmle.getTagName().equals("property")) {
            return;
        }
        Stack stack = new Stack();
        XMLElement current = xmle;
        do {
            stack.push(current);
            //iklog.debug(current.getParent()); 
        } while ((current = current.getParent()) != null);

        StringBuffer rules = new StringBuffer();
        while (!stack.empty()) {
            XMLElement x = (XMLElement) stack.pop();
            String tagName = x.getTagName();
            //skip entry points
            if (tagName.equals("entrypoint")) {
                continue;
            }
            //navigation is static
            if (tagName.equals("navigation")) {
                if ("false".equals(x.getProperty("visible"))) {
                    continue;
                }
                rules.append(URLConverter.toURL(x.getProperty("name")));
            } else if (tagName.equals("navigationparam")) {
                rules.append("${");
                rules.append(x.getProperty("type"));
                rules.append(".");
                rules.append(x.getProperty("field"));
                rules.append("}");
            }
            rules.append("/");
        }
        //skip navigations with no property childs
        boolean hasPropertyChild = false;
        Enumeration enum = xmle.enumerateChildren();
        while (enum.hasMoreElements()) {
            XMLElement child = (XMLElement) enum.nextElement();
            if (child.getTagName().equals("property")) {
                hasPropertyChild = true;
            }
        }
        if (hasPropertyChild) {
            _paths.add(new Path(rules.toString()));
            rules = null;
        }

        for (int x = 0; x < xmle.countChildren(); x++) {
            XMLElement child = xmle.getChildAt(x);
            initPaths(child);
        }
    }

    /* (non-Javadoc)
     * @see te.NavigationControl#resoveURL(te.Navigation, java.util.List)
     */
    public String resoveURL(Navigation currentNavigation, List params) {
        Hashtable hash = new Hashtable();

        Paths p = new Paths();
        p.addAll(getPaths());

        log.debug("resolve URL " + currentNavigation.getFullURLString() + " " + params);

        //descriminate by removing the impossible paths
        for (int x = 0; x < params.size(); x++) {
            Object o = params.get(x);
            if (o instanceof Node) {
                Node node = (Node) params.get(0);
                String type = node.getNodeManager().getName();
                //find a navigation with this type
                Iterator iter = p.iterator();
                while (iter.hasNext()) {
                    Path path = (Path) iter.next();
                    String fullpath = path.fullPath;
                    if (fullpath.indexOf("${" + type) == -1) {
                        iter.remove();
                    } else {
                        if (hash.get(type) == null) {
                            hash.put(type, node);
                        }
                    }
                }
            } else if (o instanceof String) {
                Iterator iter = p.iterator();
                while (iter.hasNext()) {
                    Path path = (Path) iter.next();
                    String fullpath = path.fullPath;
                    if (fullpath.indexOf((String) o) == -1) {
                        iter.remove();
                    }
                }
            }
        }

        log.debug("after handling params " + p);

        //create a list of information avaiable in the curren path

        Navigation e = currentNavigation;
        do {
            //log.debug(e);
            if (e instanceof NavigationParam) {
                NavigationParam par = (NavigationParam) e;
                if (hash.get(par.getType()) == null) {
                    hash.put(par.getType(), par);
                }
            }

            /* else if (e instanceof Navigation) {
                Navigation nav = (Navigation) e;
                //TODO getID of getName?
                //hash.put(nav.getURLString(), nav);
                //log.debug("add " + nav.getURLString());
                hash.put(nav.getURLString(), nav);
            } */
        } while ((e = e.getParentNavigation()) != null);

        log.debug("hash:" + hash);
        Paths retval = new Paths();
        //goto every path and start filling vars if it fails... it's not what we want
        for (int z = 0; z < p.size(); z++) {
            Path current = p.getPath(z).newInstance();
            StringBuffer sb = new StringBuffer();
            boolean done = false;
            while (current.hasCurrent() && !done) {
                String var = current.current();
                if (var.startsWith("${")) {
                    String type;
                    String field;
                    StringTokenizer st = new StringTokenizer(var.substring(2), ".}");
                    type = st.nextToken();
                    field = st.nextToken();
                    Object o = hash.get(type);
                    if (o != null) {
                        if (o instanceof NavigationParam) {
                            NavigationParam param = (NavigationParam) o;
                            log.debug("adding param " + param.getURLString());
                            sb.append(param.getURLString());
                            sb.append("/");
                        } else if (o instanceof Node) {
                            Node node = (Node) o;
                            log.debug("adding node " + node.getStringValue(field));
                            sb.append(URLConverter.toURL(node.getStringValue(field)));
                            sb.append("/");
                        } else {
                            log.debug("I don't know what to do with objects of type " + o.getClass().getName() + " " + o);
                            //p.remove(z);
                            //z--;
                            //done = true;

                        }
                    } else {
                        log.debug("failed to get type " + type);
                        p.remove(z);
                        z--;
                        done = true;
                    }
                } else {
                    log.debug("append string " + var);
                    sb.append(var);
                    sb.append("/");
                }
                if (!done) {

                    if (current.hasNext()) {
                        current.next();
                    } else {
                        log.debug("FOUND VALID NAVIGATION " + sb.toString());
                        retval.add(new Path(sb.toString()));
                        done = true;
                    }
                }
            }
        }
        if (retval.size() > 1) {
            log.warn("remaining " + retval);
        } else if (retval.size() != 1) {
            log.error("there are multiple path" + retval);

        }
        //there are still multiple paths
        return Engine.getFacade().getEngineURL() + retval.getPath(0).fullPath;

    }
}