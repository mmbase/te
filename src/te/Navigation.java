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
public class Navigation {
    String id;
    String name;
    Navigations childs;
    Navigation parent = null;
    Properties properties;

    NavigationControl navigationControl;
    public Navigation(Navigation parent, String id, String name) {
        this.parent = parent;
        this.id = id;
        this.name = name;
        childs = new Navigations();
        properties = new Properties();
    }

    public Navigation addChild(Navigation nav) {
    	nav.setParentNavigation(this);
        childs.add(nav);        
        return nav;
    }

    public boolean isRootNavigation() {
        return parent == null;
    }

    public void setParentNavigation(Navigation navigation) {
        this.parent = navigation;
    }

    public void addProperty(String key, String value) {
        properties.setProperty(key, value);
    }
    /** 
     * @return unique id of this navigation typicaly a number
     */
    public String getID() {
        return id;
    }

    /** 
     * @return the name of the navigation nieuws
     */
    public String getName() {
        return name;
    }

	public Navigation getChildByName(String name){
		Navigations navs = getChildNavigations();
		for (int x =0 ; x < navs.size(); x++){
			Navigation nav = navs.getNavigation(x);
			if (nav.getName().equals(name)){
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

    /**
     * @return the child navigations of this component
     */
    public Navigations getChildNavigations() {
        return childs;
    }

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
    
    public Template getTemplate(){
    	return getNavigationControl().getTemplate(this);    
    }
}
