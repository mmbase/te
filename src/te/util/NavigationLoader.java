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
        Navigation nav = createNavigation(null, xmle);
        return nav;
    }

    private static Navigation createNavigation(Navigation parent, XMLElement xmle) {
        if (xmle.getTagName().equals("entrypoint")) {
            String className = xmle.getProperty("class");
            Class entryClass;
            try {
                entryClass = Class.forName(className);
                NavigationControl control = (NavigationControl) entryClass.newInstance();
                return control.getNavigation();
            } catch (ClassNotFoundException e) {
                log.warn("the xml entry " + xmle + " does not contain a valid class\n" + Logging.stackTrace(e));
            } catch (InstantiationException e) {
                log.warn(Logging.stackTrace(e));
            } catch (IllegalAccessException e) {
                log.warn(Logging.stackTrace(e));
            }
            return null;
        } else {
            StaticNavigation nav = new StaticNavigation(xmle.getProperty("id"), xmle.getProperty("name"));
            if (xmle.getProperty("visible") != null && xmle.getProperty("visible").equals("false")) {
                nav.setVisible(false);
            }

            for (int x = 0; x < xmle.countChildren(); x++) {
                XMLElement child = xmle.getChildAt(x);
                if (child.getTagName().equals("navigation")) {
                    nav.addChild(createNavigation(nav, xmle.getChildAt(x)));
                } else if (child.getTagName().equals("entrypoint")) {
                    nav.addChild(createNavigation(nav, xmle.getChildAt(x)));                    
                } else if (child.getTagName().equals("property")) {
                    nav.setProperty(child.getProperty("name"), child.getContents());
                }
            }
            return nav;
        }
    }
}
