/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package org.mmbase.applications.te;
import java.util.*;

/**
 * @author Kees Jongenburger
 */
public abstract class AbstractContainer extends AbstractComponent /*implements Container*/ {

    Components components = new Components();
    Hashtable hints = new Hashtable();
    LayoutManager layoutManager = null;

    public Components getComponents() {
        return components;
    }

    public void addComponent(Component component) {
        components.add(component);
        component.setParentComponent(this);
    }

    public void addComponent(Component component, String hint) {
        hints.put(component, hint);
        addComponent(component);
    }
    
    public LayoutManager getLayoutManager() {
        return layoutManager;
    }

    public void setLayoutManager(LayoutManager layoutManager) {
        this.layoutManager = layoutManager;
    }
}
