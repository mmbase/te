/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package te;

/**
 * @author keesj
 * @version $Id$
 */
public class StaticNavigation extends AbstractNavigation {
    String id;
    String name;
    Navigations childs;
    Navigation parent = null;

    NavigationControl navigationControl;

    public StaticNavigation(String id, String name) {
        this.id = id;
        this.name = name;
        childs = new Navigations();
    }

    public Navigation addChild(Navigation nav) {
        nav.setParentNavigation(this);
        childs.add(nav);
        return nav;
    }

    public String getID() {
        return id;
    }

    public String getName() {

        return name;
    }

    /* (non-Javadoc)
     * @see te.AbstractNavigation#getChildNavigations()
     */
    public Navigations getChildNavigations() {
        return childs;
    }
}
