/*

This software is OSI Certified Open Source Software.
OSI Certified is a certification mark of the Open Source Initiative.

The license (Mozilla version 1.0) can be read at the MMBase site.
See http://www.MMBase.org/license

*/
package nl.vpro;

import te.jsp.JSPComponent;

/**
 * @author keesj
 * @version $Id$
 */
public class ProgrammaSiteNavigationComponent extends JSPComponent {

    public ProgrammaSiteNavigationComponent() {
        super("/te/component/navigation.jsp");
        setProperty("showLogs", "flase");
        setProperty("showForums", "flase");
        setProperty("showBinders", "flase");
        setProperty("showArchives", "flase");
    }

    /**
     * @return
     */
    public boolean isShowArchives() {
        return Boolean.getBoolean(getProperty("showArchives"));
    }

    /**
     * @return
     */
    public boolean isShowBinders() {
        return Boolean.getBoolean(getProperty("showBinders"));
    }

    /**
     * @return
     */
    public boolean isShowForums() {
        return Boolean.getBoolean(getProperty("showForums"));
    }

    /**
     * @return
     */
    public boolean isShowLogs() {
        return Boolean.getBoolean(getProperty("showLogs"));
    }
}
