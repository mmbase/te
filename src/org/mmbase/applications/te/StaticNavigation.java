/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package org.mmbase.applications.te;

/**
 * @author keesj
 * @version $Id$
 */
public class StaticNavigation extends AbstractNavigation {
    String id;
    String name;

    public StaticNavigation(String id, String name) {
        super();
        this.id = id;
        this.name = name;
    }

    public String getID() {
        return id;
    }

    public String getName() {
        return name;
    }
}
