/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/

package te;

import java.util.*;
import te.util.*;
import org.mmbase.util.logging.*;

/**
 * @author Kees Jongenburger
 */

public abstract class AbstractNavigation implements Navigation {
    private static Logger log = Logging.getLoggerInstance(AbstractNavigation.class);
    Navigation parent = null;
    Properties properties = new Properties();
    boolean visible = true;
    NavigationControl navigationControl;

    public AbstractNavigation() {

    }

    public boolean isRootNavigation() {
        return parent == null;
    }

    public void setParentNavigation(Navigation navigation) {
        this.parent = navigation;
    }

    public void setProperty(String key, String value) {
        properties.setProperty(key, value);
    }
    
    /** 
     * @return unique id of this navigation typicaly a number
     */
    public abstract String getID();

    /** 
     * @return the name of the navigation nieuws
     */
    public abstract String getName();

    public Navigation getChildByName(String name) {
        Navigations navs = getChildNavigations();
        for (int x = 0; x < navs.size(); x++) {
            Navigation nav = navs.getNavigation(x);
            if (nav.getName().equals(name)) {
                return nav;
            }
        }
        return null;
    }
    /**
     * 
     * @return the escaped name of the navigation
     */
    public String getURLString() {
        return URLConverter.toURL(getName());
    }

    public String getFullURLString() {
        NavigationControl nc = getNavigationControl();
        return nc.getURLString(this);
    }

    /**
     * @return the child navigations of this component
     */
    public abstract Navigations getChildNavigations();

    /**
     * @return the parent navigation of the component
     */
    public Navigation getParentNavigation() {
        return parent;
    }

    /** 
     * @return the properties of the navigation
     */
    public Properties getProperties() {
        return properties;
    }

    public String getProperty(String key) {
        return properties.getProperty(key);
    }

    public void setNavigationControl(NavigationControl navigationControl) {
        this.navigationControl = navigationControl;
    }

    public NavigationControl getNavigationControl() {
        if (navigationControl != null) {
            return navigationControl;
        } else if (!isRootNavigation()) {
            return parent.getNavigationControl();
        }
        return null;
    }

    public Template getTemplate() {
        return getNavigationControl().getTemplate(this);
    }

    public boolean isVisible() {
        return visible;
    }

    public void setVisible(boolean visible) {
        this.visible = visible;
    }

    public Navigation resolveNavigation(Path path) {
        //if the current navigation is not visible call the child navigations and try to resolve
        if (!isVisible()) {
            log.debug("nav " + getName() + " not visible trying child navigations");
            Navigations navs = getChildNavigations();
            for (int x = 0; x < navs.size(); x++) {
                Navigation resolved = navs.getNavigation(x).resolveNavigation(path);
                if (resolved != null) {
                    log.debug("nav " + getName() + " child navigation returned true" + resolved.getName());
                    return resolved;
                }
            }
            //the current navigaiton was not visible and the child navigations did not return a valid navigation
            //so te retrun null
            return null;
        }

        //the current navigation is visible
        //take the current element in the path
        if (path.hasCurrent()) {
            String currentPath = path.current(); // this is the current path
            if (currentPath.equals(getURLString())) {
                //if there are more elements in the path try to resolve them
                if (path.hasNext()) {
                    path.next();
                    Navigations navs = getChildNavigations();
                    for (int x = 0; x < navs.size(); x++) {
                        Navigation theChild = navs.getNavigation(x);
                        Navigation resolved = theChild.resolveNavigation(path);
                        if (resolved != null) {                        	
                            return resolved;
                        }
                    }
                    path.previous();
                }
                return this;
            }
        }
        return null;
    }
}