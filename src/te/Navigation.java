/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;

import java.util.Properties;

/**
 * @author keesj
 * @version $Id$
 */
public interface Navigation extends NavigationResolver {
    public abstract boolean isRootNavigation();
    public abstract void setParentNavigation(Navigation navigation);
    public abstract void setProperty(String key, String value);
    /** 
     * @return unique id of this navigation typicaly a number
     */
    public abstract String getID();
    /** 
     * @return the name of the navigation nieuws
     */
    public abstract String getName();
    public abstract Navigation getChildByName(String name);
    /**
     * 
     * @return the escaped name of the navigation
     */
    public abstract String getURLString();
    public abstract String getFullURLString();
    /**
     * @return the child navigations of this component
     */
    public abstract Navigations getChildNavigations();
    /**
     * @return the parent navigation of the component
     */
    public abstract Navigation getParentNavigation();
    /** 
     * @return the properties of the navigation
     */
    public abstract Properties getProperties();
    public abstract String getProperty(String key);
    public abstract void setNavigationControl(NavigationControl navigationControl);
    public abstract NavigationControl getNavigationControl();
    public abstract Template getTemplate();
    public boolean isVisible();
    public void setVisible(boolean visible);
}