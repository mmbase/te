/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;

import java.util.*;
import te.util.*;
/**
 * @author Kees Jongenburger
 */
public abstract class AbstractNavigation implements Navigation {
    Navigation parent = null;
    Properties properties;

    NavigationControl navigationControl;

    public AbstractNavigation() {
        properties = new Properties();
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
        return getNavigationControl().getURLString(this);
    }
    /**
     * @return the child navigations of this component
     */
    public abstract Navigations getChildNavigations() ;
        

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
}
