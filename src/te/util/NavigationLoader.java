/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te.util;

import minixml.XMLElement;
import te.*;

import org.mmbase.util.logging.*;

/**
 * Utility class to load a navigation based on an xml file
 * @author Kees Jongenburger
 */
public abstract class NavigationLoader {
    private static Logger log = Logging.getLoggerInstance(NavigationLoader.class);

    /**
    * load the navigation object from xml
    * the xml must follow the navigation.dtd
    * provided
    **/
    public static Navigation parseXML(String xml) {
        XMLElement xmle = new XMLElement();
        xmle.parseString(xml);
        return createNavigation(null, xmle);
    }

    private static Navigation createNavigation(Navigation parent, XMLElement xmle) {
        Navigation nav = new Navigation(parent, xmle.getProperty("id"), xmle.getProperty("name"));
        for (int x = 0; x < xmle.countChildren(); x++) {
            XMLElement child = xmle.getChildAt(x);
            if (child.getTagName().equals("navigation")) {
                nav.addChild(createNavigation(nav, xmle.getChildAt(x)));
            } else if (child.getTagName().equals("property")) {
                nav.addProperty(child.getProperty("name"), child.getContents());
            } else if (child.getTagName().equals("entrypoint")) {
                String className = child.getProperty("class");
                Class entryClass;
                try {
                    entryClass = Class.forName(className);
                    NavigationControl control = (NavigationControl)entryClass.newInstance();
                    Navigation nn = control.getNavigation();
                    nav.addChild(control.getNavigation());
                } catch (ClassNotFoundException e) {
                    log.warn("the xml entry " + child + " does not contain a valid class\n" + Logging.stackTrace(e));
                } catch (InstantiationException e) {
                    log.warn(Logging.stackTrace(e));
                } catch (IllegalAccessException e) {
                    log.warn(Logging.stackTrace(e));
                }
            }
        }
        return nav;
    }
}
